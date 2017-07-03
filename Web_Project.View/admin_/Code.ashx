<%@ WebHandler Language="C#" Class="Code" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
public class Code : IHttpHandler,IRequiresSessionState {

    private void DrawNoise(Graphics grap)
    {
        Random rand = new Random();
        int count = rand.Next(5)+3;
        for (int i = 0; i < count; i++)
        {
            int width = rand.Next(4) + 1;
            int startX = rand.Next(80);
            int startY = rand.Next(20);
            int endX = rand.Next(80);
            int endY = rand.Next(20);
            int alpha = rand.Next(150)+55; 
            int red = rand.Next(255);
            int green = rand.Next(255);
            int blue = rand.Next(255);
            Color color = Color.FromArgb(alpha, red, green, blue);
            Pen pen = new Pen(color,width); 
            grap.DrawLine(pen,startX,startY,endX,endY);  
        }  
    }


    private void DrawString(Graphics grap)
    {
        //string str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        string str = "02345689";
        Random rand = new Random(); //初始化随机数
        string ss = ""; 
        for (int i = 0; i < 4; i++)
        {
            int start = rand.Next(str.Length);
            string code = str.Substring(start, 1);
            ss += code; 
            Bitmap one = GetOneImage(code,rand.Next(90));
            grap.DrawImage(one, 0 + (i * 20), 0);
        }
       
        //HttpContext.Current.Session["code"] = ss;
        HttpContext.Current.Response.Cookies.Add(new HttpCookie("CheckCode", ss.ToLower()));
    }
    //画单一数字图片
    private Bitmap GetOneImage(string code,int angle)
    {
        Bitmap small = new Bitmap(20, 20);
        Graphics g = Graphics.FromImage(small);
        SolidBrush brush = new SolidBrush(Color.White);
        g.FillRectangle(brush, 0, 0, 20, 20);
        Font font = new Font("Arial Black", 12);
        brush.Color = Color.Red;

        
        Matrix mat = new Matrix();
        mat.RotateAt(angle-45,new PointF(10,10));
        g.Transform = mat;
        g.DrawString(code, font, brush, 0, 0);
        return small; 
    }
    public void ProcessRequest (HttpContext context) {
        Bitmap img = new Bitmap(80,20);
        Graphics grap = Graphics.FromImage(img); //取图片的画版

        DrawString(grap); //向图片画字
        //DrawNoise(grap);//画干拢线

        context.Response.ContentType = "image/jpeg";
        img.Save(context.Response.OutputStream,ImageFormat.Jpeg); 
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}