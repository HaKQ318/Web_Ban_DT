using BTL_ShopDienThoai.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace BTL_ShopDienThoai.Controllers
{
    public class HomeController : Controller
    {
        ShopDT db = new ShopDT();
        public ActionResult Index(string id)
        {
            //Lấy ra 10 sản phẩm theo chiều giảm dần của số lượng
            /*var dienthoais = db.DienThoais.OrderByDescending(n => n.SoLuong).Select(n => n).Take(10);
            return View(dienthoais);*/

            List<DienThoai> dienthoais = new List<DienThoai>();
            if (id == null)
            {
                dienthoais = db.DienThoais.Select(ma => ma).ToList();
            }
            else
            {
                dienthoais = db.DienThoais.Where(ma => ma.MaHang.Equals(id)).Select(ma => ma).ToList();
            }
            return View(dienthoais);
        }
       
        public ActionResult Login()
        {
            return View();
        }
        
        public ActionResult Chitiet(string MaDT)
        {
            if (MaDT == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DienThoai dienThoai = db.DienThoais.Find(MaDT);
            if (dienThoai == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDT = new SelectList(db.DienThoais, "MaDT", "TenDT", dienThoai.MaDT);
            return View(dienThoai);
            
        }
        public PartialViewResult _Nav(string id)
        {
            /*List<Hang> hangs = new List<Hang>();
            if (id == null)
            {
                //Lấy toàn bộ các  hãng
                hangs = db.Hangs.Select(h => h).ToList();
            }
            else
            {
                //Lấy hàng theo mã hãng được chọn
                hangs = db.Hangs.Where(h => h.MaHang.Equals(id)).Select(h => h).ToList();
            }*/
            var hangs = db.Hangs.Select(n => n);
            return PartialView(hangs);
        }
        public PartialViewResult _Aside()
        {
            //lấy ra 5 sản phẩm theo chiều giảm dần của số lượng
            var dienthoais = db.DienThoais.OrderByDescending(n => n.SoLuong).Select(n => n).Take(5);
            return PartialView(dienthoais);
        }

      
    }
}