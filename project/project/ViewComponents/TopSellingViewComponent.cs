using Microsoft.AspNetCore.Mvc;
using project.Data;
using project.ViewModels;

namespace project.ViewComponents
{
    public class TopSellingViewComponent : ViewComponent
    {
        private readonly projectContext _context;

        public TopSellingViewComponent(projectContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke(string? loai)
        {
            var products = _context.Product.AsQueryable();
            if (loai != null)
            {
                products = products.Where(p => p.Category.Name == loai);
            }
            var result = products.Select(p => new ProductVM
            {
                Id = p.Id,
                Name = p.Name,
                Price = p.Price,
                CategoryId = p.CategoryId,
                imgUrl = p.ImageUrl,
                CategoryName = loai
            });
            return View(result);
        }
    }
}
