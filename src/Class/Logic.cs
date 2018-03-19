using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace CRM.Class
{
    public class Logic
    {
        public StringBuilder GetMenu(string display,string user ,SqlConnection connection)
        {
            

            StringBuilder strb1 = new StringBuilder();


            DataSet ds = new DataSet();
            DataSet dsson = new DataSet();
            ds = GetFatherID(user, connection);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                //if (display == ds.Tables[0].Rows[i]["DisplayName"].ToString())
                //{ strb1.Append(@" <li class=""submenu""> <a href=""#""><i class=""" + ds.Tables[0].Rows[i]["Class"].ToString() + @"""></i> <span>" + ds.Tables[0].Rows[i]["DisplayName"].ToString() + @"</span></a>"); }
                //else { strb1.Append(@" <li class=""submenu""> <a href=""#""><i class=""" + ds.Tables[0].Rows[i]["Class"].ToString() + @"""></i> <span>" + ds.Tables[0].Rows[i]["DisplayName"].ToString() + @"</span></a>"); }

                strb1.Append(@" <dd>
                               <div class=""title"">
                                 <span><img src=""" + ds.Tables[0].Rows[i]["Class"].ToString() + @""" /></span>" + ds.Tables[0].Rows[i]["DisplayName"].ToString() + @"
                                </div>
                                <ul class=""menuson"">");
                
                
                dsson = GetSonID(user, ds.Tables[0].Rows[i]["ID1"].ToString(), connection);
                if (dsson.Tables[0].Rows.Count > 0)
                {
                    // <li><cite></cite><a href="right.html" target="rightFrame">个人资料</a><i></i></li>
                    
                    for (int s = 0; s < dsson.Tables[0].Rows.Count; s++)
                    {
                        strb1.Append(@"<li><cite></cite><a href=""" + dsson.Tables[0].Rows[s]["LinkURL"].ToString() + @"""  target=""ifrmMain"">" + dsson.Tables[0].Rows[s]["DisplayName"].ToString() + @"</a><i></i></li>");
                    }
                  
                }
                strb1.Append(@"</ul></dd>");
            }
            return strb1;
        }
        public DataSet GetCompanyList( SqlConnection connection)
        {

            DataSet ds = new DataSet();
            string strSQL = @"select * from  company   ";

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);
            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }
        public DataSet GetTeamList(SqlConnection connection)
        {

            DataSet ds = new DataSet();
            string strSQL = @"select * from  team   ";

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);
            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }
        public DataSet GetEmployeeList(SqlConnection connection)
        {

            DataSet ds = new DataSet();
            string strSQL = @"select * from  employee   ";

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);
            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }
        private DataSet GetFatherID(string emp, SqlConnection Connection)
        {
            string strSQL = @"select * from Access a,Authority b 
                                where a.ID2=b.FatherID and a.ID1=b.ProgramID
                                and b.Name='" + emp + "' and ID2='0'  order by ID1   ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
            adapter.Fill(ds);
            Connection.Close();
            return ds;
        }

        private DataSet GetSonID(string emp, string id2, SqlConnection Connection)
        {
            string strSQL = @"select * from Access a,Authority b 
                                where a.ID2=b.FatherID and a.ID1=b.ProgramID
                                and b.Name='" + emp + "' and ID2='" + id2 + "'  order by ID1   ";
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, Connection);
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
            adapter.Fill(ds);
            Connection.Close();
            return ds;
        }

        public Employee GetEmployeeInfo(string employeeName, SqlConnection connection)
        {
            Employee employee = new Employee();
            string strSQL = @"select * from Employee  where name='" + employeeName + "' ";
            string strSQL1 = @"select * from EmpPassword  where emp='" + employeeName + "' ";
            DataSet ds = new DataSet();
            DataSet ds1 = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);
            SqlDataAdapter adapter1 = new SqlDataAdapter(strSQL1, connection);
            connection.Open();
            try
            {
                adapter.Fill(ds);
                adapter1.Fill(ds1);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    employee.EmployeeName = employeeName;
                    employee.CompanyName = ds.Tables[0].Rows[0]["Company"].ToString();
                    employee.PhoneNumber = ds.Tables[0].Rows[0]["PhoneNumber"].ToString();
                    employee.Post = ds.Tables[0].Rows[0]["Post"].ToString();
                    employee.QQNumber = ds.Tables[0].Rows[0]["QQNumber"].ToString();
                    employee.Status = ds.Tables[0].Rows[0]["Status"].ToString();
                    employee.Supervisor = ds.Tables[0].Rows[0]["Supervisor"].ToString();
                    employee.TeamName = ds.Tables[0].Rows[0]["Team"].ToString();
                    employee.WorkStartDate =Convert.ToDateTime( ds.Tables[0].Rows[0]["WorkStartDate"].ToString());
                    employee.Photo = ds.Tables[0].Rows[0]["Team"].ToString();
                }
                if (ds1.Tables[0].Rows.Count > 0)
                {

                    employee.Password = ds1.Tables[0].Rows[0]["Password"].ToString();
                  
                }

            }
            catch (Exception ex)
            {   }
            finally
            {
                connection.Close();
            }
            return employee;
        }

        public string AddTeam(string teamName, string owner, string company, string phone, string slogan, SqlConnection connection)
        {

            string strSQL = @" insert into team(Name,Owner,OwnerPhone,Slogan,Company) 
                               values('" + teamName + "','" + owner + "','" + phone + "','" + slogan + "','" + company + "') ";
      
            DataSet ds = new DataSet();
 
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);
 
  

            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }

        public string AddCompany(string companyName, string owner, string companyID, string phone, string website, string createDate, SqlConnection connection)
        {

            string strSQL = @" insert into company(companyName,Owner,Phone,Website,CreateDate,CompanyID) 
                               values('" + companyName + "','" + owner + "','" + phone + "','" + website + "',cast('" + createDate + "' as date),'" + companyID + "') ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }
     
        public bool CheckCompanyExist(string companyName ,  SqlConnection connection)
        {
           bool res=false;
            string strSQL = @" select * from company where companyName='" + companyName + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                    res = true;

            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                connection.Close();
            }
            return res;
        }
        public bool CheckTeamExist(string companyName, SqlConnection connection)
        {
            bool res = false;
            string strSQL = @" select * from team where name='" + companyName + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                    res = true;

            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                connection.Close();
            }
            return res;
        }
        public bool CheckConfirmAuthority(string username, SqlConnection connection)
        {
            bool res = false;
            string strSQL = @" select * from team where status='在职' and post in('主管','经理') and name='" + username + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                    res = true;

            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                connection.Close();
            }
            return res;
        }
        public bool CheckEmpExist(string companyName, SqlConnection connection)
        {
            bool res = false;
            string strSQL = @" select * from employee where name='" + companyName + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                    res = true;

            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                connection.Close();
            }
            return res;
        }
        public string AddEmpoyee(string name, string company, string team, string post, string supervisor, string phonenumber, string qqnumber, string workstartdate, SqlConnection connection)
        {

            string strSQL = @" insert into employee(name,company,team,post,supervisor,phonenumber,qqnumber,status,workstartdate) 
                               values('" + name + "','" + company + "','" + team + "','" + post + "','" + supervisor + "','" + phonenumber + "','" + qqnumber + "','在职',cast('" + workstartdate + "' as date) ) ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            AddEmpoyeePassword(name, connection);
            return "OK";
        }
        private string AddEmpoyeePassword(string name, SqlConnection connection)
        {

            string strSQL = @" insert into EmpPassWord(emp,password) 
                               values('" + name + "', '12345678' ) ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }
        public string AddCustomer(string type, string name, string phone, string QQ, string mail, string id, string home, string owner, string contract, string createEmp, SqlConnection connection)
        {

            string strSQL = @" insert into customer(customertype,customername,customerphone,customerQQ,mail,customerID,homeaddress,owner,contract,status,createdate,createEmp) 
                               values('" + type + "','" + name + "','" + phone + "','" + QQ + "','" + mail + "','" + id + "','" + home + "','" + owner + "','" + contract + "','未确认',getdate(),'" + createEmp + "'  ) ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }
        public bool CheckCustomerDupAdd( string name,  SqlConnection connection)
        {

            string strSQL = @" select * from customer where  customername ='" + name + "'  and status not in('已完成','已作废')   ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);
            }
            catch (Exception ex)
            {
                return true;
            }
            finally
            {
                connection.Close();
            }

            if (ds.Tables[0].Rows.Count > 0)
            { return true; }
            else
            { return false; }
           
        }
        public string GetCustomerId(string name, SqlConnection connection)
        {

            string strSQL = @" select * from customer where  customername ='" + name + "'  and status not in('已完成','已作废') order by createdate desc  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);
            }
            catch (Exception ex)
            {
               return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }


            return ds.Tables[0].Rows[0]["id"].ToString();

        }
        public bool CheckDateFormat(string dates )
        {
         
            try
            {
                Convert.ToDateTime(dates);

            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
               
            }
            return true;
        }
        public string UpdateCompany(string oldcompanyName,  string owner, string companyID, string phone, string website, string createDate, SqlConnection connection)
        {

            string strSQL = @" update company set    Owner='" + owner + @"',
                                                    Phone='" + phone + @"',
                                                     Website='" + website + @"',
                                                    CreateDate=cast('" + createDate + @"' as date),
                                                     CompanyID='" + companyID +  @"'  
                              where  companyName= '" + oldcompanyName + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }
        public string UpdateTeam(string oldTeamName,   string owner,  string OwnerPhone, string Slogan, string Companys, SqlConnection connection)
        {
 
            string strSQL = @" update team set    Owner='" + owner + @"',
                                                    OwnerPhone='" + OwnerPhone + @"',
                                                     Slogan='" + Slogan + @"', 
                                                     Company='" + Companys + @"'  
                              where  Name= '" + oldTeamName + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }
        public string UpdateEmployee(string name, string company, string team, string post, string supervisor, string phonenumber, string qqnumber, string status, string workstartdate, SqlConnection connection)
        {

            string strSQL = @" update employee set    company='" + company + @"',
                                                    team='" + team + @"',
                                                     post='" + post + @"', 
                                                     supervisor='" + supervisor + @"'  ,
                                                    phonenumber='" + phonenumber + @"' ,
                                                    qqnumber='" + qqnumber + @"' ,
                                                    status='" + status + @"' ,
                                                    workstartdate=cast('" + workstartdate + @"' as date)
                              where  Name= '" + name + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }
        public string AddNewMessage(string sender, string receiver,string subject,string mcontent,string orderid,  SqlConnection connection)
        {

            string strSQL = @" insert into Message(sender,receiver,subject,mcontent,send_date,mstatus,orderid ) 
                               values('" + sender + "','" + receiver + "','" + subject + "','" + mcontent + "',getdate(),'未读','" + orderid + "'  ) ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
  
            return "OK";
        }
        public string GetMessageQuantity(string receiver, SqlConnection connection)
        {

            string strSQL = @" select * from Message where mstatus ='未读' and  receiver ='" + receiver + "'   ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }

            return ds.Tables[0].Rows.Count.ToString();
        }
        public string GetMessageID(string receiver, string sender, string orderid, SqlConnection connection)
        {

            string strSQL = @" select * from Message where    receiver ='" + receiver + "'  and OrderID   ='" + orderid + "' and Sender    ='" + sender + "'";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }

            return ds.Tables[0].Rows[0]["MessageID"].ToString();
        }
        public string DeleteXiaoxi(string id , SqlConnection connection)
        {

            string strSQL = @" delete Message where    MessageID ='" + id + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }

            return "";
        }
        public string UpdateMessageStatus(string id, string status, SqlConnection connection)
        {

            string strSQL = @" update Message set Mstatus='" + status + "' where    MessageID ='" + id + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }

            return "";
        }
        public DataSet GetCompanyInfomation(string employeeName, SqlConnection connection)
        {

            string strSQL = @" select b.* from Employee a,Company b
                                where a.Company=b.CompanyName
                                and a.name= '" + employeeName + "'   ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
            
            }
            finally
            {
                connection.Close();
            }

            return ds;
        }
        public DataSet GetPersonInfomation(string employeeName, SqlConnection connection)
        {

            string strSQL = @" select a.* from Employee a 
                                where   a.name= '" + employeeName + "'   ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }

            return ds;
        }
        public DataSet QueryCompany(string companyName, SqlConnection connection)
        {

            string strSQL = @" select b.* from  Company b
                                where  b.companyname= '" + companyName + "'   ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }

            return ds;
        }
        public DataSet GetCompanyDatapanel( SqlConnection connection)
        {

            string strSQL = @" 
                            select (select  count(*)  from Employee) as employee ,
                            (select  count(*) from Team) as Team ,
                            (select count(*) from Customer 
                            where CreateDate between  cast( getdate()-1   as date) and cast( getdate()   as date))
                              as zuoriyj,
                            (select count(*)  from Customer where CreateDate between
                               CAST( dateadd(day,1-(datepart(weekday,GETDATE()))-6,GETDATE())as date) 
                            and   CAST( dateadd(day,1-(datepart(weekday,GETDATE()))+1,GETDATE())as date) )
                            as shangzhouyj,
                            (select count(*) from Customer 
                            where CreateDate between
                              convert(varchar(8),dateadd(mm,-1,getdate()),120) + '01'
                            and  convert(varchar(10),cast(convert(varchar(8),getdate(),120) + '01' as datetime) - 1,120)
                             ) as shangyueyj,
                            ( select count(*) from Customer) as lishiyj    ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {

            }
            finally
            {
                connection.Close();
            }

            return ds;
        }
        public string AddMyLog(string myName, string subject, string logcontenct,   SqlConnection connection)
        {

            string strSQL = @" insert into mylog(emp,subject,contents,CreateDate) 
                               values('" + myName + "','" + subject + "','" + logcontenct + "', getdate()) ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }
        public string DeleteRizhi(string id, SqlConnection connection)
        {

            string strSQL = @" delete Mylog where    id ='" + id + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }

            return "";
        }
        public string DeleteRiCheng(string id, SqlConnection connection)
        {

            string strSQL = @" delete MyRicheng where    id ='" + id + "'  ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }

            return "";
        }
        public string AddMyRicheng(string myName, string subject, string richengtime, string address,  string detail, SqlConnection connection)
        {

            string strSQL = @" insert into myricheng(Subject,richengtime,address,detail,emp,CreateDate) 
                               values('" + subject + "','" + richengtime + "','" + address + "','" + detail + "','" + myName + "', getdate()) ";

            DataSet ds = new DataSet();

            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);

            if (connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
            try
            {
                adapter.Fill(ds);



            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
            finally
            {
                connection.Close();
            }
            return "OK";
        }
        public DataSet GetUser(string employeeName, SqlConnection connection)
        {
            Employee employee = new Employee();
            string strSQL = "";
            if (employeeName == "")
            {   strSQL = @"select * from Employee   "; }
            else
            {
                  strSQL = @"select * from Employee  where name='" + employeeName + "' ";
            }
            DataSet ds = new DataSet();
 
            SqlDataAdapter adapter = new SqlDataAdapter(strSQL, connection);
 
            connection.Open();
            try
            {
                adapter.Fill(ds);
              
                if (ds.Tables[0].Rows.Count > 0)
                {
                   
                }
 
            }
            catch (Exception ex)
            { }
            finally
            {
                connection.Close();
            }
            return ds;
        }

     
    }
}