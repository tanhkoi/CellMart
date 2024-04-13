using project.Areas.Admin.Models;
namespace project.Repositories
{
    public interface IPUserAdminRepository 
    {
        Task AddSync(UserAdmin m);
        Task<UserAdmin> GetByIdAsync(string id);
        Task RemoveAsync(string id);
        Task UpdateAsync(string id, UserAdmin model);
        Task<List<UserAdmin>> GetAllAsync();


    }
}
