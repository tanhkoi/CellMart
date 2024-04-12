using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace project.Models
{
    public class Order
    {
        public int Id { get; set; }
        [Required]
        public int UserId { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        [StringLength(50, ErrorMessage = "Status cannot exceed 50 characters")]
        public string? Status { get; set; }
        public string? ShippingAddress { get; set; }
        public string? Notes { get; set; }
        public bool IsDeleted { get; set; }
        public User? User { get; set; }
        public List<OrderItem>? orderItems { get; set; }
    }
}
