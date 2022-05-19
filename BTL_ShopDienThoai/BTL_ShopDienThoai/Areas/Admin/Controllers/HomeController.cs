using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_ShopDienThoai.Models;

namespace BTL_ShopDienThoai.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private ShopDT db = new ShopDT();

        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["idUser"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
            
        }
        public ActionResult Table()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string TenDN, string MatKhau)
        {
            if (ModelState.IsValid)
            {
                var user = db.TaiKhoans.Where(u => u.TenDN.Equals(TenDN) &&
                    u.MatKhau.Equals(MatKhau)).ToList();
                if (user.Count() > 0)
                {
                    Session["Hoten"] = user.FirstOrDefault().HoTen;
                    Session["Email"] = user.FirstOrDefault().TenDN;
                    Session["idUser"] = user.FirstOrDefault().MaTK;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Đăng nhập không thành công!";
                }
            }
            
            return View();
        }
        public ActionResult DangXuat()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}