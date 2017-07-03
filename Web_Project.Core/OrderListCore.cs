using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web_Project.Core
{
    public class OrderListCore
    {
        public int Id { set; get; }
        public string Rname { set; get; }
        public string OrderId { set; get; }
        public int Znum { set; get; }
        public decimal Zjiage { set; get; }
        public int IsFaHuo { set; get; }
        public string KdDanhao { set; get; }
        public string KdGongsi { set; get; }
        public DateTime FaTime { set; get; }
        public DateTime AddTime { set; get; }
    }
}
