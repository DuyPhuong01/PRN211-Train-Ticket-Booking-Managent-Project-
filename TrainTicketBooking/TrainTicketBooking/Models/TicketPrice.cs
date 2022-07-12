using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class TicketPrice
    {
        public TicketPrice()
        {
            Tickets = new HashSet<Ticket>();
        }

        public int TicketPriceId { get; set; }
        public int TypeId { get; set; }
        public int TripId { get; set; }
        public decimal Price { get; set; }

        public virtual Trip Trip { get; set; }
        public virtual TicketType Type { get; set; }
        public virtual ICollection<Ticket> Tickets { get; set; }
    }
}
