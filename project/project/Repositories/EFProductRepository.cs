using project.Data;
using project.Models;
using project.Repo;
using Microsoft.EntityFrameworkCore;

namespace project.Repositories
{
    public class EFProductRepository : IProductRepository
    {
        private readonly projectContext _context;
        public EFProductRepository(projectContext context)
        {
            _context = context;
        }
        public async Task AddAsync(Product product)
        {
            var res = await _context.Product.FirstOrDefaultAsync(p => p.Name == product.Name);
            if (res != null)
            {
                res.IsDeleted = false;
                _context.Product.Update(res);
            }
            else
            {
                _context.Product.Add(product);
            }
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(int id)
        {
            var product = await _context.Product.FindAsync(id);
            if (product != null)
            {
                //_context.Product.Remove(product);
                product.IsDeleted = true;
                _context.Product.Update(product);
                await _context.SaveChangesAsync();
            }
        }

        public async Task UpdateAsync(Product product)
        {
            _context.Product.Update(product);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<Product>> GetAllAsync()
        {
            return await _context.Product.Include(p => p.Category).ToListAsync();
        }

        public async Task<Product> GetByIdAsync(int id)
        {
            return await _context.Product.Include(p => p.Category).FirstOrDefaultAsync(p => p.Id == id);
        }
    }
}
