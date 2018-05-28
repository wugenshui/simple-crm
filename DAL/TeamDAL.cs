using Common;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
    public class TeamDAL : BaseDAL<Team>
    {
        public DataTable Get(string name, int pageSize, int pageIndex)
        {
            DataTable data = new DataTable();
            string sql = @" SELECT t.id, t.name, t.leader, t.leaderPhone, t.slogan, c.companyName
                                FROM Team t
                            LEFT JOIN Company c ON c.Id=t.CompanyId
                                WHERE t.Name LIKE @name
                            Order BY t.Id Offset @start Row Fetch Next @pagesize Rows Only";
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
