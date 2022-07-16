using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using TrainTicketBooking.Models;

namespace TrainTicketBooking.Controllers
{
    public class RouteController : Controller
    {
        public IActionResult List(int pagenumber = 1)
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            int items_per_page = 10;

            List<Route> routes = context.Routes
                .Include(r => r.FromNavigation).Include(r => r.ToNavigation)
                .Skip((pagenumber - 1) * items_per_page).Take(items_per_page)
                .ToList();
            int count = context.Routes.ToList().Count();
            int number_of_page = (count % items_per_page == 0) ? (count / items_per_page) : (count / items_per_page + 1);

            ViewBag.PageNumber = pagenumber;
            ViewBag.NumberOfPage = number_of_page;

            return View(routes);
        }
    }
}
