using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace TrainTicketBooking.Controllers
{
    public class CartController : Controller
    {
        public IActionResult List()
        {
            return View();
        }
        public IActionResult AddToCart()
        {
            string[] ticket_id_raw_list = Request.Form["ticket_id"];
            List<int> ticket_id_list = new List<int>();
            foreach (string ticket_id_raw in ticket_id_raw_list)
            {
                ticket_id_list.Add(Convert.ToInt32(ticket_id_raw));
            }

            string[] ticket_type_raw_list = Request.Form["ticket_type"];
            List<int> ticket_type_list = new List<int>();
            foreach (string ticket_type_raw in ticket_type_raw_list)
            {
                ticket_type_list.Add(Convert.ToInt32(ticket_type_raw));
            }

            return View();
        }
    }
}
