using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using TrainTicketBooking.Models;

namespace TrainTicketBooking.Controllers
{
    public class AccountController : Controller
    {
        public IActionResult Login()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();

            string username = Request.Form["username"];
            string password = Request.Form["password"];

            User account = context.Users.FirstOrDefault(u => u.Username.Equals(username) && u.Password.Equals(password));
            if(account == null)
            {
                return Json(new { htmlMsg = "Wrong username or password!", htmlMsgType = "danger", success = false });
                //return StatusCode(500, "My error");
            } else
            {
                string account_json = JsonConvert.SerializeObject(account);
                HttpContext.Session.SetString("account", account_json);
                return Json(new { htmlMsg = "Login successfull!", htmlMsgType = "success", success = true });
            }
        }
        public IActionResult Logout()
        {
            string account_session = HttpContext.Session.GetString("account");
            if (account_session != null)
            {
                HttpContext.Session.Remove("account");
            }
            return Json(new { htmlMsg = "Logout successfull!", htmlMsgType = "success", success = true });
        }
        public IActionResult Register()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();

            string username = Request.Form["username"];
            string fullname = Request.Form["fullname"];
            string phone = Request.Form["phone"];
            string password = Request.Form["password"];
            string repassword = Request.Form["repassword"];
            if(password != repassword)
            {
                return Json(new { htmlMsg = "Mật khẩu không khớp!"+ password +"-"+ repassword, htmlMsgType = "danger", success = true });
            }
            User user = context.Users.FirstOrDefault(u => u.Username == username);
            if(user != null)
            {
                return Json(new { htmlMsg = "Tên đăng nhập đã được sử dụng!", htmlMsgType = "danger", success = true });

            }
            if (password.Length < 8)
            {
                return Json(new { htmlMsg = "Mật khẩu phải dài hơn 8 ký tự!", htmlMsgType = "danger", success = true });

            }
            User account = new User();
            account.Fullname = fullname;
            account.Username = username;
            account.UserId = context.Users.OrderByDescending(u => u.UserId).ToList()[0].UserId + 1;
            account.RoleId = 1;
            account.Phone = phone;
            account.Password = password;
            context.Users.Add(account);
            context.SaveChanges();

            return Json(new { htmlMsg = "Đăng ký thành công!", htmlMsgType = "success", success = true });
        }

        public IActionResult MyOrder()
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();
            string account_session = HttpContext.Session.GetString("account");
            User account = JsonConvert.DeserializeObject<User>(account_session);

            List<Order> orders = context.Orders
                .Include("OrderedTickets")
                .Include("OrderedTickets.Ticket")
                .Where(o => o.UserId == account.UserId && o.Status == 0)
                .OrderByDescending(o => o.OrderDate)
                .ToList();

            return View(orders);
        }

        public IActionResult Order(int orderid)
        {
            PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext context = new PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext();

            Order order = context.Orders
                .Include(o => o.OrderedTickets)
                .Include("OrderedTickets.Ticket")
                .Include("OrderedTickets.Ticket.TicketPrice")
                .Include("OrderedTickets.Ticket.TicketPrice.Trip")
                .Include("OrderedTickets.Ticket.TicketPrice.Trip.Route")
                .Include("OrderedTickets.Ticket.TicketPrice.Trip.Route.ToNavigation")
                .Include("OrderedTickets.Ticket.TicketPrice.Trip.Route.FromNavigation")
                .Include("OrderedTickets.Ticket.Carriage")
                .Include("OrderedTickets.Ticket.Carriage.Train")
                .FirstOrDefault(o => o.OrderId == orderid);
            return View(order);
        }
    }
}
