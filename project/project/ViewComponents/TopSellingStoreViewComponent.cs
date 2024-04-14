using Microsoft.AspNetCore.Mvc;
using project.Data;
using project.ViewModels;

namespace project.ViewComponents
{
    public class TopSellingStoreViewComponent : ViewComponent
    {
        private readonly projectContext _context;

        public TopSellingStoreViewComponent(projectContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke(string? loai)
        {
            var products = _context.Product.AsQueryable();
            var result = products.Select(p => new ProductVM
            {
                Id = p.Id,
                Name = p.Name,
                Price = p.Price,
                imgUrl = p.ImageUrl,
            });
            return View(result);
        }
    }
}
