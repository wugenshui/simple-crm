using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace CRM.Class
{
    public class Employee
    {
        public void Clear()
        {

            this.WorkStartDate = DateTime.Now;
            this.EmployeeName = null;
            this.CompanyName = null;
            this.PhoneNumber = null;
            this.QQNumber = null;
            this.Status = null;
            this.Password = null;
            this.Post = null;
            this.Supervisor = null;
            this.TeamName = null;
        }
        private string employeeName; //姓名
        public string EmployeeName
        {
            get { return employeeName; }
            set { this.employeeName = value; }

        }

        private string companyName; //公司
        public string CompanyName
        {
            get { return companyName; }
            set { this.companyName = value; }

        }
        
        private string teamName; //团队
        public string TeamName
        {
            get { return teamName; }
            set { this.teamName = value; }

        }

        private string post;     //职位 
        public string Post
        {
            get { return post; }
            set { this.post = value; }

        }

        private string supervisor; //主管 
        public string Supervisor
        {
            get { return supervisor; }
            set { this.supervisor = value; }

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

        private DateTime workStartDate; //入职时间
        public DateTime WorkStartDate
        {
            get { return workStartDate; }
            set { this.workStartDate = value; }

        }

        private string password; //密码
        public string Password
        {
            get { return password; }
            set { this.password = value; }

        }

        private string photo; //照片
        public string Photo
        {
            get { return photo; }
            set { this.photo = value; }

        }

        //添加客户方法

        //审核方法

        //跟进方法

        //修改密码方法
        public string UpdatePassword(Employee employee, string newPassword, SqlConnection connection)
        {
            string strSQL = @"update emppassword set Password='" + newPassword + "' where emp='" + employee.EmployeeName + "' and Password='" + employee.Password + "'";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);
            
            try
            {
                adapter.Fill(ds);
            }
            catch (Exception ex)
            { return ex.Message; }
            finally
            {
            }
            return "OK";
        }
      
    }
    
}