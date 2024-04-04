using project.Data;
using project.Models;
using Microsoft.EntityFrameworkCore;

namespace project.Repositories
{
    public class EFCategoryRepository : ICategoryRepository
    {
        private readonly projectContext _context;
        public EFCategoryRepository(projectContext context)
        {
            _context = context;
        }
        public async Task AddAsync(Category category)
        {
            category.IsDeleted = false;
            await _context.SaveChangesAsync();
            _context.Category.Add(category);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteAsync(int id)
        {
            var category = await _context.Category.FindAsync(id);
            if (category != null)
            {
                category.IsDeleted = true;
                await _context.SaveChangesAsync();
            }
        }
        public async Task<IEnumerable<Category>> GetAllAsync()
        {
            return await _context.Category.ToListAsync();
        }
        public async Task<Category> GetByIdAsync(int id)
        {
            return await _context.Category.FindAsync(id);
        }
        public async Task UpdateAsync(Category category)
        {
            _context.Category.Update(category);
            await _context.SaveChangesAsync();
        }
    }
}
