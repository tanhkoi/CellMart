using Microsoft.AspNetCore.Identity;
using project.Areas.Admin.Models;
using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class User : IdentityUser
    {

        [Required]
        public string FullName { get; set; }
        public string? Address { get; set; }
        public bool IsDeleted { get; set; }
        [DataType(DataType.Date)]
        public DateTime CreatedAt { get; set; }

        [DataType(DataType.Date)]
        public DateTime UpdatedAt { get; set; }
        public User()
        {

        }
        public User(UserAdmin m)
        {
            this.Address = m.Address;
            this.FullName = m.FullName;
            this.Email = m.Email;
            this.UserName = m.Email;
            this.IsDeleted = false;
            this.CreatedAt = DateTime.Now;
            this.UpdatedAt = DateTime.Now;
        }
    }
}
