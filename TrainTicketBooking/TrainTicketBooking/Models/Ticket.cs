using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Ticket
    {
        public int TicketId { get; set; }
        public int TicketPriceId { get; set; }
        public int CarriageId { get; set; }

        public virtual Carriage Carriage { get; set; }
        public virtual TicketPrice TicketPrice { get; set; }
    }
}
