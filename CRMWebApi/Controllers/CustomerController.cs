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
    public class CustomerController : ApiController
    {
        CustomerDAL _CustomerDAL = new CustomerDAL();

        public IHttpActionResult Get()
        {
            return Json(_CustomerDAL.Get());
        }

        public IHttpActionResult Get(int id)
        {
            return Json(_CustomerDAL.Get().FirstOrDefault(o => o.Id == id));
        }

        public IHttpActionResult Get(string name, int type, int pageSize = 20, int pageIndex = 1)
        {
            DataTable data = _CustomerDAL.Get(name, type, pageSize, pageIndex);
            int total = _CustomerDAL.GetCount(name, type);

            var result = new { list = data, total = total };

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
