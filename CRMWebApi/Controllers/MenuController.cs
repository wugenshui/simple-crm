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
    public class MenuController : ApiController
    {
        /// <summary>
        /// 获取指定用户的菜单权限（树形结构）
        /// </summary>
        /// <returns></returns>
        [ResponseType(typeof(AjaxResult<List<MenuTree>>))]
        public IHttpActionResult get()
        {
            AjaxResult<List<MenuTree>> result = new AjaxResult<List<MenuTree>>();
            User user = CommonHelper.User;
            result.data = new MenuDAL().getMenuTree(user.Id);
            return Json(result);
        }
    }
}
