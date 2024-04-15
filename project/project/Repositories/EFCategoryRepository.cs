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
            var f = _context.Category.FirstOrDefault(p => p.Name == category.Name);
            if (f == null)
            {
                await _context.Category.AddAsync(category);

            }
            else
            {
                f.IsDeleted = false;
                _context.Category.Update(f);
            }
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
            return await _context.Category.Where(p => p.IsDeleted == false).ToListAsync();
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
