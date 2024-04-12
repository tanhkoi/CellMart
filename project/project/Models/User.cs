using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class User : IdentityUser
    {
        [Required]
        public string? FullName { get; set; }
        public string? Address { get; set; }
        public bool IsDeleted { get; set; }
        [DataType(DataType.Date)]
        public DateTime CreatedAt { get; set; }

        [DataType(DataType.Date)]
        public DateTime UpdatedAt { get; set; }
    }
}
