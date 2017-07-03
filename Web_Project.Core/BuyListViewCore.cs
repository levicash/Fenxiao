using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web_Project.Core
{
    public class BuyListViewCore
    {
        public int Id { set; get; }
        public string Rname { set; get; }
        public int Num { set; get; }
        public string Title { set; get; }
        public string ImgName { set; get; }
        public decimal DanJia { set; get; }
        public decimal Price1 { set; get; }
        public decimal Price2 { set; get; }
        public decimal Price3 { set; get; }
        public decimal Price4 { set; get; }
        public decimal Price5 { set; get; }
        public decimal Price6 { set; get; }
        public int IsOrder { set; get; }
        public int Pid { set; get; }
    }
}
