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
    public class CompanyController : ApiController
    {
        public IHttpActionResult get()
        {
            Company com = new Company();
            UserDAL _UserDAL = new UserDAL();
            var users = _UserDAL.Get();
            return Json(users);
        }
    }
}
