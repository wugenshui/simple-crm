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
using System.Web;
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
            AjaxResult<IQueryable<Customer>> result = new AjaxResult<IQueryable<Customer>>();
            result.data = _CustomerDAL.Get();
            return Json(result);
        }

        [ResponseType(typeof(AjaxResult<Customer>))]
        public IHttpActionResult Get(int id)
        {
            AjaxResult<Customer> result = new AjaxResult<Customer>();
            result.data = _CustomerDAL.Get().FirstOrDefault(o => o.Id == id);
            return Json(result);
        }

        [ResponseType(typeof(AjaxResult<DataTable>))]
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
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Post(Customer model)
        {
            AjaxStringResult result = new AjaxStringResult();
            model.CreateTime = DateTime.Now;
            _CustomerDAL.Add(model);

            result.data = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Put(Customer model)
        {
            HttpFileCollection filelist = HttpContext.Current.Request.Files;
            if (filelist != null && filelist.Count > 0)
            {

            }
            AjaxStringResult result = new AjaxStringResult();
            _CustomerDAL.Update(model);

            result.data = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxStringResult result = new AjaxStringResult();
            Customer model = _CustomerDAL.Get().FirstOrDefault(o => o.Id == id);
            if (model != null)
            {
                _CustomerDAL.Delete(model);
            }

            result.data = "删除成功";
            return Json(result);
        }
    }
}
