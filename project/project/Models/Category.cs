﻿using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Category
    {
        public int Id { get; set; }
        [Required, StringLength(50)]
        public string Name { get; set; }
        public bool IsDeleted { get; set; }
        public ICollection<Product>? Products { get; set; }
    }
}
