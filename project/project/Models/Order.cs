using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Order
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public User? User { get; set; }
        public DateTime OrderDate { get; set; }
        [Range(18, 2)]
        public decimal TotalAmount { get; set; }
        [StringLength(50, ErrorMessage = "Status cannot exceed 50 characters")]
        public string? Status { get; set; }
        public List<OrderItem>? orderItems { get; set; }
        public bool IsDeleted { get; set; }
    }
}
