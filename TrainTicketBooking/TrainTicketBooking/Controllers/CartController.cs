using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using TrainTicketBooking.Models;

namespace TrainTicketBooking.Controllers
{
    public class CartController : Controller
    {
        public IActionResult List()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            string account_session = HttpContext.Session.GetString("account");
            User account = JsonConvert.DeserializeObject<User>(account_session);
            Order cart = context.Orders.FirstOrDefault(o => o.UserId == account.UserId && o.Status == 1);
            List<OrderedTicket> cart_details = new List<OrderedTicket>();
            if (cart != null)
            {
                cart_details = context.OrderedTickets
                    .Include(ot => ot.Ticket)
                    .Include(ot => ot.Ticket.TicketPrice)
                    .Include(ot => ot.Ticket.TicketPrice.Trip)
                    .Include(ot => ot.Ticket.TicketPrice.Trip.Route)
                    .Include(ot => ot.Ticket.TicketPrice.Trip.Route.ToNavigation)
                    .Include(ot => ot.Ticket.TicketPrice.Trip.Route.FromNavigation)
                    .Include(ot => ot.Ticket.Carriage)
                    .Include(ot => ot.Ticket.Carriage.Train)
                    .Where(ot => ot.OrderId == cart.OrderId)
                    .ToList();
            }

            return View(cart_details);
        }
        public RedirectResult AddToCart()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            string account_session = HttpContext.Session.GetString("account");
            User account = JsonConvert.DeserializeObject<User>(account_session);
            Order cart = context.Orders.FirstOrDefault(o => o.UserId == account.UserId && o.Status == 1);
            if(cart == null)
            {
                Order order = new Order();
                List<Order> orders = context.Orders.OrderByDescending(o => o.OrderId).ToList();
                order.OrderId = orders.Count == 0 ? 1 : orders[0].OrderId + 1;
                order.UserId = account.UserId;
                order.Status = 1;
                context.Orders.Add(order);
                context.SaveChanges();
                cart = order;
            }
            List<OrderedTicket> cart_details = context.OrderedTickets.Where(ot => ot.OrderId == cart.OrderId).ToList();

            string[] ticket_id_raw_list = Request.Form["ticket_id"];
            List<int> ticket_id_list = new List<int>();
            foreach (string ticket_id_raw in ticket_id_raw_list)
            {
                ticket_id_list.Add(Convert.ToInt32(ticket_id_raw));
            }

            string[] ticket_type_raw_list = Request.Form["type_id"];
            List<int> ticket_type_list = new List<int>();
            foreach (string ticket_type_raw in ticket_type_raw_list)
            {
                ticket_type_list.Add(Convert.ToInt32(ticket_type_raw));
            }

            for(int i = 0; i < ticket_id_list.Count; i++)
            {
                if(context.OrderedTickets.FirstOrDefault(ot => ot.OrderId == cart.OrderId && ot.TicketId == ticket_id_list[i]) == null)
                {
                    OrderedTicket orderedticket = new OrderedTicket();
                    orderedticket.OrderId = cart.OrderId;
                    orderedticket.TicketId = ticket_id_list[i];
                    orderedticket.TypeId = ticket_type_list[i];
                    context.OrderedTickets.Add(orderedticket);
                }
            }
            context.SaveChanges();
            return Redirect("/cart/list");
        }
    }
}
