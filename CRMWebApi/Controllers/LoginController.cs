using Common;
using DAL;
using Model;
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
        UserDAL _UserDAL = new UserDAL();

        [AllowAnonymous]
        [HttpGet]
        public IHttpActionResult Login(string username, string password)
        {
            AjaxResult result = new AjaxResult();
            string md5Password = MD5Helper.CreateMD5(password);
            bool isExist = _UserDAL.IsExist(o => o.LoginName == username && o.Password == md5Password);
            if (isExist)
            {
                string userData = string.Format("{0}&{1}", username, password);
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(0, username, DateTime.Now, DateTime.Now.AddDays(1), true, userData);
                result.msg = FormsAuthentication.Encrypt(ticket);
            }
            else
            {
                result.state = false;
                result.msg = "用户登陆校验失败！";
            }
            return Json(result);
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
