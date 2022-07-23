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

        public IActionResult ChangeTicketType()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            string account_session = HttpContext.Session.GetString("account");
            User account = JsonConvert.DeserializeObject<User>(account_session);

            int id = Convert.ToInt32(Request.Form["id"]);
            int type_id = Convert.ToInt32(Request.Form["type_id"]);
            OrderedTicket orderedTicket = context.OrderedTickets.Include(ot => ot.Ticket).Include(ot => ot.Ticket.TicketPrice).FirstOrDefault(ot => ot.Id == id);
            orderedTicket.TypeId = type_id;
            context.SaveChanges();

            int money = type_id == 1 ? ((int)orderedTicket.Ticket.TicketPrice.Price) : ((int)orderedTicket.Ticket.TicketPrice.Price / 2);
            return Json(new { Message = "Change success!", money = money, success = true });
        }
        public IActionResult RemoveFromCart()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            string account_session = HttpContext.Session.GetString("account");
            User account = JsonConvert.DeserializeObject<User>(account_session);

            int id = Convert.ToInt32(Request.Form["id"]);
            Order cart = context.Orders.FirstOrDefault(o => o.UserId == account.UserId && o.Status == 1);
            OrderedTicket ticket = context.OrderedTickets.Include(ot => ot.Ticket).Include(ot => ot.Ticket.TicketPrice).FirstOrDefault(ot => ot.Id == id);
            cart.OrderedTickets.Remove(ticket);
            
            context.SaveChanges();
            return Json(new { Message = "Remove success!", success = true });
        }
        public IActionResult Order()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            string account_session = HttpContext.Session.GetString("account");
            User account = JsonConvert.DeserializeObject<User>(account_session);
            Order cart = context.Orders.FirstOrDefault(o => o.UserId == account.UserId && o.Status == 1);
            Order order = new Order();
            List<Order> orders = context.Orders.OrderByDescending(o => o.OrderId).ToList();
            order.OrderId = orders.Count == 0 ? 1 : orders[0].OrderId + 1;
            order.UserId = account.UserId;
            order.Status = 0;
            order.OrderDate = DateTime.Now;

            String[] id_raw_list = Request.Form["order_ticket_id"];

            foreach (string id_raw in id_raw_list)
            {
                int id = Convert.ToInt32(id_raw);
                OrderedTicket ticket = context.OrderedTickets.Include(ot => ot.Ticket).Include(ot => ot.Ticket.TicketPrice).FirstOrDefault(ot => ot.Id == id);
                ticket.Price = ticket.TypeId == 1 ? ticket.Ticket.TicketPrice.Price : ticket.Ticket.TicketPrice.Price / 2;
                ticket.Ticket.Status = 0;
                order.OrderedTickets.Add(ticket);
                cart.OrderedTickets.Remove(ticket);
            }
            context.Orders.Add(order);
            context.SaveChanges();

            int total_cost = 0;
            foreach (OrderedTicket orderedTicket in order.OrderedTickets)
            {
                total_cost += (int)orderedTicket.Price;
            }
            ViewBag.Total = total_cost;
            ViewBag.Time = $"{order.OrderDate.Value.Day}/{order.OrderDate.Value.Month}/{order.OrderDate.Value.Year} {order.OrderDate.Value.Hour}:{order.OrderDate.Value.Minute}";
            Order myOrder = context.Orders
                .Include(o => o.OrderedTickets)
                .Include("OrderedTickets.Ticket")
                .Include("OrderedTickets.Ticket.TicketPrice")
                .Include("OrderedTickets.Ticket.TicketPrice.Trip")
                .Include("OrderedTickets.Ticket.TicketPrice.Trip.Route")
                .Include("OrderedTickets.Ticket.TicketPrice.Trip.Route.ToNavigation")
                .Include("OrderedTickets.Ticket.TicketPrice.Trip.Route.FromNavigation")
                .Include("OrderedTickets.Ticket.Carriage")
                .Include("OrderedTickets.Ticket.Carriage.Train")
                .FirstOrDefault(o => o.OrderId == order.OrderId);
            return View(order);
        }
    }
}
