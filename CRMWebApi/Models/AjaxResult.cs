﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRMWebApi.Models
{
    public class AjaxResult<T>
    {
        private bool _state = true;
        /// <summary>
        /// 状态
        /// </summary>
        public bool state
        {
            get { return _state; }
            set { _state = value; }
        }

        /// <summary>
        /// 错误描述
        /// </summary>
        public string error { get; set; }

        public T data { get; set; }
    }

    public class AjaxStringResult : AjaxResult<string>
    {

    }

    public class AjaxIntResult : AjaxResult<int>
    {

    }

    public class AjaxObjectResult : AjaxResult<object>
    {

    }

    public class AjaxPageResult<T> : AjaxResult<T>
    {
        public int total { get; set; }
    }
}