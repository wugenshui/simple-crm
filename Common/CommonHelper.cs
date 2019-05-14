using Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Common
{
    public static class CommonHelper
    {
        public const string BasePath = "~/Files/";

        /// <summary>
        /// 当前登陆用户
        /// </summary>
        public static User User
        {
            get
            {
                User user = null;
                string token = HttpContext.Current.Request.Headers["token"];
                if (!string.IsNullOrWhiteSpace(token))
                {
                    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(token);
                    if (ticket != null)
                    {
                        user = JsonHelper.JsonDeserialize<User>(ticket.UserData);
                    }
                }
                return user;
            }
        }

        /// <summary>
        /// 系统名称
        /// </summary>
        public static string AppName
        {
            get { return ConfigurationManager.AppSettings["AppName"]; }
        }

        /// <summary>
        /// 获取上传文件路径
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static string GetMapPath(string fileName)
        {
            string path = string.Empty;
            if (!Directory.Exists(HttpContext.Current.Server.MapPath(BasePath)))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath(BasePath));
            }
            string extension = Path.GetExtension(fileName);
            path = GetNotExistName(fileName, extension, 0);

            return path;
        }

        /// <summary>
        /// 获取不存在的文件名
        /// </summary>
        /// <param name="fileName">文件名</param>
        /// <param name="extension">扩展名</param>
        /// <param name="index">序号</param>
        /// <returns></returns>
        private static string GetNotExistName(string fileName, string extension, int index)
        {
            string newName = string.Empty;
            if (index == 0 && !File.Exists(HttpContext.Current.Server.MapPath(BasePath + fileName)))
            {
                newName = HttpContext.Current.Server.MapPath(BasePath + fileName);
            }
            else
            {
                index++;
                if (File.Exists(HttpContext.Current.Server.MapPath(BasePath + fileName.Replace(extension, "(" + index + ")" + extension))))
                {
                    newName = GetNotExistName(fileName, extension, index);
                }
                else
                {
                    newName = HttpContext.Current.Server.MapPath(BasePath + fileName.Replace(extension, "(" + index + ")" + extension));
                }
            }

            return newName;
        }
    }
}