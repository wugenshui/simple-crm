using Common;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM.page.PersonCenter
{
    public partial class WorkLogList : System.Web.UI.Page
    {
        public List<WorkLog> logs = new List<WorkLog>();

        protected void Page_Load(object sender, EventArgs e)
        {
            WorkLogDAL _WorkLogDAL = new WorkLogDAL();
            if (Request.QueryString["type"] == "del")
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                var model = _WorkLogDAL.Get().FirstOrDefault(o => o.Id == id);
                _WorkLogDAL.Delete(model);
                Response.Write("删除成功！");
                Response.End();
            }
            logs = _WorkLogDAL.Get().Where(o => o.UserId == CommonHelper.User.Id).ToList();
        }
    }
}