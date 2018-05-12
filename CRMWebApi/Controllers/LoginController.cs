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
        [HttpPost]
        public IHttpActionResult Login(LoginForm loginForm)
        {
            AjaxResult result = new AjaxResult();
            string md5Password = MD5Helper.CreateMD5(loginForm.password);
            User user = _UserDAL.Get().FirstOrDefault(o => o.LoginName == loginForm.username && o.Password == md5Password);
            if (user != null)
            {
                user.Password = "";
                string userData = JsonHelper.JsonSerialize(user);
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(0, loginForm.username, DateTime.Now, DateTime.Now.AddDays(1), true, userData);
                var model = new { token = FormsAuthentication.Encrypt(ticket), user = user };
                result.msg = model;
            }
            else
            {
                result.state = false;
                result.msg = "用户登陆校验失败！";
            }
            return Json(result);
        }
    }
}
