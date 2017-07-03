using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.Web.UI;
using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;

namespace Web_Project.Data
{
    public class GetQrCode
    {
        //生成二维码方法一
        public static string CreateCode_Simple(string nr)
        {
            QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
            qrCodeEncoder.QRCodeScale = 4;
            qrCodeEncoder.QRCodeVersion = 8;
            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
            System.Drawing.Image image = qrCodeEncoder.Encode(nr);
            string filename = DateTime.Now.ToString("yyyymmddhhmmssfff").ToString() + ".jpg";
            string filepath = System.Web.HttpContext.Current.Server.MapPath(@"~\Upload") + "\\" + filename;
            System.IO.FileStream fs = new System.IO.FileStream(filepath, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
            image.Save(fs, System.Drawing.Imaging.ImageFormat.Jpeg);

            fs.Close();
            image.Dispose();

            return filename;
            //二维码解码
            //var codeDecoder = CodeDecoder(filepath);
        }

        ///// <summary>
        ///// 生成二维码
        ///// </summary>
        ///// <param name="strData">要生成的文字或者数字，支持中文。如： "4408810820 深圳－广州" 或者：4444444444</param>
        ///// <param name="qrEncoding">三种尺寸：BYTE ，ALPHA_NUMERIC，NUMERIC</param>
        ///// <param name="level">大小：L M Q H</param>
        ///// <param name="version">版本：如 8</param>
        ///// <param name="scale">比例：如 4</param>
        ///// <returns></returns>
        //public ActionResult CreateCode_Choose(string strData, string qrEncoding, string level, int version, int scale)
        //{
        //    QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
        //    string encoding = qrEncoding;
        //    switch (encoding)
        //    {
        //        case "Byte":
        //            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
        //            break;
        //        case "AlphaNumeric":
        //            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.ALPHA_NUMERIC;
        //            break;
        //        case "Numeric":
        //            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.NUMERIC;
        //            break;
        //        default:
        //            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
        //            break;
        //    }

        //    qrCodeEncoder.QRCodeScale = scale;
        //    qrCodeEncoder.QRCodeVersion = version;
        //    switch (level)
        //    {
        //        case "L":
        //            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.L;
        //            break;
        //        case "M":
        //            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
        //            break;
        //        case "Q":
        //            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.Q;
        //            break;
        //        default:
        //            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.H;
        //            break;
        //    }
        //    //文字生成图片
        //    Image image = qrCodeEncoder.Encode(strData);
        //    string filename = DateTime.Now.ToString("yyyymmddhhmmssfff").ToString() + ".jpg";
        //    string filepath = Server.MapPath(@"~\Upload") + "\\" + filename;
        //    //如果文件夹不存在，则创建
        //    //if (!Directory.Exists(filepath))
        //    //    Directory.CreateDirectory(filepath);
        //    System.IO.FileStream fs = new System.IO.FileStream(filepath, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write);
        //    image.Save(fs, System.Drawing.Imaging.ImageFormat.Jpeg);
        //    fs.Close();
        //    image.Dispose();
        //    return Content(@"/Upload/" + filename);
        //}

        /// <summary>
        /// 二维码解码
        /// </summary>
        /// <param name="filePath">图片路径</param>
        /// <returns></returns>
        public static string CodeDecoder(string filePath)
        {
            if (!System.IO.File.Exists(filePath))
                return null;
            Bitmap myBitmap = new Bitmap(Image.FromFile(filePath));
            QRCodeDecoder decoder = new QRCodeDecoder();
            string decodedString = decoder.decode(new QRCodeBitmapImage(myBitmap));
            return decodedString;
        }
    }
}
