using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project.Data;
using project.Models;
using project.Models.Services;
using project.Repositories;

namespace project.Controllers
{
    [Authorize]
    public class ShoppingCartController : Controller
    {
        private readonly projectContext _context;
        private readonly UserManager<User> _userManager;
        private readonly IVnPayService _vnPayService;

        public ShoppingCartController(projectContext context, UserManager<User> userManager, IVnPayService vnPayService)
        {
            _context = context;
            _userManager = userManager;
            _vnPayService = vnPayService;
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

        public async Task<IActionResult> Checkout()
        {
            // handle empty item in cart
            var user = await _userManager.GetUserAsync(User);
            var cart = await _context.Cart.Include(c => c.cartItems).SingleOrDefaultAsync(c => c.UserId == user.Id);
            if (cart == null || !cart.cartItems.Any())
            {
                return RedirectToAction("Index");
            }
            return View(new Order());
        }

        [HttpPost]
        public async Task<IActionResult> Checkout(Order order, String payment )
        {
            // Fetch the user's cart from the database
            var user = await _userManager.GetUserAsync(User);
            var cart = await _context.Cart.Include(c => c.cartItems).SingleOrDefaultAsync(c => c.UserId == user.Id);
            if (cart == null || !cart.cartItems.Any())
            {
                return RedirectToAction("Index");
            }

            // save order
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

            if (payment == "Thanh Toán VNPay")
            {
                var vnPayModel = new VnPayRequestModel
                {
                    Amount = (double)(order.TotalPrice = cart.cartItems.Sum(i => i.Price * i.Quantity)),
                    CreatedDate = DateTime.Now,
                    Description = "Thanh toan don hang",
                    OrderId = order.Id
                };
                // remove items in cart
                foreach (var item in order.orderItems)
                {
                    await RemoveFromCart(item.ProductId);
                }
                return Redirect(_vnPayService.CreatePaymentUrl(HttpContext, vnPayModel));
            }

            return View("OrderCompleted", order.Id);
        }

        public async Task<IActionResult> PaymentSuccessAsync()
        {
            var user = await _userManager.GetUserAsync(User);
            foreach (var order in _context.Order)
            {
                if (order.UserId == user.Id)
                {
                    order.Status = "Ordered";
                    _context.Order.Update(order);
                    await _context.SaveChangesAsync();
                }
            }

            return View("Success");
        }

        public IActionResult PaymentFail()
        {
            return View();
        }

        public IActionResult PaymentCallBack()
        {
            var response = _vnPayService.PaymentExcute(Request.Query);
            if (response == null || response.VnPayResponseCode != "00")
            {

                TempData["Message"] = $"Lỗi thanh toán VN Pay: {response.VnPayResponseCode}";
                return RedirectToAction("PaymentFail");
            }

            TempData["Message"] = "Thanh toán Vnpay thành công";
            return RedirectToAction("PaymentSuccess");
        }
    }
}
