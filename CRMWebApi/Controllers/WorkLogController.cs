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
            logs = logs.OrderBy(o => o.CreateTime)
                .Skip(pageSize * (pageIndex - 1))
                .Take(pageSize);

            var result = new { logs = logs, total = total };

            return Json(result);
        }
    }
}
