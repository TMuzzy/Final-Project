﻿using System;
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
    public class ReservationsController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: Reservations
        public ActionResult Index()
        {
            var reservations = db.Reservations.Include(r => r.Location).Include(r => r.OwnerAsset).Include(r => r.Room);
            return View(reservations.ToList());
        }

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

        // GET: Reservations/Create
        public ActionResult Create()
        {
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName");
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName");
            ViewBag.RoomID = new SelectList(db.Rooms, "RoomID", "RoomName");
            return View();
        }

        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservationID,LocationID,ReservationDate,OwnerAssetID,RoomID")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Reservations.Add(reservation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            ViewBag.RoomID = new SelectList(db.Rooms, "RoomID", "RoomName", reservation.RoomID);
            return View(reservation);
        }

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

        // POST: Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReservationID,LocationID,ReservationDate,OwnerAssetID,RoomID")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LocationID = new SelectList(db.Locations, "LocationID", "LocationName", reservation.LocationID);
            ViewBag.OwnerAssetID = new SelectList(db.OwnerAssets, "OwnerAssetID", "AssetName", reservation.OwnerAssetID);
            ViewBag.RoomID = new SelectList(db.Rooms, "RoomID", "RoomName", reservation.RoomID);
            return View(reservation);
        }

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
