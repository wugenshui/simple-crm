using Common;
using CRMWebApi.Models;
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
    public class TeamController : ApiController
    {
        TeamDAL _TeamDAL = new TeamDAL();

        [HttpGet]
        [ResponseType(typeof(AjaxResult<IQueryable<Team>>))]
        public IHttpActionResult Get()
        {
            AjaxResult<IQueryable<Team>> result = new AjaxResult<IQueryable<Team>>();
            result.data = _TeamDAL.Get();
            return Json(result);
        }

        [HttpGet]
        [ResponseType(typeof(AjaxResult<Team>))]
        public IHttpActionResult Get(int id)
        {
            AjaxResult<Team> result = new AjaxResult<Team>();
            result.data = _TeamDAL.Get().FirstOrDefault(o => o.Id == id);
            return Json(result);
        }

        [HttpGet]
        [ResponseType(typeof(AjaxPageResult<DataTable>))]
        public IHttpActionResult Get(string name, int pageSize = 20, int pageIndex = 1)
        {
            AjaxPageResult<DataTable> result = new AjaxPageResult<DataTable>();
            DataTable data = _TeamDAL.Get(name, pageSize, pageIndex);

            result.data = data;
            result.total = data.Rows.Count;

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Post(Team model)
        {
            AjaxStringResult result = new AjaxStringResult();
            _TeamDAL.Add(model);

            result.data = "保存成功";
            return Json(result);
        }

        [HttpPut]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Put(Team model)
        {
            AjaxStringResult result = new AjaxStringResult();
            _TeamDAL.Update(model);

            result.data = "修改成功";
            return Json(result);
        }

        [HttpDelete]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Delete(int id)
        {
            AjaxStringResult result = new AjaxStringResult();
            Team model = _TeamDAL.Get().FirstOrDefault(o => o.Id == id);
            if (model != null)
            {
                _TeamDAL.Delete(model);
            }

            result.data = "删除成功";
            return Json(result);
        }
    }
}

