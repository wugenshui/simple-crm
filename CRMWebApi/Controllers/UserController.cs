using Common;
using CRMWebApi.Models;
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

        [HttpGet]
        [ResponseType(typeof(AjaxResult<IQueryable<User>>))]
        public IHttpActionResult Get()
        {
            AjaxResult<IQueryable<User>> result = new AjaxResult<IQueryable<User>>();
            result.data = _UserDAL.Get();
            return Json(result);
        }

        [HttpGet]
        [ResponseType(typeof(AjaxResult<User>))]
        public IHttpActionResult Get(int id)
        {
            AjaxResult<User> result = new AjaxResult<User>();
            result.data = _UserDAL.Get().FirstOrDefault(o => o.Id == id);
            return Json(result);
        }

        [HttpGet]
        [ResponseType(typeof(AjaxPageResult<DataTable>))]
        public IHttpActionResult Get(string name, int pageSize = 20, int pageIndex = 1)
        {
            AjaxPageResult<DataTable> result = new AjaxPageResult<DataTable>();
            DataTable data = _UserDAL.Get(name, pageSize, pageIndex);
            result.data = data;
            result.total = data.Rows.Count;

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Post(User model)
        {
            AjaxStringResult result = new AjaxStringResult();
            model.Password = MD5Helper.CreateMD5(model.Password);
            _UserDAL.Add(model);

            result.data = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Put(User model)
        {
            AjaxStringResult result = new AjaxStringResult();
            _UserDAL.Update(model);

            result.data = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxStringResult result = new AjaxStringResult();
            User model = _UserDAL.Get().FirstOrDefault(o => o.Id == id);
            if (model != null)
            {
                _UserDAL.Delete(model);
            }

            result.data = "删除成功";
            return Json(result);
        }
    }
}
