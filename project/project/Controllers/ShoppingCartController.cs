using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project.Data;
using project.Helpers;
using project.Models;
using project.Repositories;

namespace project.Controllers
{
    [Authorize]
    public class ShoppingCartController : Controller
    {
        private readonly projectContext _context;
        private readonly UserManager<User> _userManager;

        public ShoppingCartController(projectContext context, UserManager<User> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {
            // Fetch the user's cart from the database 
            var user = await _userManager.GetUserAsync(User);
            var cartDB = await _context.Cart.Include(c => c.cartItems).SingleOrDefaultAsync(c => c.UserId == user.Id);

            return View(cartDB.cartItems);
        }

        public async Task<IActionResult> AddToCart(int productId, int quantity = 1)
        {
            var product = await _context.Product.FindAsync(productId);
            if (product == null)
            {
                return NotFound("Product not found");
            }

            var cartItem = new CartItem
            {
                Name = product.Name,
                Quantity = quantity,
                Price = product.Price,
                ProductId = productId
            };

            // Fetch the user's cart from the database or create a new one if it doesn't exist
            var user = await _userManager.GetUserAsync(User);
            var cartDB = await _context.Cart.Include(c => c.cartItems).SingleOrDefaultAsync(c => c.UserId == user.Id);

            if (cartDB == null)
            {
                cartDB = new Cart
                {
                    UserId = user.Id,
                    cartItems = new List<CartItem>()
                };
            }

            // Add the cart item to the cart
            CartItem existingItem = cartDB.cartItems.FirstOrDefault(i => i.ProductId == cartItem.ProductId);
            
            if (existingItem != null)
                existingItem.Quantity += cartItem.Quantity;
            else
                cartDB.cartItems.Add(cartItem);

            // Save changes to the database
            if (cartDB.Id == 0)
            {
                _context.Cart.Add(cartDB);
            }
            await _context.SaveChangesAsync();

            return RedirectToAction("Index", "ShoppingCart");
        }

        public async Task<IActionResult> RemoveFromCart(int productId)
        {
            // Fetch the user's cart from the database and Find the item to delete
            var user = await _userManager.GetUserAsync(User);
            var cartDB = await _context.Cart.Include(c => c.cartItems).SingleOrDefaultAsync(c => c.UserId == user.Id);
            CartItem deleteItem = cartDB.cartItems.FirstOrDefault(i => i.ProductId == productId);

            if (deleteItem != null)
            {
                // Remove the item from the list
                cartDB.cartItems.Remove(deleteItem);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction("Index");
        }

        public IActionResult Checkout()
        {
            return View(new Order());
        }

        [HttpPost]
        public async Task<IActionResult> Checkout(Order order)
        {
            // Fetch the user's cart from the database
            var user = await _userManager.GetUserAsync(User);
            var cart = await _context.Cart.Include(c => c.cartItems).SingleOrDefaultAsync(c => c.UserId == user.Id);

            if (cart == null || !cart.cartItems.Any())
            {
                return RedirectToAction("Index");
            }

            order.UserId = user.Id;
            order.OrderDate = DateTime.UtcNow;
            order.Status = "Pending";
            order.TotalPrice = cart.cartItems.Sum(i => i.Price * i.Quantity);
            order.orderItems = cart.cartItems.Select(i => new OrderItem
            {
                ProductId = i.ProductId,
                Quantity = i.Quantity,
                Price = i.Price
            }).ToList();

            _context.Order.Add(order);
            await _context.SaveChangesAsync();

            foreach (var item in order.orderItems)
            {
                await RemoveFromCart(item.ProductId);
            }

            return View("OrderCompleted", order.Id);
        }
    }
}
