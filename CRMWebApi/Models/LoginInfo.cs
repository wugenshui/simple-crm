using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRMWebApi.Models
{
    public class LoginInfo
    {
        public string token { get; set; }
        public User user { get; set; }
    }
}