using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSWDFinalProject.DATA.EF;

namespace FSWDFinalProject.UI.MVC.Controllers
{
    public class ReservedStatusController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: ReservedStatus
        public ActionResult Index()
        {
            return View(db.ReservedStatus.ToList());
        }

        // GET: ReservedStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservedStatu reservedStatu = db.ReservedStatus.Find(id);
            if (reservedStatu == null)
            {
                return HttpNotFound();
            }
            return View(reservedStatu);
        }

        // GET: ReservedStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ReservedStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservedStatusID,StatusName,Description")] ReservedStatu reservedStatu)
        {
            if (ModelState.IsValid)
            {
                db.ReservedStatus.Add(reservedStatu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(reservedStatu);
        }

        // GET: ReservedStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservedStatu reservedStatu = db.ReservedStatus.Find(id);
            if (reservedStatu == null)
            {
                return HttpNotFound();
            }
            return View(reservedStatu);
        }

        // POST: ReservedStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReservedStatusID,StatusName,Description")] ReservedStatu reservedStatu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservedStatu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(reservedStatu);
        }

        // GET: ReservedStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReservedStatu reservedStatu = db.ReservedStatus.Find(id);
            if (reservedStatu == null)
            {
                return HttpNotFound();
            }
            return View(reservedStatu);
        }

        // POST: ReservedStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ReservedStatu reservedStatu = db.ReservedStatus.Find(id);
            db.ReservedStatus.Remove(reservedStatu);
            db.SaveChanges();
            return RedirectToAction("Index");
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
