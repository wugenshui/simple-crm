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
    public class CompanyController : ApiController
    {
        CompanyDAL _CompanyDAL = new CompanyDAL();

        [HttpGet]
        [ResponseType(typeof(AjaxResult<IQueryable<Company>>))]
        public IHttpActionResult Get()
        {
            AjaxResult<IQueryable<Company>> result = new AjaxResult<IQueryable<Company>>();
            result.data = _CompanyDAL.Get();
            return Json(result);
        }

        [HttpGet]
        [ResponseType(typeof(AjaxResult<Company>))]
        public IHttpActionResult Get(int id)
        {
            AjaxResult<Company> result = new AjaxResult<Company>();
            result.data = _CompanyDAL.Get().FirstOrDefault(o => o.Id == id);
            return Json(result);
        }

        [HttpGet]
        [ResponseType(typeof(AjaxPageResult<IQueryable<Company>>))]
        public IHttpActionResult Get(string name, int pageSize = 20, int pageIndex = 1)
        {
            AjaxPageResult<IQueryable<Company>> result = new AjaxPageResult<IQueryable<Company>>();
            IQueryable<Company> data = _CompanyDAL.Get();
            if (!string.IsNullOrWhiteSpace(name))
            {
                data = data.Where(o => o.CompanyName.Contains(name));
            }
            int total = data.Count();
            data = data.OrderByDescending(o => o.CreateTime)
                .Skip(pageSize * (pageIndex - 1))
                .Take(pageSize);
            result.data = data;
            result.total = total;

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Post(Company model)
        {
            AjaxStringResult result = new AjaxStringResult();
            model.CreateTime = DateTime.Now;
            _CompanyDAL.Add(model);

            result.data = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Put(Company model)
        {
            AjaxStringResult result = new AjaxStringResult();
            model.CreateTime = DateTime.Now;
            _CompanyDAL.Update(model);

            result.data = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxStringResult result = new AjaxStringResult();
            Company model = _CompanyDAL.Get().FirstOrDefault(o => o.Id == id);
            if (model != null)
            {
                _CompanyDAL.Delete(model);
            }

            result.data = "删除成功";
            return Json(result);
        }
    }
}

