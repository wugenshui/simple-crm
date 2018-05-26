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
    public class TeamController : ApiController
    {
        TeamDAL _TeamDAL = new TeamDAL();

        public IHttpActionResult Get(int id)
        {
            return Json(_TeamDAL.Get().FirstOrDefault(o => o.Id == id));
        }

        public IHttpActionResult Get(string name, int pageSize = 20, int pageIndex = 1)
        {
            IQueryable<Team> list = _TeamDAL.Get();
            if (!string.IsNullOrWhiteSpace(name))
            {
                list = list.Where(o => o.Name.Contains(name));
            }
            int total = list.Count();
            list = list.OrderByDescending(o => o.Id)
                .Skip(pageSize * (pageIndex - 1))
                .Take(pageSize);

            var result = new { list = list, total = total };

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Post(Team model)
        {
            AjaxResult result = new AjaxResult();
            _TeamDAL.Add(model);

            result.msg = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Put(Team model)
        {
            AjaxResult result = new AjaxResult();
            _TeamDAL.Update(model);

            result.msg = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxResult result = new AjaxResult();
            Team model = _TeamDAL.Get().FirstOrDefault(o => o.Id == id);
            if (model != null)
            {
                _TeamDAL.Delete(model);
            }

            result.msg = "删除成功";
            return Json(result);
        }
    }
}

