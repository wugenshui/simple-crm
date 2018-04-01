using Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Common
{
    public class CommonHelper
    {
        /// <summary>
        /// 当前登陆用户
        /// </summary>
        public static User User
        {
            get { return HttpContext.Current.Session["user"] as User; }
            set { HttpContext.Current.Session["user"] = value; }
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