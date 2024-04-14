using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project.Data;
using project.ViewModels;

namespace project.ViewComponents
{
    public class RelatedProductsViewComponent : ViewComponent
    {
        private readonly projectContext _context;

        public RelatedProductsViewComponent(projectContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync(int productId)
        {
            var relatedProducts = await _context.Product
                                                .OrderBy(p => p.Id)
                                                .Where(p => p.Id <= productId)
                                                .Take(4)
                                                .Select(p => new ProductVM
                                                {
                                                    Id = p.Id,
                                                    Name = p.Name,
                                                    Price = p.Price,
                                                    Description = p.Description,
                                                    CategoryId = p.CategoryId,
                                                    CategoryName = p.Category.Name, // Assuming Category has a Name property
                                                    imgUrl = p.ImageUrl
                                                })
                                                .ToListAsync();

            return View(relatedProducts);
        }
    }
}
