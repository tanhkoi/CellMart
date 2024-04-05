using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Product
    {
        public int Id { get; set; }
        [Required, StringLength(100)]
        public string? Name { get; set; }
        public string? Description { get; set; }
        [Range(0.01, 999999999.00)]
        public decimal Price { get; set; }
        public string? ImageUrl { get; set; }
        public List<ProductImage>? Images { get; set; }
        public int CategoryId { get; set; }
        public Category? Category { get; set; }
        public bool IsDeleted { get; set; }
        public List<CartItem>? cartItems { get; set; }
        public List<OrderItem>? orderItems { get; set; }    

    }
}
