//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model
{
    /// <summary>
    /// Message
    /// </summary> 
    using System;
    using System.Collections.Generic;
    
    public partial class Message
    {
        /// <summary>
    	/// 
    	/// </summary>
    	public int ID { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	public Nullable<int> SenderID { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	public Nullable<int> ReceiverID { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	public string Subject { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	public string Content { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	public Nullable<System.DateTime> SendTime { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	public Nullable<int> State { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	public string Num { get; set; }
    }
}
