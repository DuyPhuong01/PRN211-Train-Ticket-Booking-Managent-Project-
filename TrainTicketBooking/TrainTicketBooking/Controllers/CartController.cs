using Microsoft.AspNetCore.Mvc;

namespace TrainTicketBooking.Controllers
{
    public class CartController : Controller
    {
        public IActionResult List()
        {
            return View();
        }
    }
}
