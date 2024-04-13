using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace project.Models
{
    public class Order
    {
        [Required]
        public string Id { get; set; }
        public string UserId { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal TotalPrice { get; set; }
        public string Status { get; set; }
        public string ShippingAddress { get; set; }
        public string Notes { get; set; }
        public bool IsDeleted { get; set; }
        public User? User { get; set; }
        public List<OrderItem>? orderItems { get; set; }
    }
}
