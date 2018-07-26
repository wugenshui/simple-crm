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
    public class WorkLogController : ApiController
    {
        WorkLogDAL _WorkLogDAL = new WorkLogDAL();

        [HttpGet]
        [ResponseType(typeof(AjaxResult<WorkLog>))]
        public IHttpActionResult Get(int id)
        {
            AjaxResult<WorkLog> result = new AjaxResult<WorkLog>();
            result.data = _WorkLogDAL.Get().FirstOrDefault(o => o.Id == id);
            return Json(result);
        }

        [HttpGet]
        [ResponseType(typeof(AjaxPageResult<IQueryable<WorkLog>>))]
        public IHttpActionResult Get(string title = "", DateTime? date = null, int pageSize = 20, int pageIndex = 1)
        {
            AjaxPageResult<IQueryable<WorkLog>> result = new AjaxPageResult<IQueryable<WorkLog>>();
            IQueryable<WorkLog> data = null;
            data = _WorkLogDAL.Get();
            if (date != null)
            {
                DateTime tomorrow = date.Value.AddDays(1);
                data = data.Where(o => o.CreateTime >= date.Value && o.CreateTime <= tomorrow);
            }
            if (!string.IsNullOrWhiteSpace(title))
            {
                data = data.Where(o => o.Title.Contains(title));
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
        public IHttpActionResult Post(WorkLog log)
        {
            AjaxStringResult result = new AjaxStringResult();
            log.UserId = CommonHelper.User.Id;
            log.CreateTime = DateTime.Now;
            _WorkLogDAL.Add(log);

            result.data = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Put(WorkLog log)
        {
            AjaxStringResult result = new AjaxStringResult();
            log.CreateTime = DateTime.Now;
            _WorkLogDAL.Update(log);

            result.data = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxStringResult result = new AjaxStringResult();
            WorkLog log = _WorkLogDAL.Get().FirstOrDefault(o => o.Id == id);
            if (log != null)
            {
                _WorkLogDAL.Delete(log);
            }

            result.data = "删除成功";
            return Json(result);
        }
    }
}
