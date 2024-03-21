using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class MethodPayment
    {
        public string Id { get; set; }
        [Required, StringLength(50)]
        public string Name { get; set; }
    }
}
