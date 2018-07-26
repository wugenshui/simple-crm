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

namespace CRMWebApi.Controllers
{
    public class PasswordController : ApiController
    {
        UserDAL _UserDAL = new UserDAL();

        [HttpPut]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult change([FromBody]dynamic password)
        {
            AjaxStringResult result = new AjaxStringResult();
            User user = CommonHelper.User;
            string oldPassword = MD5Helper.CreateMD5(password.txtOld.ToString());
            if (!string.IsNullOrWhiteSpace(oldPassword))
            {
                if (_UserDAL.IsExist(o => o.Id == user.Id && o.Password == oldPassword))
                {
                    if (!string.IsNullOrWhiteSpace(password.txtNew.ToString()))
                    {
                        user.Password = MD5Helper.CreateMD5(password.txtNew.ToString());
                        _UserDAL.changePassword(user);
                        result.data = "密码修改成功！";
                    }
                    else
                    {
                        result.state = false;
                        result.error = "新密码不能为空！";
                    }
                }
                else
                {
                    result.state = false;
                    result.error = "原密码校验失败！";
                }
            }
            else
            {
                result.state = false;
                result.error = "原密码不能为空！";
            }

            return Json(result);
        }
    }
}
