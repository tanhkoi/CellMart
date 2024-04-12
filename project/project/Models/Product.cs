using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Product
    {
        public int Id { get; set; }
        [Required, StringLength(100)]
        public string? Name { get; set; }
        [Required]
        public string? Description { get; set; }

        [Range(1, double.MaxValue, ErrorMessage = "price must be greater than 0 .")]
        [Required(ErrorMessage = "Required")]
        public decimal Price { get; set; }

        public string? ImageUrl { get; set; }

        public List<ProductImage>? Images { get; set; }


        public int CategoryId { get; set; }
        public Category? Category { get; set; }
        public bool IsDeleted { get; set; }
        public List<CartItem>? cartItems { get; set; }

    }
}
