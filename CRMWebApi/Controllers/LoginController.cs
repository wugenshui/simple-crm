using Common;
using CRMWebApi.Models;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Security;

namespace CRMWebApi.Controllers
{
    public class LoginController : ApiController
    {
        UserDAL _UserDAL = new UserDAL();

        [AllowAnonymous]
        [HttpPost]
        [ResponseType(typeof(AjaxResult<LoginInfo>))]
        public IHttpActionResult Login([FromBody]LoginForm loginForm)
        {
            AjaxResult<LoginInfo> result = new AjaxResult<LoginInfo>();
            string md5Password = MD5Helper.CreateMD5(loginForm.password);
            User user = _UserDAL.Get().FirstOrDefault(o => o.LoginName == loginForm.username && o.Password == md5Password);
            if (user != null)
            {
                user.Password = ""; // 将密码隐藏
                string userData = JsonHelper.JsonSerialize(user);
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(0, loginForm.username, DateTime.Now, DateTime.Now.AddDays(1), true, userData);
                LoginInfo data = new LoginInfo() { token = FormsAuthentication.Encrypt(ticket), user = user };
                result.data = data;
            }
            else
            {
                result.state = false;
                result.error = "用户登陆校验失败！";
            }
            return Json(result);
        }
    }
}
