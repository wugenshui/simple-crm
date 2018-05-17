using Common;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CRMWebApi.Controllers
{
    public class PasswordController : ApiController
    {
        UserDAL _UserDAL = new UserDAL();

        [HttpPut]
        public IHttpActionResult change([FromBody]string password)
        {
            AjaxResult result = new AjaxResult();
            User user = CommonHelper.User;
            user.Password = MD5Helper.CreateMD5(password);
            _UserDAL.changePassword(user);

            return Json(result);
        }
    }
}
