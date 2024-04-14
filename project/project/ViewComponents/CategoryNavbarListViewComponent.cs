using Microsoft.AspNetCore.Mvc;
using project.Data;

namespace project.ViewComponents
{
    public class CategoryNavbarListViewComponent : ViewComponent
    {
        private readonly projectContext _context;

        public CategoryNavbarListViewComponent(projectContext context)
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
