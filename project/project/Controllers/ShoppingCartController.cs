using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using project.Data;
using project.Helpers;
using project.Models;
using project.Repositories;

namespace project.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly projectContext _context;
        private readonly UserManager<User> _userManager;

        public ShoppingCartController(projectContext context, UserManager<User> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public IActionResult Index()
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCartRepo>("Cart") ?? new ShoppingCartRepo();
            return View(cart);
        }

        public IActionResult AddToCart(int productId, int quantity = 1)
        {
            var product = _context.Product.Find(productId);
            if (product == null)
            {
                return NotFound();
            }

            var cartItem = new CartItem
            {
                ProductId = productId,
                Quantity = quantity,
                Name = product.Name,
                Price = product.Price,
            };

            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCartRepo>("Cart") ?? new ShoppingCartRepo();
            cart.AddItem(cartItem);
            HttpContext.Session.SetObjectAsJson("Cart", cart);
            return RedirectToAction("Index", "ShoppingCart");
        }

        public IActionResult RemoveFromCart(int productId)
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCartRepo>("Cart") ?? new ShoppingCartRepo();
            cart.RemoveItem(productId);
            HttpContext.Session.SetObjectAsJson("Cart", cart);
            return RedirectToAction("Index");
        }

        public IActionResult Checkout()
        {
            return View(new Order());
        }

        [HttpPost]
        public async Task<IActionResult> Checkout(Order order)
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCartRepo>("Cart");

            if (cart == null || !cart.Items.Any())
            {
                return RedirectToAction("Index");
            }

            var user = await _userManager.GetUserAsync(User);

            order.UserId = user.Id;
            order.OrderDate = DateTime.UtcNow;
            order.Status = "Pending";
            order.TotalPrice = cart.Items.Sum(i => i.Price * i.Quantity);
            order.orderItems = cart.Items.Select(i => new OrderItem
            {
                ProductId = i.ProductId,
                Quantity = i.Quantity,
                Price = i.Price
            }).ToList();

            _context.Order.Add(order);
            await _context.SaveChangesAsync();

            HttpContext.Session.Remove("Cart");

            return View("OrderCompleted", order.Id);
        }
    }
}
