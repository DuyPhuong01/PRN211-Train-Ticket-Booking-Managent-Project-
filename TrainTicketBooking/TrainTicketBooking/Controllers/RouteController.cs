using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using TrainTicketBooking.Models;

namespace TrainTicketBooking.Controllers
{
    public class RouteController : Controller
    {
        public IActionResult List()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            List<Route> routes = context.Routes.Include(r => r.FromNavigation).Include(r => r.ToNavigation).ToList();

            return View(routes);
        }
    }
}
