using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using TrainTicketBooking.Models;

namespace TrainTicketBooking.Controllers
{
    public class TripController : Controller
    {
        public JsonResult List(int routeid, int pagenumber = 1)
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            int items_per_page = 10;

            List<Trip> trips = context.Trips
                .Where(r => r.RouteId == routeid)
                .Skip((pagenumber - 1) * items_per_page).Take(items_per_page)
                .ToList();
            int count = context.Trips.Where(r => r.RouteId == routeid).ToList().Count();
            int number_of_page = count % items_per_page == 0 ? count / items_per_page : count / items_per_page + 1;

            return Json(new { trips = trips, number_of_page = number_of_page, pagenumber = pagenumber});
        }
        public IActionResult Details(int tripid)
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();

            Trip trip = context.Trips
                .Include(t => t.Train)

                .FirstOrDefault(t => t.TripId == tripid);
            return View(trip);
        }
    }
}
