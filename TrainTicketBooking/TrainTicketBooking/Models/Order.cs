using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderedTickets = new HashSet<OrderedTicket>();
        }

        public int OrderId { get; set; }
        public int UserId { get; set; }
        public DateTime? OrderDate { get; set; }
        public int? Status { get; set; }

        public virtual User User { get; set; }
        public virtual ICollection<OrderedTicket> OrderedTickets { get; set; }
    }
}
