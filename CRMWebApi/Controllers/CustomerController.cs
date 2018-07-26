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
    public class CustomerController : ApiController
    {
        CustomerDAL _CustomerDAL = new CustomerDAL();

        [ResponseType(typeof(AjaxResult<IQueryable<Customer>>))]
        public IHttpActionResult Get()
        {
            AjaxResult<IQueryable<Customer>> result = new Models.AjaxResult<IQueryable<Customer>>();
            result.data = _CustomerDAL.Get();
            return Json(result);
        }

        public IHttpActionResult Get(int id)
        {
            return Json(_CustomerDAL.Get().FirstOrDefault(o => o.Id == id));
        }

        public IHttpActionResult Get(string name, int type, int pageSize = 20, int pageIndex = 1)
        {
            AjaxPageResult<DataTable> result = new AjaxPageResult<DataTable>();
            DataTable data = _CustomerDAL.Get(name, type, pageSize, pageIndex);
            int total = _CustomerDAL.GetCount(name, type);
            result.total = total;
            result.data = data;

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Post(Customer model)
        {
            AjaxResult result = new AjaxResult();
            _CustomerDAL.Add(model);

            result.msg = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Put(Customer model)
        {
            AjaxResult result = new AjaxResult();
            _CustomerDAL.Update(model);

            result.msg = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxResult result = new AjaxResult();
            Customer model = _CustomerDAL.Get().FirstOrDefault(o => o.Id == id);
            if (model != null)
            {
                _CustomerDAL.Delete(model);
            }

            result.msg = "删除成功";
            return Json(result);
        }
    }
}
