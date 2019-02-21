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
    public class CustomerOperateController : ApiController
    {
        CustomerOperateDAL _CustomerOperateDAL = new CustomerOperateDAL();

        [HttpGet]
        [ResponseType(typeof(AjaxResult<IQueryable<CustomerOperate>>))]
        public IHttpActionResult Get(int customerId)
        {
            AjaxResult<IQueryable<CustomerOperate>> result = new AjaxResult<IQueryable<CustomerOperate>>();
            IQueryable<CustomerOperate> data = _CustomerOperateDAL.GetByCustomer(customerId);
            result.data = data;

            return Json(result);
        }

        [HttpPost]
        [ResponseType(typeof(AjaxStringResult))]
        public IHttpActionResult Post(CustomerOperate model)
        {
            AjaxStringResult result = new AjaxStringResult();
            CustomerDAL _CustomerDAL = new CustomerDAL();
            UserDAL _UserDAL = new UserDAL();

            Customer customer = _CustomerDAL.Get().FirstOrDefault(o => o.Id == model.CustomerId);
            if (customer != null)
            {
                User user = CommonHelper.User;
                model.OperatorId = user.Id;
                model.OperatorName = user.UserName;
                model.OperatorTime = DateTime.Now;
                model.CustomerName = customer.CustomerName;
                if (model.AssigneeId > 0)
                {
                    User assignee = _UserDAL.Get().FirstOrDefault(o => o.Id == model.AssigneeId);
                    if (assignee != null)
                    {
                        model.AssigneeName = assignee.UserName;
                    }
                }
                _CustomerOperateDAL.Add(model);

                // 更新顾客状态
                if (customer.State != model.State || model.AssigneeId > 0)
                {
                    customer.State = model.State;
                    if (model.AssigneeId > 0)
                    {
                        customer.OwnerID = model.AssigneeId;
                    }

                    _CustomerDAL.Update(customer);
                }
                result.data = "保存成功";
            }
            else
            {
                result.state = false;
                result.error = "客户不存在！";
            }

            return Json(result);
        }
    }
}
