using Microsoft.AspNetCore.Mvc;
using project.Data;
using project.ViewModels;

namespace project.ViewComponents
{
    public class CategoryStoreListViewComponent : ViewComponent
    {
        private readonly projectContext _context;

        public CategoryStoreListViewComponent(projectContext context)
        {
            _context = context;
        }
        public IViewComponentResult Invoke()
        {
            var result = _context.Category.Select(p => new CategoryStoreVM
            {
                Id = p.Id,
                Name = p.Name,
                Count = p.Products.Count
            });
            return View(result);
        }
    }
}
