using Common;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
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

        public User changeState(User user)
        {
            DbContext db = GetDbContext();
            DbEntityEntry<User> entry = db.Entry(user);
            entry.State = EntityState.Unchanged;
            entry.Property(t => t.IsEnable).IsModified = true;

            db.SaveChanges();
            return user;
        }

        public DataTable Get(string name, int pageSize, int pageIndex)
        {
            DataTable data = new DataTable();
            string sql = @" SELECT 
	                            u.id, u.userName,u.loginName,'' AS password, u.phoneNumber, u.workStartDate, u.photo, u.state, u.isEnable, u.postId, 
	                            c.companyName, t.name AS teamName, s.userName AS supervisor
                            FROM [User] u
                            LEFT JOIN [User] s ON s.Id=u.SupervisorId
                            LEFT JOIN Company c ON c.Id=u.CompanyId
                            LEFT JOIN Team t ON t.Id=u.TeamId
                            WHERE u.UserName LIKE @name
                            Order BY u.Id Offset @start Row Fetch Next @pagesize Rows Only";
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("name","%" + name + "%"),
                new SqlParameter("start",pageSize * (pageIndex - 1)),
                new SqlParameter("pagesize",pageSize),
            };
            data = SqlHelper.ExecuteDataset(sql, CommandType.Text, param).Tables[0];
            return data;
        }
    }
}
