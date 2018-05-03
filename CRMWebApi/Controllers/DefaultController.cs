using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CRMWebApi.Controllers
{
    public class DefaultController : ApiController
    {
        public class Student
        {
            public string Name { get; set; }
            public int age { get; set; }
        }

        [HttpGet]
        public IHttpActionResult get()
        {
            JsonSerializerSettings settings = new JsonSerializerSettings();
            // 驼峰式大小写
            settings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            //settings.ContractResolver = new DefaultContractResolver();
            Student student = new Student() { Name = "张三", age = 18 };
            return Json(student, settings);
        }
    }
}
