﻿using project.Models;

namespace project.Repositories
{
    public class ShoppingCartRepo
    {
        public List<CartItem> Items { get; set; } = new List<CartItem>();
        public void AddItem(CartItem item)
        {
            var existingItem = Items.FirstOrDefault(i => i.ProductId == item.ProductId);
            if (existingItem != null)
                existingItem.Quantity += item.Quantity;
            else
                Items.Add(item);
        }
        public void RemoveItem(int productId)
        {
            Items.RemoveAll(i => i.ProductId == productId);
        }
        public void UpdateItem(int productId, int newQuantity)
        {
            var existingItem = Items.FirstOrDefault(i => i.ProductId == productId);
            if (existingItem != null)
                existingItem.Quantity = newQuantity;
        }
        public void ClearCart()
        {
            Items.Clear();
        }
    }
}
