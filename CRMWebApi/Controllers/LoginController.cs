using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Security;

namespace CRMWebApi.Controllers
{
    public class LoginController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public object Login(string username, string password)
        {
            if (!ValidateUser(username, password))
            {
                return new { bRes = false };
            }
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(0, username, DateTime.Now,
                            DateTime.Now.AddHours(1), true, string.Format("{0}&{1}", username, password),
                            FormsAuthentication.FormsCookiePath);
            //返回登录结果、用户信息、用户验证票据信息
            var oUser = new UserInfo { bRes = true, UserName = username, Password = password, Ticket = FormsAuthentication.Encrypt(ticket) };
            //将身份信息保存在session中，验证当前请求是否是有效请求
            //HttpContext.Current.Session[username] = oUser;
            return oUser;
        }

        private bool ValidateUser(string strUser, string strPwd)
        {
            if (strUser == "admin" && strPwd == "123456")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public class UserInfo
        {
            public bool bRes { get; set; }

            public string UserName { get; set; }

            public string Password { get; set; }

            public string Ticket { get; set; }
        }
    }
}
