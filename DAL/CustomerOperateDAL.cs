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
    public class CustomerOperateDAL : BaseDAL<CustomerOperate>
    {
        public IQueryable<CustomerOperate> GetByCustomer(int customerId)
        {
            return Get().Where(o => o.CustomerId == customerId);
        }
    }
}
