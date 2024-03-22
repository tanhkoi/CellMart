using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Cart
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public User? User { get; set; }
        public List<CartItem>? cartItems { get; set; }
    }
}
