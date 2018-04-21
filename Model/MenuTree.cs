using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class MenuTree
    {
        public string MenuName { get; set; }
        public string MenuURL { get; set; }
        public string Class { get; set; }
        public List<MenuTree> Childs { get; set; }
    }
}
