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
    using System.Collections.Generic;
    using Newtonsoft.Json;
    
    public partial class Schedule
    {
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("id")]
    	public int Id { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("subject")]
    	public string Subject { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("time")]
    	public System.DateTime Time { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("address")]
    	public string Address { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("detail")]
    	public string Detail { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("userId")]
    	public int UserId { get; set; }
        /// <summary>
    	/// 
    	/// </summary>
    	[JsonProperty("createTime")]
    	public System.DateTime CreateTime { get; set; }
    }
}
