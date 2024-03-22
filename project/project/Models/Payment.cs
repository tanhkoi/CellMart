using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Payment
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public Order? Order { get; set; }
        [DataType(DataType.Date)]
        public DateTime DateOfPay { get; set; }
        public int MethodPaymentId { get; set; }
        public MethodPayment? MethodPayment { get; set; }
    }
}
