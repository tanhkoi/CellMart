using project.Models;
using System.ComponentModel.DataAnnotations;

namespace project.ViewModels
{
    public class CategoryVM
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsSelected { get; set; }
    }
}
