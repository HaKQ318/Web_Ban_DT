using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BTL_ShopDienThoai.Models;
using PagedList;

namespace BTL_ShopDienThoai.Areas.Admin.Controllers
{
    public class DienThoaisController : Controller
    {
        private ShopDT db = new ShopDT();

        // GET: Admin/DienThoais
        public ActionResult Index(string sortOrder, string searchString,
            string currentFilter,int? page)
        {
            //Các biến sắp xếp
            ViewBag.CurrentSort = sortOrder;//Biến lấy yêu càua sắp xếp hiện tại
            ViewBag.SapTheoTen = String.IsNullOrEmpty(sortOrder) ? "ten_desc" : "";
            ViewBag.SapTheoGia = sortOrder == "gia" ? "gia_desc" : "gia";
            //Lấy giá trị của bộ lọc dữ liệu hiện tại
            if (searchString != null)
            {
                page = 1; //Trang dau tien
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.CurrentFilter = searchString;

            //Lấy danh sách sản phẩm
            var dienThoais = db.DienThoais.Include(d => d.Hang);

            //Lọc theo tên hàng
            if (!String.IsNullOrEmpty(searchString))
            {
                dienThoais = dienThoais.Where(p => p.TenDT.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "ten_desc":
                    dienThoais = dienThoais.OrderByDescending(s => s.TenDT);
                    break;
                case "gia":
                    dienThoais = dienThoais.OrderBy(s => s.Gia);
                    break;
                case "gia_desc":
                    dienThoais = dienThoais.OrderByDescending(s => s.Gia);
                    break;
                default:
                    dienThoais = dienThoais.OrderBy(s => s.TenDT);
                    break;
            }
            int pageSize = 4; //Kich thuoc trang
            int pageNumber = (page ?? 1);//Neu page bang null thi tra ve 1

            return View(dienThoais.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/DienThoais/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DienThoai dienThoai = db.DienThoais.Find(id);
            if (dienThoai == null)
            {
                return HttpNotFound();
            }
            return View(dienThoai);
        }

        // GET: Admin/DienThoais/Create
        public ActionResult Create()
        {
            ViewBag.MaHang = new SelectList(db.Hangs, "MaHang", "TenHang");
            return View();
        }

        // POST: Admin/DienThoais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        /*[ValidateInput(false)]*/
        public ActionResult Create([Bind(Include = "MaDT,TenDT,ThuongHieu,Anh,Gia,SoLuong,Mota,MaHang")] DienThoai dienThoai)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dienThoai.Anh = "";
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        //Lấy tên file upload
                        string UploadPath = Server.MapPath("~/wwwroot/ANHDIENTHOAI/" + FileName);
                        //copy và lưa file vào sever
                        f.SaveAs(UploadPath);
                        //Lưu tên file vào trường Image
                        dienThoai.Anh = FileName;
                    }
                }
                db.DienThoais.Add(dienThoai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = "Lỗi nhập dữ liệu:" + ex.Message;
                ViewBag.MaHang = new SelectList(db.Hangs, "MaHang", "TenHang", dienThoai.MaHang);
                return View(dienThoai);
            }
        }
        // GET: Admin/DienThoais/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DienThoai dienThoai = db.DienThoais.Find(id);
            if (dienThoai == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaHang = new SelectList(db.Hangs, "MaHang", "TenHang", dienThoai.MaHang);
            return View(dienThoai);
        }

        // POST: Admin/DienThoais/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDT,TenDT,ThuongHieu,Anh,Gia,SoLuong,Mota,MaHang")] DienThoai dienThoai)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    /*dienThoai.Anh = "";*/
                    var f = Request.Files["ImageFile"];
                    if (f != null && f.ContentLength > 0)
                    {
                        string FileName = System.IO.Path.GetFileName(f.FileName);
                        //Lấy tên file upload
                        string UploadPath = Server.MapPath("~/wwwroot/ANHDIENTHOAI/" + FileName);
                        //copy và lưa file vào sever
                        f.SaveAs(UploadPath);
                        //Lưu tên file vào trường Image
                        dienThoai.Anh = FileName;
                    }
                }
                db.Entry(dienThoai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");

            }
            catch (Exception ex)
            {
                ViewBag.Error = "Lỗi :" + ex.Message;
                ViewBag.MaHang = new SelectList(db.Hangs, "MaHang", "TenHang", dienThoai.MaHang);
                return View(dienThoai);
            }
        }

        // GET: Admin/DienThoais/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DienThoai dienThoai = db.DienThoais.Find(id);
            if (dienThoai == null)
            {
                return HttpNotFound();
            }
            return View(dienThoai);
        }

        // POST: Admin/DienThoais/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        { 
            DienThoai dienThoai = db.DienThoais.Find(id);
            try
            {
                db.DienThoais.Remove(dienThoai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                ViewBag.Error = "Không được xóa sản phẩm này!" + ex.Message;
                return View("Delete",dienThoai);
            }
           
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
