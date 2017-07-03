using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Web_Project.Data
{
    public class GetUserBianHao
    {
        /// <summary>  
        /// 生成订单号
        /// </summary>  
        /// <returns></returns>  
        public static string GetUserBianHaoMethod(string nummm)
        {
            string num = "";
            for (int i = 0; i < 6 - nummm.ToString().Length; i++)
            {
                num += "0";
            }
            num = "SACLAM" + num + nummm;
            return num;
        }
    }
}
