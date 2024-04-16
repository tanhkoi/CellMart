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
        // GET: Products/Create
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Set<Category>(), "Id", "Name");
            return View();
        }
        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Description,Price,ImageUrl,CategoryId,IsDeleted")] Product product)
        {
            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Set<Category>(), "Id", "Name", product.CategoryId);
            return View(product);
        }
        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Product.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.Set<Category>(), "Id", "Name", product.CategoryId);
            return View(product);
        }
        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Description,Price,ImageUrl,CategoryId,IsDeleted")] Product product)
        {
            if (id != product.Id)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Set<Category>(), "Id", "Name", product.CategoryId);
            return View(product);
        }
        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var product = await _context.Product
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }
        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Product.FindAsync(id);
            if (product != null)
            {
                _context.Product.Remove(product);
            }
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        //public async Task<IActionResult> Product()
        //{
        //    return View();
        //}
        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.Id == id);
        }
        public async Task<IActionResult> Store(string sortOrder, string? searchString,List<int>?searchcate, string? currentFilter, int? page, int? pageSize)
        {
            var c = TempData["SearchCate"] as List<int>;
            var d = TempData["SearchSString"] as string;
            if (!c.IsNullOrEmpty()&& c.First() != -1)
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
                foreach(var id in searchcate)
                {
                    foreach(var a in p)
                    {
                        if (a.CategoryId == id)
                        {
                            if (searchString.IsNullOrEmpty()) res.Add(a);
                            else if(a.Name.Contains(searchString)||a.CategoryName.Contains(searchString)) res.Add(a);
                        }
                    }
                }
                if(!res.IsNullOrEmpty())
                    result = res.AsQueryable();  
            }
            if (searchcate.IsNullOrEmpty()&&!searchString.IsNullOrEmpty())
            {
                result= result.Where(s => (s.Name.Contains(searchString) || s.CategoryName.Contains(searchString)));
            }
            if (searchString != null&&!currentFilter.IsNullOrEmpty())
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
