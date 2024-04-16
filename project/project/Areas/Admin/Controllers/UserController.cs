using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using project.Models;
using project.Repositories;
using project.Utilitys;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using project.Areas.Admin.Models;
using Microsoft.AspNetCore.Authorization;
using project.Data;
namespace project.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class UserController : Controller
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<User> _userManager;
        private readonly IPUserAdminRepository _userepo;
        private readonly projectContext _context;

        public UserController(IPUserAdminRepository repo, RoleManager<IdentityRole> role, UserManager<User> users, projectContext c)
        {
            _roleManager = role;
            _userManager = users;
            _userepo = repo;
            _context = c;
        }

        public async Task<IActionResult> Index()
        {
            var users = await _userepo.GetAllAsync();
            var currentUser = await _userManager.GetUserAsync(User);
            var isAdmin = await _userManager.IsInRoleAsync(currentUser, SD.Role_Admin);
            ViewBag.IsAdmin = isAdmin;

            var userRoles = new Dictionary<string, List<string>>();
            foreach (var userModel in users)
            {
                var user1 = await _userManager.FindByIdAsync(userModel.Id.ToString());
                var roles = await _userManager.GetRolesAsync(user1);
                userRoles.Add(userModel.Id, roles.ToList());
            }

            ViewBag.UserRoles = userRoles;
            return View(users);
        }

        public async Task<IActionResult> Add()
        {
            var currentUser = await _userManager.GetUserAsync(User);
            var isAdmin = await _userManager.IsInRoleAsync(currentUser, SD.Role_Admin);
            ViewBag.IsAdmin = isAdmin;
            ViewBag.Roles = new SelectList(await _roleManager.Roles.ToListAsync(), "Name", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken] // Protect against CSRF attacks
        public async Task<IActionResult> Add(UserAdmin userModel, string SelectedRole = SD.Role_Customer)
        {
            if (ModelState.IsValid)
            {
                await _userepo.AddSync(userModel);
                var user = await _userManager.FindByEmailAsync(userModel.Email);
                await _userManager.AddToRoleAsync(user, SelectedRole);
                // Add TempData success message
                TempData["SuccessMessage"] = $"User '{userModel.Email}' added successfully.";
                return RedirectToAction(nameof(Index));
            }

            // If we got this far, something failed, redisplay form
            return View(userModel);
        }

        [HttpGet]
        public async Task<IActionResult> Update(string id)
        {
            var user = await _userepo.GetByIdAsync(id);
            if (user == null)

            {
                return NotFound();
            }
            ViewBag.Roles = new SelectList(await _roleManager.Roles.ToListAsync(), "Name", "Name");
            var currentUser = await _userManager.GetUserAsync(User);
            var isAdmin = await _userManager.IsInRoleAsync(currentUser, SD.Role_Admin);
            ViewBag.IsAdmin = isAdmin;
            return View(user);

        }

        [HttpPost]
        public async Task<IActionResult> Update(UserAdmin model, string SelectedRole, string PassWord = null)
        {

            if (ModelState.IsValid)
            {
                await _userepo.UpdateAsync(model.Id, model);
                var user = await _userManager.FindByEmailAsync(model.Email);
                var roles = await _userManager.GetRolesAsync(user);

                if (roles.Any())
                    await _userManager.RemoveFromRoleAsync(user, roles.First());

                await _userManager.AddToRoleAsync(user, SelectedRole);
                if (PassWord != null)
                {
                    await _userManager.ChangePasswordAsync(user, model.Email, PassWord);
                }
                // Add TempData success message
                TempData["SuccessMessage"] = $"User '{model.Email}' updated successfully.";
                return RedirectToAction("Index");
            }
            ViewBag.Roles = new SelectList(await _roleManager.Roles.ToListAsync(), "Name", "Name");
            var currentUser = await _userManager.GetUserAsync(User);
            var isAdmin = await _userManager.IsInRoleAsync(currentUser, SD.Role_Admin);
            ViewBag.IsAdmin = isAdmin;
            return View(model);
        }

        [HttpGet]
        public async Task<IActionResult> Delete(string id)
        {
            var user = await _userepo.GetByIdAsync(id);
            if (user == null)
            {
                TempData["ErrorMessage"] = "User not found.";
                return RedirectToAction("Index");
            }
            // Pass the user to a view which will show the confirmation dialog
            return View(user);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {

            var user = await _userepo.GetByIdAsync(id);
            if (user == null)
            {
                //_logger.LogWarning("Attempted to delete a user with ID {UserId} that does not exist.", id);
                return NotFound();
            }

            await _userepo.RemoveAsync(id); // Implement this method in your repository
                                            //_logger.LogInformation("User with ID {UserId} was deleted successfully.", id);

            // Add a success message to TempData
            TempData["SuccessMessage"] = $"User {user.FullName} was deleted successfully.";

            return RedirectToAction(nameof(Index));
        }
        public IActionResult CheckEmail([FromBody] string email)
        {
           
            var user = _context.User.FirstOrDefault(u => u.Email == email);

            // Trả về kết quả dưới dạng JSON
            return Json(new { exists = user != null });
        }
    }

}
