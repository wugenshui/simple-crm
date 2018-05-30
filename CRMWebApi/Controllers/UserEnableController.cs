using Common;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;


namespace CRMWebApi.Controllers
{
    public class UserEnableController : ApiController
    {
        UserDAL _UserDAL = new UserDAL();

        [HttpPut]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Put(User model)
        {
            AjaxResult result = new AjaxResult();
            _UserDAL.changeState(model);

            result.msg = model.UserName + (model.IsEnable ? "启用" : "禁用") + "成功!";
            return Json(result);
        }
    }
}
