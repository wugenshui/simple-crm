using Common;
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

        public IHttpActionResult Get()
        {
            return Json(_CompanyDAL.Get());
        }

        public IHttpActionResult Get(int id)
        {
            return Json(_CompanyDAL.Get().FirstOrDefault(o => o.Id == id));
        }

        public IHttpActionResult Get(string name, int pageSize = 20, int pageIndex = 1)
        {
            IQueryable<Company> list = _CompanyDAL.Get();
            if (!string.IsNullOrWhiteSpace(name))
            {
                list = list.Where(o => o.CompanyName.Contains(name));
            }
            int total = list.Count();
            list = list.OrderByDescending(o => o.CreateTime)
                .Skip(pageSize * (pageIndex - 1))
                .Take(pageSize);

            var result = new { list = list, total = total };

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Post(Company model)
        {
            AjaxResult result = new AjaxResult();
            model.CreateTime = DateTime.Now;
            _CompanyDAL.Add(model);

            result.msg = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Put(Company model)
        {
            AjaxResult result = new AjaxResult();
            model.CreateTime = DateTime.Now;
            _CompanyDAL.Update(model);

            result.msg = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxResult result = new AjaxResult();
            Company model = _CompanyDAL.Get().FirstOrDefault(o => o.Id == id);
            if (model != null)
            {
                _CompanyDAL.Delete(model);
            }

            result.msg = "删除成功";
            return Json(result);
        }
    }
}

