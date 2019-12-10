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
    public class OwnerAssetsController : Controller
    {
        private FinalProjectEntities db = new FinalProjectEntities();

        // GET: OwnerAssets
        public ActionResult Index()
        {
            var ownerAssets = db.OwnerAssets.Include(o => o.ReservedStatu).Include(o => o.UserDetail);
            return View(ownerAssets.ToList());
        }

        [Authorize(Roles = "User")]
        // GET: OwnerAssets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAsset ownerAsset = db.OwnerAssets.Find(id);
            if (ownerAsset == null)
            {
                return HttpNotFound();
            }
            return View(ownerAsset);
        }

        // GET: OwnerAssets/Create
        public ActionResult Create()
        {
            ViewBag.ReservedStatusID = new SelectList(db.ReservedStatus, "ReservedStatusID", "StatusName");
            ViewBag.OwnerID = new SelectList(db.UserDetails, "UserID", "FirstName");
            return View();
        }

        // POST: OwnerAssets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OwnerAssetID,AssetName,OwnerID,AssetPhoto,Description,ReservedStatusID")] OwnerAsset ownerAsset, HttpPostedFileBase assetPhoto)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string imageName = "noImage.png";

                if (assetPhoto != null)
                {
                    imageName = assetPhoto.FileName;
                    string ext = imageName.Substring(imageName.LastIndexOf("."));
                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;
                        assetPhoto.SaveAs(Server.MapPath("~/Content/images/uploads/" + imageName));
                    }
                    else
                    {
                        imageName = "noImage.png";
                    }
                }
                ownerAsset.AssetPhoto = imageName;
                #endregion

                db.OwnerAssets.Add(ownerAsset);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ReservedStatusID = new SelectList(db.ReservedStatus, "ReservedStatusID", "StatusName", ownerAsset.ReservedStatusID);
            ViewBag.OwnerID = new SelectList(db.UserDetails, "UserID", "FirstName", ownerAsset.OwnerID);
            return View(ownerAsset);
        }

        // GET: OwnerAssets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAsset ownerAsset = db.OwnerAssets.Find(id);
            if (ownerAsset == null)
            {
                return HttpNotFound();
            }
            ViewBag.ReservedStatusID = new SelectList(db.ReservedStatus, "ReservedStatusID", "StatusName", ownerAsset.ReservedStatusID);
            ViewBag.OwnerID = new SelectList(db.UserDetails, "UserID", "FirstName", ownerAsset.OwnerID);
            return View(ownerAsset);
        }

        // POST: OwnerAssets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OwnerAssetID,AssetName,OwnerID,AssetPhoto,Description,ReservedStatusID")] OwnerAsset ownerAsset, HttpPostedFileBase assetPhoto)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                if (assetPhoto != null)
                {
                    string imageName = assetPhoto.FileName;
                    string ext = imageName.Substring(imageName.LastIndexOf("."));
                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;
                        assetPhoto.SaveAs(Server.MapPath("~/Content/images/uploads/" + imageName));
                        string currentFile = Request.Params["AssetPhoto"];
                        if (currentFile != "noImage.png" && currentFile != null)
                        {
                            //System.IO.File.Delete(Server.MapPath("~/Content/images/uploads/" + currentFile));
                        }
                    }
                    ownerAsset.AssetPhoto = imageName;
                }
                #endregion
                db.Entry(ownerAsset).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ReservedStatusID = new SelectList(db.ReservedStatus, "ReservedStatusID", "StatusName", ownerAsset.ReservedStatusID);
            ViewBag.OwnerID = new SelectList(db.UserDetails, "UserID", "FirstName", ownerAsset.OwnerID);
            return View(ownerAsset);
        }

        // GET: OwnerAssets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAsset ownerAsset = db.OwnerAssets.Find(id);
            if (ownerAsset == null)
            {
                return HttpNotFound();
            }
            return View(ownerAsset);
        }

        // POST: OwnerAssets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OwnerAsset ownerAsset = db.OwnerAssets.Find(id);
            db.OwnerAssets.Remove(ownerAsset);
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
