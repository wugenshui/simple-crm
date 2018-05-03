using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CRMWebApi.Controllers
{
    public class DefaultController : ApiController
    {
        [HttpGet]
        public IHttpActionResult get()
        {
            return Json(123);
        }
    }
}
