using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project.Data;
using project.Models;

namespace project.ViewComponents
{
    [Authorize]
    public class CartItemsViewComponent : ViewComponent
    {
        private readonly projectContext _context;
        private readonly UserManager<User> _userManager;

        public CartItemsViewComponent(projectContext context, UserManager<User> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            // Fetch the user's cart from the database 
            var user = await _userManager.GetUserAsync((System.Security.Claims.ClaimsPrincipal)User);
            var cartDB = await _context.Cart.Include(c => c.cartItems).SingleOrDefaultAsync(c => c.UserId == user.Id);

            return View(cartDB.cartItems);
        }
    }
}
