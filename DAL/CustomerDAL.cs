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
    public class CustomerDAL : BaseDAL<Customer>
    {
        public DataTable Get(string name, int type, int pageSize, int pageIndex)
        {
            DataTable data = new DataTable();
            string sql = @" SELECT c.createTime,c.customerName,c.customerPhone,c.customerQQ,c.mail,c.customerType,c.state,c.contract,c.id
                                FROM Customer c
                            WHERE c.CustomerName LIKE @name ";
            if (type >= 0)
            {
                sql += " AND c.customerType=@customerType ";
            }
            sql += " Order BY c.Id Offset @start Row Fetch Next @pagesize Rows Only";
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("name","%" + name + "%"),
                new SqlParameter("customerType",type),
                new SqlParameter("start",pageSize * (pageIndex - 1)),
                new SqlParameter("pagesize",pageSize),
            };
            data = SqlHelper.ExecuteDataset(sql, CommandType.Text, param).Tables[0];
            return data;
        }

        public int GetCount(string name)
        {
            int result = 0;
            string sql = @" SELECT Count(*) FROM Customer WHERE CustomerName LIKE @name";
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("name","%" + name + "%"),
            };
            object counter = SqlHelper.ExecuteScalar(sql, CommandType.Text, param);
            int.TryParse(counter.ToString(), out result);
            return result;
        }
    }
}
