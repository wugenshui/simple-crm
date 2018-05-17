using Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserDAL : BaseDAL<User>
    {
        public User changePassword(User user)
        {
            DbContext db = GetDbContext();
            DbEntityEntry<User> entry = db.Entry(user);
            entry.State = EntityState.Unchanged;
            entry.Property(t => t.Password).IsModified = true;

            db.SaveChanges();
            return user;
        }
    }
}
