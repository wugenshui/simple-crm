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
            logs = _WorkLogDAL.Get().Where(o => o.UserId == CommonHelper.User.ID).ToList();
        }
    }
}