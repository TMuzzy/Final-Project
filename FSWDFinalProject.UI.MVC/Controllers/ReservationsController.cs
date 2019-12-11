using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSWDFinalProject.DATA.EF;
using Microsoft.AspNet.Identity;

namespace FSWDFinalProject.UI.MVC.Controllers
{
    public class ReservationsController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        [Authorize(Roles = "User, Admin, Employee, SuperAdmin")]
        // GET: Reservations
        public ActionResult Index()
        {
            var reservations = db.Reservations.Include(r => r.Location).Include(r => r.OwnerAsset).Include(r => r.Room);

            if (User.IsInRole("User"))
            {
                string userid = User.Identity.GetUserId();
                reservations = db.Reservations.Where(x => x.OwnerAsset.OwnerID == userid);
            }
            
            return View(reservations.ToList());
        }

        [Authorize(Roles = "User, Admin, SuperAdmin")]
        // GET: Reservations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        [Authorize(Roles = "User")]
        // GET: Reservations/Create
        public ActionResult Create()
        {
            string UserId = User.Identity.GetUserId();
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName");
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets.Where(o => o.OwnerID == UserId), "OwnerAssetID", "AssetName");
            ViewBag.RoomID = new SelectList(db.Rooms, "RoomID", "RoomName");
            return View();
        }

        [Authorize(Roles = "User")]
        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservationID,LocationID,ReservationDate,OwnerAssetID,RoomID")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {

                ViewBag.Error = 0;
                var resDate = reservation.ReservationDate;
                var resRoom = reservation.RoomID;

                FinalProjectEntities ctx = new FinalProjectEntities();
                var checkDate = (from r in ctx.Reservations
                               where r.ReservationDate == resDate
                               select r).Count();

                var checkRoom = (from r in ctx.Reservations
                                where r.RoomID == resRoom
                                select r).Count();

                if (checkDate >= 1 && checkRoom >= 1)
                {
                    ViewBag.ErrorMessage = "The room you selected is already reserved for that date. Either pick a new room, or pick a new date.";
                    ViewBag.Error = 1;
                }
                else
                {
                    db.Reservations.Add(reservation);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }

            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            ViewBag.RoomID = new SelectList(db.Rooms, "RoomID", "RoomName", reservation.RoomID);
            return View(reservation);
        }

        [Authorize(Roles = "User")]
        // GET: Reservations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            ViewBag.RoomID = new SelectList(db.Rooms, "RoomID", "RoomName", reservation.RoomID);
            return View(reservation);
        }

        [Authorize(Roles = "User")]
        // POST: Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReservationID,LocationID,ReservationDate,OwnerAssetID,RoomID")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                ViewBag.Error = 0;

                FinalProjectEntities ctx = new FinalProjectEntities();

                var checkResID = (from r in ctx.Reservations
                                  where r.ReservationID != reservation.ReservationID && r.LocationID == reservation.LocationID && r.RoomID == reservation.RoomID && r.ReservationDate == reservation.ReservationDate
                                  select r).Count();

                if (checkResID == 1)
                {
                    ViewBag.ErrorMessage = "The room you selected is already reserved for that date. Either pick a new room, or pick a new date.";
                    ViewBag.Error = 1;
                }
                else
                {
                    db.Entry(reservation).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            ViewBag.RoomID = new SelectList(db.Rooms, "RoomID", "RoomName", reservation.RoomID);
            return View(reservation);
        }

        [Authorize(Roles = "User")]
        // GET: Reservations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        [Authorize(Roles = "User")]
        // POST: Reservations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservation reservation = db.Reservations.Find(id);
            db.Reservations.Remove(reservation);
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
