using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Carriage
    {
        public Carriage()
        {
            Tickets = new HashSet<Ticket>();
        }

        public int CarriageId { get; set; }
        public int TrainId { get; set; }
        public int CarriageNumber { get; set; }

        public virtual Train Train { get; set; }
        public virtual ICollection<Ticket> Tickets { get; set; }
    }
}
