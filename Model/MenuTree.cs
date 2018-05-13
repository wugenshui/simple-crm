using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class MenuTree
    {
        public string name { get; set; }
        public string url { get; set; }
        public string _class { get; set; }
        public List<MenuTree> childs { get; set; }
        public bool showChild { get; set; }
    }
}
