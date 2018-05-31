using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common
{
    /// <summary>
    /// 职位
    /// </summary>
    public enum Post
    {
        业务 = 0,
        主管 = 1,
        经理 = 2
    }

    /// <summary>
    /// 客户类型
    /// </summary>
    public enum CustomerType
    {
        客户单子 = 0,
        员工单子 = 1,
        商家单子 = 2,
        商城单子 = 3
    }

    /// <summary>
    /// 客户状态
    /// </summary>
    public enum CustomerState
    {
        未确认 = 0,
        已确认 = 1,
        已分配 = 2,
        已联系 = 3,
        已完成 = 4,
        已作废 = 5
    }
}
