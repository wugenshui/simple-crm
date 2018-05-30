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
    public class UserController : ApiController
    {
        UserDAL _UserDAL = new UserDAL();

        public IHttpActionResult Get()
        {
            return Json(_UserDAL.Get());
        }

        public IHttpActionResult Get(int id)
        {
            return Json(_UserDAL.Get().FirstOrDefault(o => o.Id == id));
        }

        public IHttpActionResult Get(string name, int pageSize = 20, int pageIndex = 1)
        {
            DataTable data = _UserDAL.Get(name, pageSize, pageIndex);
            var result = new { list = data, total = data.Rows.Count };

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Post(User model)
        {
            AjaxResult result = new AjaxResult();
            model.Password = MD5Helper.CreateMD5(model.Password);
            _UserDAL.Add(model);

            result.msg = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Put(User model)
        {
            AjaxResult result = new AjaxResult();
            _UserDAL.Update(model);

            result.msg = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxResult result = new AjaxResult();
            User model = _UserDAL.Get().FirstOrDefault(o => o.Id == id);
            if (model != null)
            {
                _UserDAL.Delete(model);
            }

            result.msg = "删除成功";
            return Json(result);
        }
    }
}
