using System;
using System.Data;
using System.Xml;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;

namespace common
{
    /// <summary> 
    /// SqlServer数据访问帮助类 
    /// </summary> 
    public sealed class SqlHelper
    {
        #region 私有构造函数和方法

        private SqlHelper() { }

        /// <summary> 
        /// 获取数据库连接字符串 
        /// </summary> 
        /// <returns></returns> 
        public static string GetConnSting()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            return connectionString;
        }
        /// <summary> 
        /// 获取数据库连接对象 
        /// </summary> 
        /// <returns></returns> 
        public static SqlConnection GetConnection()
        {
            return new SqlConnection(GetConnSting());
        }

        /// <summary>
        /// 大数据量批量插入BulkToDB
        /// </summary>
        /// <param name="data">数据表</param>
        public static void BulkToDB(DataTable data)
        {
            SqlConnection conn = new SqlConnection(GetConnSting());
            SqlBulkCopy bulkCopy = new SqlBulkCopy(conn);
            bulkCopy.DestinationTableName = data.TableName;
            bulkCopy.BatchSize = data.Rows.Count;
            try
            {
                conn.Open();
                if (data != null && data.Rows.Count != 0)
                    bulkCopy.WriteToServer(data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
                if (bulkCopy != null)
                    bulkCopy.Close();
            }
        }

        /// <summary> 
        /// 将SqlParameter参数数组(参数值)分配给SqlCommand命令. 
        /// 这个方法将给任何一个参数分配DBNull.Value; 
        /// 该操作将阻止默认值的使用. 
        /// </summary> 
        /// <param name="command">命令名</param> 
        /// <param name="commandParameters">SqlParameters数组</param> 
        private static void AttachParameters(SqlCommand command, SqlParameter[] commandParameters)
        {
            if (command == null) throw new ArgumentNullException("command");
            if (commandParameters != null)
            {
                foreach (SqlParameter param in commandParameters)
                {
                    if (param != null)
                    {
                        // 检查未分配值的输出参数,将其分配以DBNull.Value. 
                        if ((param.Direction == ParameterDirection.InputOutput || param.Direction == ParameterDirection.Input) && param.Value == null)
                        {
                            param.Value = DBNull.Value;
                        }
                        command.Parameters.Add(param);
                    }
                }
            }
        }

        /// <summary> 
        /// 预处理用户提供的命令,数据库连接/事务/命令类型/参数 
        /// </summary> 
        /// <param name="command">要处理的SqlCommand</param> 
        /// <param name="connection">数据库连接</param> 
        /// <param name="transaction">一个有效的事务或者是null值</param> 
        /// <param name="commandType">命令类型 (存储过程,命令文本, 其它.)</param> 
        /// <param name="commandText">存储过程名或都T-SQL命令文本</param> 
        /// <param name="commandParameters">和命令相关联的SqlParameter参数数组,如果没有参数为'null'</param> 
        /// <param name="mustCloseConnection"><c>true</c> 如果连接是打开的,则为true,其它情况下为false.</param> 
        private static void PrepareCommand(SqlCommand command, SqlConnection connection, SqlTransaction transaction, CommandType commandType, string commandText, SqlParameter[] commandParameters, out bool mustCloseConnection)
        {
            if (command == null) throw new ArgumentNullException("command");
            if (commandText == null || commandText.Length == 0) throw new ArgumentNullException("commandText");

            if (connection.State != ConnectionState.Open)
            {
                mustCloseConnection = true;
                connection.Open();
            }
            else
            {
                mustCloseConnection = false;
            }

            // 给命令分配一个数据库连接. 
            command.Connection = connection;

            // 设置命令文本(存储过程名或SQL语句) 
            command.CommandText = commandText;

            // 分配事务 
            if (transaction != null)
            {
                if (transaction.Connection == null) throw new ArgumentException("事务已经被回退或已经被提交，请提供一个开放事务。", "transaction");
                command.Transaction = transaction;
            }

            // 设置命令类型. 
            command.CommandType = commandType;

            // 分配命令参数 
            if (commandParameters != null)
            {
                AttachParameters(command, commandParameters);
            }
            return;
        }

        #endregion 私有构造函数和方法结束

        #region ExecuteNonQuery

        /// <summary> 
        /// 执行指定数据库连接对象的命令 
        /// </summary> 
        /// <param name="commandType">命令类型(存储过程,命令文本或其它.)</param> 
        /// <param name="commandText">存储过程名称或T-SQL语句</param> 
        /// <returns>返回影响的行数</returns> 
        public static int ExecuteNonQuery(string commandText, CommandType commandType = CommandType.Text, params SqlParameter[] commandParameters)
        {
            return ExecuteNonQuery(GetConnection(), commandType, commandText, commandParameters);
        }

        /// <summary> 
        /// 执行指定数据库连接对象的命令 
        /// </summary> 
        /// <param name="connection">一个有效的数据库连接对象</param> 
        /// <param name="commandType">命令类型(存储过程,命令文本或其它.)</param> 
        /// <param name="commandText">T存储过程名称或T-SQL语句</param> 
        /// <param name="commandParameters">SqlParamter参数数组</param> 
        /// <returns>返回影响的行数</returns>
        public static int ExecuteNonQuery(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connection == null) throw new ArgumentNullException("connection");

            // 创建SqlCommand命令,并进行预处理 
            SqlCommand cmd = new SqlCommand();
            bool mustCloseConnection = false;
            PrepareCommand(cmd, connection, null, commandType, commandText, commandParameters, out mustCloseConnection);

            // Finally, execute the command 
            int retval = cmd.ExecuteNonQuery();

            // 清除参数,以便再次使用. 
            cmd.Parameters.Clear();
            if (mustCloseConnection)
                connection.Close();
            return retval;
        }

        /// <summary> 
        /// 执行带事务的SqlCommand(指定参数). 
        /// </summary> 
        /// <param name="transaction">一个有效的数据库连接对象</param> 
        /// <param name="commandType">命令类型(存储过程,命令文本或其它.)</param> 
        /// <param name="commandText">存储过程名称或T-SQL语句</param> 
        /// <param name="commandParameters">SqlParamter参数数组</param> 
        /// <returns>返回影响的行数</returns> 
        public static int ExecuteNonQuery(SqlTransaction transaction, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (transaction == null) throw new ArgumentNullException("transaction");
            if (transaction != null && transaction.Connection == null) throw new ArgumentException("事务已经被回退或已经被提交，请提供一个开放事务。", "transaction");

            // 预处理 
            SqlCommand cmd = new SqlCommand();
            bool mustCloseConnection = false;
            PrepareCommand(cmd, transaction.Connection, transaction, commandType, commandText, commandParameters, out mustCloseConnection);

            // 执行 
            int retval = cmd.ExecuteNonQuery();

            // 清除参数集,以便再次使用. 
            cmd.Parameters.Clear();
            return retval;
        }

        #endregion ExecuteNonQuery方法结束

        #region ExecuteDataset

        /// <summary> 
        /// 执行指定数据库连接对象的命令,返回DataSet. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///  DataSet ds = ExecuteDataset(conn, CommandType.StoredProcedure, "GetOrders"); 
        /// </remarks> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名或T-SQL语句</param> 
        /// <param name="param">参数</param> 
        /// <returns>返回一个包含结果集的DataSet</returns>
        public static DataSet ExecuteDataset(string commandText, CommandType commandType = CommandType.Text, params SqlParameter[] param)
        {
            return ExecuteDataset(GetConnection(), commandType, commandText, param);
        }

        /// <summary> 
        /// 执行指定数据库连接对象的命令,指定存储过程参数,返回DataSet. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///  DataSet ds = ExecuteDataset(conn, CommandType.StoredProcedure, "GetOrders", new SqlParameter("@prodid", 24)); 
        /// </remarks> 
        /// <param name="connection">一个有效的数据库连接对象</param> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名或T-SQL语句</param> 
        /// <param name="commandParameters">SqlParamter参数数组</param> 
        /// <returns>返回一个包含结果集的DataSet</returns> 
        public static DataSet ExecuteDataset(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connection == null) throw new ArgumentNullException("connection");

            // 预处理 
            SqlCommand cmd = new SqlCommand();
            bool mustCloseConnection = false;
            PrepareCommand(cmd, connection, null, commandType, commandText, commandParameters, out mustCloseConnection);

            // 创建SqlDataAdapter和DataSet. 
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();

                // 填充DataSet. 
                da.Fill(ds);

                cmd.Parameters.Clear();

                if (mustCloseConnection)
                    connection.Close();

                return ds;
            }
        }

        /// <summary> 
        /// 执行指定事务的命令,指定参数,返回DataSet. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///  DataSet ds = ExecuteDataset(trans, CommandType.StoredProcedure, "GetOrders", new SqlParameter("@prodid", 24)); 
        /// </remarks> 
        /// <param name="transaction">事务</param> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名或T-SQL语句</param> 
        /// <param name="commandParameters">SqlParamter参数数组</param> 
        /// <returns>返回一个包含结果集的DataSet</returns> 
        public static DataSet ExecuteDataset(SqlTransaction transaction, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (transaction == null) throw new ArgumentNullException("transaction");
            if (transaction != null && transaction.Connection == null) throw new ArgumentException("事务已经被回退或已经被提交，请提供一个开放事务。", "transaction");

            // 预处理 
            SqlCommand cmd = new SqlCommand();
            bool mustCloseConnection = false;
            PrepareCommand(cmd, transaction.Connection, transaction, commandType, commandText, commandParameters, out mustCloseConnection);

            // 创建 DataAdapter & DataSet 
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds);
                cmd.Parameters.Clear();
                return ds;
            }
        }

        #endregion

        #region ExecuteScalar

        /// <summary> 
        /// 执行指定数据库连接对象的命令,返回结果集中的第一行第一列. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///  int orderCount = (int)ExecuteScalar(conn, CommandType.StoredProcedure, "GetOrderCount"); 
        /// </remarks> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名称或T-SQL语句</param> 
        /// <param name="param">参数</param> 
        /// <returns>返回结果集中的第一行第一列</returns> 
        public static object ExecuteScalar(string commandText, CommandType commandType = CommandType.Text, params SqlParameter[] param)
        {
            return ExecuteScalar(GetConnection(), commandType, commandText, param);
        }

        /// <summary> 
        /// 执行指定数据库连接对象的命令,返回结果集中的第一行第一列. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///  int orderCount = (int)ExecuteScalar(conn, CommandType.StoredProcedure, "GetOrderCount"); 
        /// </remarks> 
        /// <param name="connection">一个有效的数据库连接对象</param> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名称或T-SQL语句</param> 
        /// <returns>返回结果集中的第一行第一列</returns> 
        public static object ExecuteScalar(SqlConnection connection, CommandType commandType, string commandText)
        {
            // 执行参数为空的方法 
            return ExecuteScalar(connection, commandType, commandText, (SqlParameter[])null);
        }

        /// <summary> 
        /// 执行指定数据库连接对象的命令,指定参数,返回结果集中的第一行第一列. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///  int orderCount = (int)ExecuteScalar(conn, CommandType.StoredProcedure, "GetOrderCount", new SqlParameter("@prodid", 24)); 
        /// </remarks> 
        /// <param name="connection">一个有效的数据库连接对象</param> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名称或T-SQL语句</param> 
        /// <param name="commandParameters">分配给命令的SqlParamter参数数组</param> 
        /// <returns>返回结果集中的第一行第一列</returns> 
        public static object ExecuteScalar(SqlConnection connection, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (connection == null) throw new ArgumentNullException("connection");

            // 创建SqlCommand命令,并进行预处理 
            SqlCommand cmd = new SqlCommand();

            bool mustCloseConnection = false;
            PrepareCommand(cmd, connection, null, commandType, commandText, commandParameters, out mustCloseConnection);

            // 执行SqlCommand命令,并返回结果. 
            object retval = cmd.ExecuteScalar();

            // 清除参数,以便再次使用. 
            cmd.Parameters.Clear();

            if (mustCloseConnection)
                connection.Close();

            return retval;
        }

        /// <summary> 
        /// 执行指定数据库事务的命令,指定参数,返回结果集中的第一行第一列. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///  int orderCount = (int)ExecuteScalar(trans, CommandType.StoredProcedure, "GetOrderCount", new SqlParameter("@prodid", 24)); 
        /// </remarks> 
        /// <param name="transaction">一个有效的连接事务</param> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名称或T-SQL语句</param> 
        /// <param name="commandParameters">分配给命令的SqlParamter参数数组</param> 
        /// <returns>返回结果集中的第一行第一列</returns> 
        public static object ExecuteScalar(SqlTransaction transaction, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (transaction == null) throw new ArgumentNullException("transaction");
            if (transaction != null && transaction.Connection == null) throw new ArgumentException("事务已经被回退或已经被提交，请提供一个开放事务。", "transaction");

            // 创建SqlCommand命令,并进行预处理 
            SqlCommand cmd = new SqlCommand();
            bool mustCloseConnection = false;
            PrepareCommand(cmd, transaction.Connection, transaction, commandType, commandText, commandParameters, out mustCloseConnection);

            // 执行SqlCommand命令,并返回结果. 
            object retval = cmd.ExecuteScalar();

            // 清除参数,以便再次使用. 
            cmd.Parameters.Clear();
            return retval;
        }

        #endregion

        #region ExecuteReader 数据阅读器

        /// <summary> 
        /// 执行指定数据库连接对象的数据阅读器. 
        /// </summary> 
        /// <remarks> 
        /// 如果是SqlHelper打开连接,当连接关闭DataReader也将关闭. 
        /// 如果是调用都打开连接,DataReader由调用都管理. 
        /// </remarks> 
        /// <param name="connection">一个有效的数据库连接对象</param> 
        /// <param name="transaction">一个有效的事务,或者为 'null'</param> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名或T-SQL语句</param> 
        /// <param name="commandParameters">SqlParameters参数数组,如果没有参数则为'null'</param>
        /// <returns>返回包含结果集的SqlDataReader</returns>
        private static SqlDataReader ExecuteReader(SqlConnection connection, SqlTransaction transaction, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            if (connection == null) throw new ArgumentNullException("connection");

            bool mustCloseConnection = false;
            // 创建命令 
            SqlCommand cmd = new SqlCommand();
            try
            {
                PrepareCommand(cmd, connection, transaction, commandType, commandText, commandParameters, out mustCloseConnection);

                // 创建数据阅读器 
                SqlDataReader dataReader;

                dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                // 清除参数,以便再次使用.. 
                // HACK: There is a problem here, the output parameter values are fletched 
                // when the reader is closed, so if the parameters are detached from the command 
                // then the SqlReader can磘 set its values. 
                // When this happen, the parameters can磘 be used again in other command. 
                bool canClear = true;
                foreach (SqlParameter commandParameter in cmd.Parameters)
                {
                    if (commandParameter.Direction != ParameterDirection.Input)
                        canClear = false;
                }

                if (canClear)
                {
                    cmd.Parameters.Clear();
                }

                return dataReader;
            }
            catch
            {
                if (mustCloseConnection)
                    connection.Close();
                throw;
            }
        }

        /// <summary> 
        /// [调用者方式]执行指定数据库连接对象的数据阅读器,指定参数. 
        /// </summary> 
        /// <param name="commandText">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandParameters">SqlParamter参数数组</param> 
        /// <returns>返回包含结果集的SqlDataReader</returns> 
        public static SqlDataReader ExecuteReader(string commandText, params SqlParameter[] commandParameters)
        {
            return ExecuteReader(GetConnection(), null, CommandType.Text, commandText, commandParameters);
        }

        /// <summary> 
        /// [调用者方式]执行指定数据库事务的数据阅读器,指定参数值. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///  SqlDataReader dr = ExecuteReader(trans, CommandType.StoredProcedure, "GetOrders"); 
        /// </remarks> 
        /// <param name="transaction">一个有效的连接事务</param> 
        /// <param name="commandText">存储过程名称或T-SQL语句</param> 
        /// <returns>返回包含结果集的SqlDataReader</returns> 
        public static SqlDataReader ExecuteReader(SqlTransaction transaction, string commandText)
        {
            return ExecuteReader(transaction, CommandType.Text, commandText, null);
        }

        /// <summary> 
        /// [调用者方式]执行指定数据库事务的数据阅读器,指定参数. 
        /// </summary> 
        /// <remarks> 
        /// 示例:  
        ///   SqlDataReader dr = ExecuteReader(trans, CommandType.StoredProcedure, "GetOrders", new SqlParameter("@prodid", 24)); 
        /// </remarks> 
        /// <param name="transaction">一个有效的连接事务</param> 
        /// <param name="commandType">命令类型 (存储过程,命令文本或其它)</param> 
        /// <param name="commandText">存储过程名称或T-SQL语句</param> 
        /// <param name="commandParameters">分配给命令的SqlParamter参数数组</param> 
        /// <returns>返回包含结果集的SqlDataReader</returns> 
        public static SqlDataReader ExecuteReader(SqlTransaction transaction, CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            if (transaction == null) throw new ArgumentNullException("transaction");
            if (transaction != null && transaction.Connection == null) throw new ArgumentException("The transaction was rollbacked or commited, please provide an open transaction.", "transaction");

            return ExecuteReader(transaction.Connection, transaction, commandType, commandText, commandParameters);
        }

        #endregion ExecuteReader数据阅读器
    }
}