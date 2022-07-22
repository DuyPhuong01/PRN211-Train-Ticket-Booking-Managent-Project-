using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
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
    }
}
