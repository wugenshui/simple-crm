using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRM.Class
{
    public class Customer
    {
        public void Clear()
        {

            this.AddStartDate = DateTime.Now;
            this.BelongEmployeeName = null;
            this.CustomerName = null;
            this.PhoneNumber = null;
            this.QQNumber = null;
            this.Status = null;
  
          
        }

        private string belongEmployeeName; //姓名
        public string BelongEmployeeName
        {
            get { return belongEmployeeName; }
            set { this.belongEmployeeName = value; }

        }

        private string customerName; //公司
        public string CustomerName
        {
            get { return customerName; }
            set { this.customerName = value; }

        }

        private string phoneNumber; //电话号码 
        public string PhoneNumber
        {
            get { return phoneNumber; }
            set { this.phoneNumber = value; }

        }

        private string qqNumber; //QQ号码 
        public string QQNumber
        {
            get { return qqNumber; }
            set { this.qqNumber = value; }

        }

        private string status; //状态
        public string Status
        {
            get { return status; }
            set { this.status = value; }

        }

        private DateTime addStartDate; //添加时间
        public DateTime AddStartDate
        {
            get { return addStartDate; }
            set { this.addStartDate = value; }

        }

 

        //添加客户方法

        //审核方法

        //跟进方法
    }
}