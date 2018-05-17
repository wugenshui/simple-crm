using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CRMWebApi.Controllers
{
    public class WorkLogController : ApiController
    {
        WorkLogDAL _WorkLogDAL = new WorkLogDAL();

        public IHttpActionResult Get()
        {
            var logs = _WorkLogDAL.Get();

            return Json(logs);
        }
    }
}
