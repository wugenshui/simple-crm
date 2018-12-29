using Common;
using CRMWebApi.Models;
using DAL;
using Model;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
        public IHttpActionResult Post()
        {
            AjaxStringResult result = new AjaxStringResult();
            Customer model = new Customer();
            JObject obj = new JObject();
            var form = HttpContext.Current.Request.Form;
            foreach (var key in form.AllKeys)
            {
                obj[key] = form[key];
            }
            model = obj.ToObject<Customer>();
            if (model != null)
            {
                model.CreateTime = DateTime.Now;
                HttpFileCollection filelist = HttpContext.Current.Request.Files;
                if (filelist != null && filelist.Count > 0)
                {
                    string filePath = CommonHelper.GetMapPath(filelist[0].FileName);
                    filelist[0].SaveAs(filePath);
                    model.Contract = Path.GetFileName(filePath);
                }
                _CustomerDAL.Add(model);

                result.data = "保存成功";
            }

            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Put()
        {
            AjaxStringResult result = new AjaxStringResult();
            Customer model = new Customer();
            JObject obj = new JObject();
            var form = HttpContext.Current.Request.Form;
            foreach (var key in form.AllKeys)
            {
                obj[key] = form[key];
            }
            model = obj.ToObject<Customer>();
            if (model != null)
            {
                model.CreateTime = DateTime.Now;
                HttpFileCollection filelist = HttpContext.Current.Request.Files;
                if (filelist != null && filelist.Count > 0)
                {
                    string filePath = CommonHelper.GetMapPath(filelist[0].FileName);
                    filelist[0].SaveAs(filePath);
                    model.Contract = Path.GetFileName(filePath);
                }

                result.data = HttpContext.Current.Request.Form.ToString();
                _CustomerDAL.Update(model);

                result.data = "修改成功";
            }

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
