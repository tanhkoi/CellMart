using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using project.Areas.Admin.Models;
using project.Data;
using project.Models;
using System.Linq.Expressions;

namespace project.Repositories
{
    public class EFUserAdminRepository : IPUserAdminRepository
    {
        private readonly UserManager<User> _userManager;
        private readonly projectContext _context;

        public EFUserAdminRepository(UserManager<User> users, projectContext c)
        {
            _userManager = users;
            _context = c;
        }

        public async Task AddSync(UserAdmin model)
        {
            var userEntity = new User(model);
            Guid g = new Guid();
            userEntity.Id = g.ToString();
            userEntity.NormalizedEmail = model.Email.ToUpper();

            var res = await _userManager.CreateAsync(userEntity, "Admin@123");

            if (res.Succeeded)
            {
                model.Id = userEntity.Id;
            }
            await _context.SaveChangesAsync();

        }

        public async Task<List<UserAdmin>> GetAllAsync()
        {
            var users = await _context.User.Where(user => user.IsDeleted == false).ToListAsync();
            var kq = new List<UserAdmin>();
            foreach (var user in users)
            {   
                kq.Add(new UserAdmin { Id = user.Id, Address = user.Address, FullName = user.FullName, PhoneNumber = user.PhoneNumber ,UserName = user.Email,Email = user.Email});
            }
            return kq;
        }

        public async Task<UserAdmin> GetByIdAsync(string id)
        {
            var userEntity = await _context.User.FindAsync(id);
            if(userEntity==null||userEntity.IsDeleted== true)
            {
                return null;
            }
            var kq = new UserAdmin{Id = userEntity.Id , Address = userEntity.Address , Email = userEntity.Email,FullName = userEntity.FullName 
                , PhoneNumber = userEntity.PhoneNumber , UserName = userEntity.UserName
            };
            return kq;
        }

        public async Task RemoveAsync(string id)
        {
            var user = await _context.User.FindAsync(id);
            if(user !=null)
            {
                user.IsDeleted = true;
                _context.Entry(user).State = EntityState.Modified;
               await  _context.SaveChangesAsync();
            }
        }

        public async Task UpdateAsync(string id,UserAdmin model)
        {
            var userEntity = await _context.User.FindAsync(id);
            if(userEntity != null)
            {
                userEntity.Email=model.Email;
                userEntity.FullName = model.FullName;
                userEntity.Address = model.Address;
                userEntity.CreatedAt = DateTime.Now;
                userEntity.UpdatedAt = DateTime.Now;
                userEntity.NormalizedEmail = model.Email.ToUpper();
                _context.Entry(userEntity).State = EntityState.Modified;
                _context.User.Update(userEntity);
                await  _context.SaveChangesAsync();
            }
        }

    }
}
