using project.Models;
using System.ComponentModel;

namespace project.ViewModels
{
    public class ProductVM
    {
        public int Id { get; set; }
        [DisplayName("Name")]
        public string? Name { get; set; }
        [DisplayName("Price")]
        public decimal Price { get; set; }
        [DisplayName("Description")]
        public string? Description { get; set; }
        public int CategoryId { get; set; }
        [DisplayName("Category Name")]
        public string CategoryName { get; set; }
        [DisplayName("Image Url")]

        public string? imgUrl { get; set; }
    }
}
