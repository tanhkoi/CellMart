using Microsoft.AspNetCore.Mvc;

namespace project.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
