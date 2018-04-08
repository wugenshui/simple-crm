using Common;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM.page.PersonCenter
{
    public partial class PasswordChange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.RequestType == "POST")
            {
                if (Request.Form["type"] == "change")
                {
                    if (MD5Helper.CreateMD5(Request.Form["txtOld"]) == CommonHelper.User.Password)
                    {
                        CommonHelper.User.Password = MD5Helper.CreateMD5(Request.Form["txtNew"]);
                        UserDAL _UserDAL = new UserDAL();
                        _UserDAL.Update(CommonHelper.User);

                        Response.Write("保存成功");
                        Response.End();
                    }
                    else
                    {
                        Response.Write("原密码校验错误！");
                        Response.End();
                    }
                }
            }
        }
    }
}