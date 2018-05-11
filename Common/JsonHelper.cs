using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace common
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

        /// <summary>
        /// DataTable序列化为Json字符串
        /// </summary>
        /// <param name="table">需要序列化的DataTable</param>
        /// <returns>Json字符串</returns>
        public static string DataTableToJson(DataTable table)
        {
            if (table.Rows.Count == 0) return "";

            StringBuilder sbJson = new StringBuilder();
            sbJson.Append("[");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                sbJson.Append("{");
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    string colName = table.Columns[j].ColumnName.ToString();
                    string colData = table.Rows[i][j].ToString();
                    if (table.Columns[j].DataType.ToString() == "System.DateTime")
                    {
                        colData = Convert.ToDateTime(colData).ToString("yyyy-MM-dd HH:mm:ss");
                    }
                    sbJson.Append("\"" + colName + "\":\"" + colData + "\"");
                    if (j < table.Columns.Count - 1)
                    {
                        sbJson.Append(",");
                    }
                }
                sbJson.Append("}");
                if (i < table.Rows.Count - 1)
                {
                    sbJson.Append(",");
                }
            }
            sbJson.Append("]");

            return sbJson.ToString();
        }
    }
}
