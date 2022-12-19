using FunActivityApp.EDMX;
using FunActivityApp.viewModels;
using System.Web.Mvc;

namespace FunActivityApp.Controllers
{
    public class HomeController : Controller
    {
        public Entities dbContext = new Entities();

        public ActionResult Index()
        {
            var vM = new UserVM();
            //return View(vM);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}