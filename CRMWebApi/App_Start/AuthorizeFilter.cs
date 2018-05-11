using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Security;

namespace CRMWebApi
{
    public class AuthorizeFilter : AuthorizeAttribute
    {
        //重写基类的验证方式，加入我们自定义的Ticket验证  
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            //url获取token  
            var content = actionContext.Request.Properties["MS_HttpContext"] as HttpContextBase;
            var token = content.Request.Headers["Token"];
            if (!string.IsNullOrEmpty(token))
            {
                if (ValidateTicket(token))
                {
                    base.IsAuthorized(actionContext);
                }
                else
                {
                    HandleUnauthorizedRequest(actionContext);
                }
            }
            else //如果取不到身份验证信息，并且不允许匿名访问，则返回未验证401  
            {
                var attributes = actionContext.ActionDescriptor.GetCustomAttributes<AllowAnonymousAttribute>().OfType<AllowAnonymousAttribute>();
                bool isAnonymous = attributes.Any(a => a is AllowAnonymousAttribute);
                if (isAnonymous)
                {
                    base.OnAuthorization(actionContext);
                }
                else
                {
                    HandleUnauthorizedRequest(actionContext);
                }
            }
        }

        // 校验票据（存在且未过期）
        private bool ValidateTicket(string encryptToken)
        {
            bool flag = false;
            try
            {
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(encryptToken);
                if (ticket != null && ticket.Expiration > DateTime.Now) // 未到截至时间
                {
                    flag = true;
                }
            }
            catch (Exception ex)
            {

            }

            return flag;
        }
    }
}