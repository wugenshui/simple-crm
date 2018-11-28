using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace Common
{
    public class JsonHelper
    {
        /// <summary>
        /// 对象序列化为Json字符串
        /// </summary>
        /// <param name="obj">对象</param>
        /// <param name="formatting">格式化参数</param>
        /// <param name="settings">Json 转换设置参数</param>
        /// <returns>Json字符串</returns>
        public static string JsonSerialize(object obj)
        {
            string jsonString = JsonConvert.SerializeObject(obj);

            return jsonString;
        }

        /// <summary>
        /// Json字符串反序列化为对象
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="jsonString">Json字符串</param>
        /// <returns>序列化后的对象</returns>
        public static T JsonDeserialize<T>(string jsonString)
        {
            T t = default(T);
            t = JsonConvert.DeserializeObject<T>(jsonString);

            return t;
        }

        /// <summary>
        /// 实体-序列化-反序列化为指定实体
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="object">转换实体</param>
        /// <returns>序列化后的对象</returns>
        public static T EntityParse<T>(object obj)
        {
            string jsonString = JsonConvert.SerializeObject(obj);
            T t = default(T);
            t = JsonConvert.DeserializeObject<T>(jsonString);

            return t;
        }
    }
}
