using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class AjaxResult
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
        /// 消息
        /// </summary>
        public object msg { get; set; }
    }
}
