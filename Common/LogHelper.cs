using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common
{
    public class LogHelper
    {
        // 日志纪录对象
        private static readonly ILogger _Log = LogManager.GetLogger("NLog");

        /// <summary>
        /// 记录错误日志
        /// </summary>
        /// <param name="info">日志信息</param>
        public static void Error(object info)
        {
            try
            {
                if (_Log.IsErrorEnabled)
                    _Log.Error(info);
            }
            catch (Exception)
            {
                // 防止因为日志记录报错导致系统异常
            }
        }

        /// <summary>
        /// 记录调试日志
        /// </summary>
        /// <param name="info">日志信息</param>
        public static void Debug(object info)
        {
            try
            {
                if (_Log.IsDebugEnabled)
                    _Log.Debug(info);
            }
            catch (Exception)
            {
                // 防止因为日志记录报错导致系统异常
            }
        }

        /// <summary>
        /// 记录信息日志
        /// </summary>
        /// <param name="info">日志信息</param>
        public static void Info(object info)
        {
            try
            {
                if (_Log.IsInfoEnabled)
                    _Log.Info(info);
            }
            catch (Exception)
            {
                // 防止因为日志记录报错导致系统异常
            }
        }
    }
}
