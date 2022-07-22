using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Ticket
    {
        public Ticket()
        {
            OrderedTickets = new HashSet<OrderedTicket>();
        }

        public int TicketId { get; set; }
        public int TicketPriceId { get; set; }
        public int CarriageId { get; set; }
        public string Row { get; set; }
        public int Seat { get; set; }
        public int Status { get; set; }

        public virtual Carriage Carriage { get; set; }
        public virtual TicketPrice TicketPrice { get; set; }
        public virtual ICollection<OrderedTicket> OrderedTickets { get; set; }
    }
}
