using Model;
using System;
using System.Collections.Generic;
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
    }
}