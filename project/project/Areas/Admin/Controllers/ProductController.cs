using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.IdentityModel.Tokens;
using project.Models;
using project.Repo;
using project.Repositories;
using project.ViewModels;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductController : Controller
    {
        private readonly ICategoryRepository _categoryRepository;
        private readonly IProductRepository _productRepository;
        public ProductController(IProductRepository p, ICategoryRepository c)
        {
            _categoryRepository = c;
            _productRepository = p;
        }
        public async Task<IActionResult> Index()
        {
            var cate = await _categoryRepository.GetAllAsync();
            var productss = await _productRepository.GetAllAsync();
            var p = productss.Select(d => new ProductVM
            {
                Id = d.Id,
                Name = d.Name,
                Price = d.Price,
                Description = d.Description,
                CategoryId = d.CategoryId,
                imgUrl = d.ImageUrl,
                CategoryName = cate.FirstOrDefault(c => c.Id == d.CategoryId).Name
            });
            var viewModel = new ProductCateList
            {
                Categories = cate.Select(c => new CategoryVM
                {
                    Id = c.Id,
                    Name = c.Name,
                    IsDeleted = c.IsDeleted,
                    IsSelected = false
                }).ToList(),
                Products = p.ToList()
            };
            return View(viewModel);
            //return View();
        }
        [HttpPost]
        public async Task<IActionResult> Index(List<int> selectedCategories)
        {
            var productss = await _productRepository.GetAllAsync();
            var categoriess = await _categoryRepository.GetAllAsync();
            var ca = categoriess.Select(d => new CategoryVM
            {
                Id = d.Id,
                Name = d.Name,
                IsDeleted = d.IsDeleted,
                IsSelected = false
            }).ToList();
            var p = productss.Select(d => new ProductVM
            {
                Id = d.Id,
                Name = d.Name,
                Price = d.Price,
                Description = d.Description,
                CategoryId = d.CategoryId,
                imgUrl = d.ImageUrl,
                CategoryName = categoriess.FirstOrDefault(c => c.Id == d.CategoryId).Name
            });
            var viewModel = new ProductCateList();
            if (selectedCategories.IsNullOrEmpty())
            {
                viewModel.Categories = ca;
                viewModel.Products = p.ToList();
                return View(viewModel);
            }
            List<ProductVM> res = new List<ProductVM>();
            foreach (var c in selectedCategories)
            {
                foreach (var a in p)
                {
                    if (c == a.CategoryId) res.Add(a);
                }
            }
            viewModel.Products = res;
            viewModel.Categories = ca;
            return View(viewModel);

        }
        public async Task<IActionResult> Add()
        {
            var cate = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(cate, "Id", "Name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Add(Product product, IFormFile imageURL, List<ProductImage> imageURLs)
        {
            if (ModelState.IsValid)
            {
                if (imageURL != null)
                {
                    product.ImageUrl = await SaveImage(imageURL);
                }
                await _productRepository.AddAsync(product);
                return RedirectToAction("Index");
            }
            var categories = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "Id", "Name");
            return View(product);
            //return View();
        }
        public async Task<IActionResult> Delete(int id)
        {
            var product = await _productRepository.GetByIdAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }
        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            await _productRepository.DeleteAsync(id);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Update(int id)
        {
            var product = await _productRepository.GetByIdAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            var categories = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "Id", "Name", product.CategoryId);
            return View(product);
        }
        [HttpPost]
        public async Task<IActionResult> Update(Product product, IFormFile imageURL, List<ProductImage> imageURLs)
        {
            if (ModelState.IsValid)
            {
                if (imageURL != null)
                {
                    product.ImageUrl = await SaveImage(imageURL);
                }
                await _productRepository.UpdateAsync(product);
                return RedirectToAction(nameof(Index));
            }
            var categories = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "Id", "Name", product.CategoryId);
            return View(product);
        }
        private async Task<string> SaveImage(IFormFile image)
        {
            var savePath = Path.Combine("wwwroot/images", image.FileName);
            using (var fileStream = new FileStream(savePath, FileMode.Create))
            {
                await image.CopyToAsync(fileStream);
            }
            return "/images/" + image.FileName;
        }
    }
}
