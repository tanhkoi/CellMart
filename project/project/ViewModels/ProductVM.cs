using project.Models;

namespace project.ViewModels
{
    public class ProductVM
    {
        public string? Name { get; set; }
        public decimal Price { get; set; }
        public int CategoryId { get; set; }
        public string? imgUrl { get; set; }
    }
}
