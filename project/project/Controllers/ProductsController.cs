using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using X.PagedList;
using project.Data;
using project.Models;
using project.ViewModels;
using Microsoft.IdentityModel.Tokens;
using project.Repo;
using project.Repositories;

namespace project.Controllers
{
    public class ProductsController : Controller
    {
        private readonly projectContext _context;
        private readonly IProductRepository _productRepository;
        public ProductsController(projectContext context, IProductRepository p)
        {
            _context = context;
            _productRepository = p;
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
        // GET: Products/Product/5
        public IActionResult Product(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var products = _context.Product.AsQueryable();
            var categories = _context.Category.AsQueryable();
            // Lọc các sản phẩm chỉ có id giống với id truyền vào
            var result = products.Where(p => p.Id == id).Select(p => new ProductVM
            {
                Id = p.Id,
                Description = p.Description,
                Name = p.Name,
                Price = p.Price,
                CategoryId = p.CategoryId,
                imgUrl = p.ImageUrl,
                CategoryName = categories.FirstOrDefault(c => c.Id == p.CategoryId).Name
            }).SingleOrDefault(); // Sử dụng SingleOrDefault để chỉ trả về một sản phẩm, nếu có, hoặc null nếu không có sản phẩm nào
            if (result == null)
            {
                return NotFound();
            }
            return View(result);
        }
        
        public async Task<IActionResult> Store(string sortOrder, string? searchString, List<int>? searchcate, string? currentFilter, int? page, int? pageSize)
        {
            var c = TempData["SearchCate"] as List<int>;
            var d = TempData["SearchSString"] as string;
            if (!c.IsNullOrEmpty() && c.First() != -1)
            {

                searchcate = c;
            }
            if (!d.IsNullOrEmpty())
            {
                searchString = d;
            }
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.PriceSortParm = sortOrder == "Price" ? "price_desc" : "Price";
            ViewBag.PageSize = pageSize;
            ViewBag.PageSize6 = 6;
            ViewBag.PageSize9 = 9;
            var products = _context.Product.AsQueryable();
            var categories = _context.Category.AsQueryable();
            var categoryList = new SelectList(categories, "Id", "Name");
            ViewBag.CateSelect = searchcate;
            ViewBag.CategoryList = categoryList;
            var result = products.Select(p => new ProductVM
            {
                Id = p.Id,
                Name = p.Name,
                Price = p.Price,
                CategoryId = p.CategoryId,
                imgUrl = p.ImageUrl,
                CategoryName = categories.FirstOrDefault(c => c.Id == p.CategoryId).Name
            });
            var productss = await _productRepository.GetAllAsync();
            var p = productss.Select(d => new ProductVM
            {
                Id = d.Id,
                Name = d.Name,
                Price = d.Price,
                Description = d.Description,
                CategoryId = d.CategoryId,
                imgUrl = d.ImageUrl,
                CategoryName = categories.FirstOrDefault(c => c.Id == d.CategoryId).Name
            });
            ViewBag.Mess = d;
            //if (searchcate.IsNullOrEmpty())
            //{
            //    ViewBag.Mess = "ko Co du lieu";

            //}
            var res = new List<ProductVM>();
            if (!searchcate.IsNullOrEmpty())
            {
                foreach (var id in searchcate)
                {
                    foreach (var a in p)
                    {
                        if (a.CategoryId == id)
                        {
                            if (searchString.IsNullOrEmpty()) res.Add(a);
                            else if (a.Name.ToLower().Contains(searchString.ToLower()) || a.CategoryName.ToLower().Contains(searchString.ToLower())) res.Add(a);
                        }
                    }
                }
                if (!res.IsNullOrEmpty())
                    result = res.AsQueryable();
            }
            if (searchcate.IsNullOrEmpty() && !searchString.IsNullOrEmpty())
            {
                result = result.Where(s => (s.Name.ToLower().Contains(searchString.ToLower()) || s.CategoryName.ToLower().Contains(searchString.ToLower())));
            }
            if (searchString != null && !currentFilter.IsNullOrEmpty())
            {
                page = 1;
            }

            ViewBag.CurrentCate = searchcate;
            ViewBag.CurrentFilter = searchString;

            switch (sortOrder)
            {
                case "name_desc":
                    result = result.OrderByDescending(s => s.Name);
                    break;
                case "Price":
                    result = result.OrderBy(s => s.Price);
                    break;
                case "price_desc":
                    result = result.OrderByDescending(s => s.Price);
                    break;
                default:
                    result = result.OrderBy(s => s.CategoryName);
                    break;
            }

            int requestedPageSize = pageSize ?? 6;
            int pageNumber = (page ?? 1);
            return View(result.ToPagedList(pageNumber, requestedPageSize));
        }

    }
}
