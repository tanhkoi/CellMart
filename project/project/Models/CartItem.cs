using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class CartItem
    {
        [Required]
        public int Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public int ProductId { get; set; }
        public int CartId { get; set; }
        public Product? Product { get; set; }
        public Cart? Cart { get; set; }
    }
}
