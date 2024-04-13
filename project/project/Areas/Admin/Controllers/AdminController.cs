using Microsoft.AspNetCore.Mvc;
using project.Data;
using project.Repo;
using project.Repositories;
using project.ViewModels;

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminController : Controller
    {
        /*rivate readonly projectContext _context;*/
        private readonly ICategoryRepository _categoryRepository;
        private readonly IProductRepository _productRepository;
        public AdminController(IProductRepository p,ICategoryRepository c)
        {
            _categoryRepository = c;
            _productRepository = p; 
        }

        // GET: Products
        public async Task<IActionResult> Index()
        {
            var products =await _productRepository.GetAllAsync();
            var categories =await _categoryRepository.GetAllAsync();
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
