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

        public IHttpActionResult Get(int id)
        {
            return Json(_CompanyDAL.Get().FirstOrDefault(o => o.Id == id));
        }

        public IHttpActionResult Get(string name, int pageSize = 20, int pageIndex = 1)
        {
            IQueryable<Company> companys = _CompanyDAL.Get();
            if (!string.IsNullOrWhiteSpace(name))
            {
                companys = companys.Where(o => o.CompanyName.Contains(name));
            }
            int total = companys.Count();
            companys = companys.OrderByDescending(o => o.CreateTime)
                .Skip(pageSize * (pageIndex - 1))
                .Take(pageSize);

            var result = new { companys = companys, total = total };

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Post(Company company)
        {
            AjaxResult result = new AjaxResult();
            company.CreateTime = DateTime.Now;
            _CompanyDAL.Add(company);

            result.msg = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Put(Company company)
        {
            AjaxResult result = new AjaxResult();
            company.CreateTime = DateTime.Now;
            _CompanyDAL.Update(company);

            result.msg = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxResult result = new AjaxResult();
            Company company = _CompanyDAL.Get().FirstOrDefault(o => o.Id == id);
            if (company != null)
            {
                _CompanyDAL.Delete(company);
            }

            result.msg = "删除成功";
            return Json(result);
        }
    }
}

