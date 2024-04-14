using Microsoft.AspNetCore.Mvc;
using project.Data;
using System.Linq;

namespace project.ViewComponents
{
    public class CategorySearchListViewComponent : ViewComponent
    {
        private readonly projectContext _context;

        public CategorySearchListViewComponent(projectContext context)
        {
            _context = context;
        }

        public IViewComponentResult Invoke()
        {
            var categories = _context.Category.ToList();

            return View(categories);
        }
    }
}
