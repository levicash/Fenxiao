using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Web_Project.Data
{
   public class GenerateOid
    {
        /// <summary>  
        /// 生成订单号  
        /// </summary>  
        /// <returns></returns>  
        public static string GetGenerateOid()
        {
            string oid;
            //订单号  
            StringBuilder sbNumber = new StringBuilder();
            sbNumber.Append(DateTime.Now.Year.ToString());//4  
            sbNumber.Append(DateTime.Now.Month.ToString().Length == 1 ? "0" + DateTime.Now.Month.ToString() : DateTime.Now.Month.ToString());//2  
            sbNumber.Append(DateTime.Now.Day.ToString().Length == 1 ? "0" + DateTime.Now.Day.ToString() : DateTime.Now.Day.ToString());//2  
            sbNumber.Append(DateTime.Now.Hour.ToString().Length == 1 ? "0" + DateTime.Now.Hour.ToString() : DateTime.Now.Hour.ToString());//2  
            sbNumber.Append(DateTime.Now.Minute.ToString().Length == 1 ? "0" + DateTime.Now.Minute.ToString() : DateTime.Now.Minute.ToString());//2  
            sbNumber.Append(DateTime.Now.Second.ToString().Length == 1 ? "0" + DateTime.Now.Second.ToString() : DateTime.Now.Second.ToString());//2  
            if (DateTime.Now.Millisecond.ToString().Length == 1)//3  
            {
                sbNumber.Append("00" + DateTime.Now.Millisecond.ToString());
            }
            else if (DateTime.Now.Millisecond.ToString().Length == 2)
            {
                sbNumber.Append("0" + DateTime.Now.Millisecond.ToString());
            }
            else
            {
                sbNumber.Append(DateTime.Now.Millisecond.ToString());
            }
            //检查订单号是否在数据库中存在  
            while (ReturnOidCount(sbNumber.ToString()))//方法返回True，证明在数据库中存在。则重新排序  
            {
                //若存在，重新对这个订单号排序  
                ArrayList repeatArr = new ArrayList();
                for (int i = 0; i < sbNumber.ToString().Length; i++)
                {
                    repeatArr.Add(sbNumber.ToString().Substring(i, 1));
                }
                //清空StringBuilder  
                sbNumber.Remove(0, sbNumber.Length);
                Random re = new Random();
                //对17位订单号随机排序  
                for (int i = 0; i < repeatArr.Count; i++)
                {
                    int ex = re.Next(1, 17);
                    sbNumber.Append(repeatArr[ex].ToString());
                }
            }
            //返回不重复的字串  
            oid = sbNumber.ToString();
            return oid;
        }
        protected static bool ReturnOidCount(string sbNumber)
        {
            string sql = "select count(*) from ws_OrderList where OrderId='" + sbNumber + "'";
            int count = Convert.ToInt32(DBHelpers.ExecuteScalar(DBHelpers.conn, CommandType.Text, sql, null));
            if(count>0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
