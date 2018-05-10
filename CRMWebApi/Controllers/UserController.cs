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
    public class UserController : ApiController
    {
        [AllowAnonymous]
        public IHttpActionResult get()
        {
            Company com = new Company();
            UserDAL _UserDAL = new UserDAL();
            var users = _UserDAL.Get();
            return Json(users);
        }

        public IHttpActionResult get(int id)
        {
            Company com = new Company();
            UserDAL _UserDAL = new UserDAL();
            var users = _UserDAL.Get().First(o => o.Id == id);
            return Json(users);
        }
    }
}
