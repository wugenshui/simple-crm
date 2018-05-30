using Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Common
{
    public class CommonHelper
    {
        /// <summary>
        /// 当前登陆用户
        /// </summary>
        public static User User
        {
            get
            {
                User user = null;
                string token = HttpContext.Current.Request.Headers["token"];
                if (!string.IsNullOrWhiteSpace(token))
                {
                    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(token);
                    if (ticket != null)
                    {
                        user = JsonHelper.JsonDeserialize<User>(ticket.UserData);
                    }
                }
                return user;
            }
        }

        /// <summary>
        /// 系统名称
        /// </summary>
        public static string AppName
        {
            get { return ConfigurationManager.AppSettings["AppName"]; }
        }
    }
}