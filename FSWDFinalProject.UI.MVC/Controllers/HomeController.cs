using System.Web.Mvc;
using FSWDFinalProject.UI.MVC.Models;
using System;
using System.Net;
using System.Net.Mail;

namespace FSWDFinalProject.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            string message = $"You have received an email from {cvm.Name} with a subject of '{cvm.Subject}'. Please respond to '{cvm.Email}' with your response to the following message: <br/> {cvm.Message}";

            MailMessage mm = new MailMessage("admin@tmuzzy.com", "tristanmuzzy@outlook.com", cvm.Subject, cvm.Message);

            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.High;
            mm.ReplyToList.Add(cvm.Email);

            SmtpClient client = new SmtpClient("mail.tmuzzy.com");
            client.Credentials = new NetworkCredential("admin@tmuzzy.com", "j@4E8EBNEjq@3@8");

            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"We're sorry your request could not be completed at this time. Please try again later. Error Message:<br/>{ex.StackTrace}";
                return View(cvm);
            }
            TempData["EmailConfirm"] = true;
            TempData["Name"] = cvm.Name;
            TempData["Email"] = cvm.Email;
            TempData["Subject"] = cvm.Subject;
            return RedirectToAction("Contact");
        }
    }
}
