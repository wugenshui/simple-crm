using Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace DAL
{
    public class BaseDAL<T> where T : class
    {
        /// <summary>  
        /// 获取线程内唯一的dbContext对象  
        /// </summary>  
        /// <returns></returns>  
        public DbContext GetDbContext()
        {
            // 首先先线程上下文中查看是否有已存在的DBContext  
            // 如果有那么直接返回这个，如果没有就新建   
            DbContext db = CallContext.GetData("DBContext") as CRMEntities;
            if (db == null)
            {
                db = new CRMEntities();
                CallContext.SetData("DBContext", db);
            }

            return db;
        }

        /// <summary>
        /// 获取实体
        /// </summary>
        /// <returns></returns>
        public IQueryable<T> Get()
        {
            DbContext db = GetDbContext();

            return db.Set<T>();
        }

        /// <summary>
        /// 添加实体
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public T Add(T model)
        {
            DbContext db = GetDbContext();
            T newModel = db.Set<T>().Add(model);
            db.SaveChanges();

            return newModel;
        }

        /// <summary>
        /// 修改实体
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public T Update(T model)
        {
            DbContext db = GetDbContext();
            model = db.Set<T>().Attach(model);
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();

            return model;
        }

        /// <summary>
        /// 删除实体
        /// </summary>
        /// <param name="model">实体</param>
        /// <returns></returns>
        public int Delete(T model)
        {
            DbContext db = GetDbContext();
            db.Entry(model).State = EntityState.Deleted;

            return db.SaveChanges();
        }

        /// <summary>
        /// 是否存在
        /// </summary>
        /// <param name="filter">查询条件</param>
        /// <returns></returns>
        public bool IsExist(Expression<Func<T, bool>> filter)
        {
            DbContext db = GetDbContext();
            int result = db.Set<T>().Where(filter).Count();

            return result > 0;
        }
    }
}
