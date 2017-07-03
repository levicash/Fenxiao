using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Web_Project.Data
{
    public class ClearHtml
    {
        #region 清除html代码
        /// <summary>
        /// 清除html代码
        /// </summary>
        /// <param name="strHtml"></param>
        /// <returns>是否要清除空格</returns>
        public static string clearHtml(string strHtml, bool clearSpace)
        {
            if (strHtml != "")
            {
                Regex r = null;
                Match m = null;
                r = new Regex(@"<\/?[^>]*>", RegexOptions.IgnoreCase);
                for (m = r.Match(strHtml); m.Success; m = m.NextMatch())
                {
                    strHtml = strHtml.Replace(m.Groups[0].ToString().Trim(), "");
                }//exit for
            }//end if
            if (clearSpace)
            {
                strHtml = Regex.Replace(strHtml, "\\s", "");
                strHtml = strHtml.Replace("&nbsp;", "");
            }
            return strHtml;
        }
        public static string clearHtml1(string strHtml)
        {
            return clearHtml(strHtml, false);
        }
        #endregion
    }
}
