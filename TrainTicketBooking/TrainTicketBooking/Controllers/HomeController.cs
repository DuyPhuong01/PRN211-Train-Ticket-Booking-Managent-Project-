using Microsoft.AspNetCore.Mvc;

namespace TrainTicketBooking.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
