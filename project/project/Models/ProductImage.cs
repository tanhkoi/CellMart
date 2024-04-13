using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class ProductImage
    {
        [Required]
        public int Id { get; set; }
        public string? Url { get; set; }
        public int ProductId { get; set; }
        public Product? Product { get; set; }
    }
}
