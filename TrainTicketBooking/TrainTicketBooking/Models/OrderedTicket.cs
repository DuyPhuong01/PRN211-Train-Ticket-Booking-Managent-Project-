using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class OrderedTicket
    {
        public int OrderId { get; set; }
        public int TicketId { get; set; }
        public int TypeId { get; set; }
        public decimal Price { get; set; }

        public virtual Order Order { get; set; }
        public virtual Ticket Ticket { get; set; }
        public virtual TicketType Type { get; set; }
    }
}
