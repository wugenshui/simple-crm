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
    /// Schedule
    /// </summary> 
    using System;
    using System.Collections.Generic;using Newtonsoft.Json;
    using Newtonsoft.Json;
    
    public partial class Schedule
    {
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("ID")]
    	public int ID { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("Subject")]
    	public string Subject { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("Time")]
    	public System.DateTime Time { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("Address")]
    	public string Address { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("Detail")]
    	public string Detail { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("UserID")]
    	public int UserID { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("CreateTime")]
    	public System.DateTime CreateTime { get; set; }
    }
}