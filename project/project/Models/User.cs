using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class User : IdentityUser
    {
        [Required]
        public int Id { get; set; }

        [Required(ErrorMessage = "Username is required")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Email is required")]
        public string Email { get; set; }

        public string Phone { get; set; }
        public string Address { get; set; }
        public bool IsDeleted { get; set; }

        [DataType(DataType.Date)]
        public DateTime CreatedAt { get; set; }

        [DataType(DataType.Date)]
        public DateTime UpdatedAt { get; set; }
    }
}
