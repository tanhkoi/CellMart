using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project.Data;
using project.Models.Services;
using project.Models;
using project.Utilitys;
using project.Repositories;

namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = SD.Role_Admin + "," + SD.Role_Employee)]
    public class OderController : Controller
    {
        private readonly projectContext _context;
        private readonly UserManager<User> _userManager;
        private readonly IPUserAdminRepository _userepo;

        public OderController(projectContext context, UserManager<User> userManager, IPUserAdminRepository repo)
        {
            _context = context;
            _userepo = repo;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {

            var users = await _userepo.GetAllAsync();
            List<Order> orders = new List<Order>();
            foreach (var item in _context.Order)
            {
                foreach (var user in users)
                {
                    if (item.UserId == user.Id)
                    {
                        item.User = new User
                        {
                            Id = user.Id,
                            UserName = user.UserName,
                        };
                        orders.Add(item);
                    }
                }
            }
            return View(orders);
        }
    }
}
