using Common;
using CRMWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Filters;

namespace CRMWebApi.App_Start
{
    public class WebApiErrorHandleAttribute : ExceptionFilterAttribute
    {
        public override void OnException(HttpActionExecutedContext actionExecutedContext)
        {
            LogHelper.Error(actionExecutedContext.Exception);
            actionExecutedContext.Response = actionExecutedContext.Request.CreateResponse(HttpStatusCode.OK,
            new AjaxResult<string>()
            {
                state = false,
                error = actionExecutedContext.Exception.Message
            });
        }
    }
}