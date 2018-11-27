using Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http;

namespace CRMWebApi.Controllers
{
    public class DownLoadController : ApiController
    {
        /// <summary>
        /// 从WebAPI下载文件
        /// </summary>
        /// <param name="file">文件名称</param>
        /// <returns></returns>
        [AllowAnonymous]
        public IHttpActionResult Get(string file)
        {
            var browser = string.Empty;
            if (HttpContext.Current.Request.UserAgent != null)
            {
                browser = HttpContext.Current.Request.UserAgent.ToUpper();
            }
            string filePath = HttpContext.Current.Server.MapPath(CommonHelper.BasePath + file);
            HttpResponseMessage httpResponseMessage = new HttpResponseMessage(HttpStatusCode.OK);
            FileStream fileStream = File.OpenRead(filePath);
            httpResponseMessage.Content = new StreamContent(fileStream);
            httpResponseMessage.Content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");
            httpResponseMessage.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment")
            {
                FileName = browser.Contains("FIREFOX") ? Path.GetFileName(filePath) : HttpUtility.UrlEncode(Path.GetFileName(filePath))
            };

            return ResponseMessage(httpResponseMessage);
        }
    }
}
