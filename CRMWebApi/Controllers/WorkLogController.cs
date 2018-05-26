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
    public class WorkLogController : ApiController
    {
        WorkLogDAL _WorkLogDAL = new WorkLogDAL();

        public IHttpActionResult Get(int id)
        {
            return Json(_WorkLogDAL.Get().FirstOrDefault(o => o.Id == id));
        }

        public IHttpActionResult Get(string title = "", DateTime? date = null, int pageSize = 20, int pageIndex = 1)
        {
            IQueryable<WorkLog> logs = null;
            logs = _WorkLogDAL.Get();
            if (date != null)
            {
                DateTime tomorrow = date.Value.AddDays(1);
                logs = logs.Where(o => o.CreateTime >= date.Value && o.CreateTime <= tomorrow);
            }
            if (!string.IsNullOrWhiteSpace(title))
            {
                logs = logs.Where(o => o.Title.Contains(title));
            }
            int total = logs.Count();
            logs = logs.OrderByDescending(o => o.CreateTime)
                .Skip(pageSize * (pageIndex - 1))
                .Take(pageSize);

            var result = new { logs = logs, total = total };

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Post(WorkLog log)
        {
            AjaxResult result = new AjaxResult();
            log.UserId = CommonHelper.User.Id;
            log.CreateTime = DateTime.Now;
            _WorkLogDAL.Add(log);

            result.msg = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Put(WorkLog log)
        {
            AjaxResult result = new AjaxResult();
            log.CreateTime = DateTime.Now;
            _WorkLogDAL.Update(log);

            result.msg = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxResult result = new AjaxResult();
            WorkLog log = _WorkLogDAL.Get().FirstOrDefault(o => o.Id == id);
            if (log != null)
            {
                _WorkLogDAL.Delete(log);
            }

            result.msg = "删除成功";
            return Json(result);
        }
    }
}
