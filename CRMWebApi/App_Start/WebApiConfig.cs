﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;

namespace CRMWebApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // 允许跨域访问
            config.EnableCors(new EnableCorsAttribute("*", "*", "*"));
            // Web API 配置和服务
            config.Filters.Add(new AuthorizeFilterAttribute());
            // Web API 路由
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Filters.Add(new WebApiErrorHandleAttribute());
        }
    }
}
