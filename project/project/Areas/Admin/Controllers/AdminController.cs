using Microsoft.AspNetCore.Mvc;
using project.Data;
using project.ViewModels;

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminController : Controller
    {
        private readonly projectContext _context;

        public AdminController(projectContext context)
        {
            _context = context;
        }

        // GET: Products
        public IActionResult Index()
        {
            var products = _context.Product.AsQueryable();
            var categories = _context.Category.AsQueryable();
            var result = products.Select(p => new ProductVM
            {
                Id = p.Id,
                Name = p.Name,
                Price = p.Price,
                CategoryId = p.CategoryId,
                imgUrl = p.ImageUrl,
                CategoryName = categories.FirstOrDefault(c => c.Id == p.CategoryId).Name
            });

            ViewBag.Categories = categories;

            return View(result);
        }
    }
}
