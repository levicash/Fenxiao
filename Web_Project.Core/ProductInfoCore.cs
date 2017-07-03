using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web_Project.Core
{
    public class ProductInfoCore
    {
        public int Id { set; get; }
        public string Title { set; get; }
        public string ImgName { set; get; }
        public decimal YPrice { set; get; }
        public decimal XPrice { set; get; }
        public int Type { set; get; }
        public int Orders { set; get; }
    }
}
