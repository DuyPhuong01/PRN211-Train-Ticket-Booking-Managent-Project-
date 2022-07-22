using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class TicketType
    {
        public TicketType()
        {
            OrderedTickets = new HashSet<OrderedTicket>();
        }

        public int TypeId { get; set; }
        public string TypeName { get; set; }

        public virtual ICollection<OrderedTicket> OrderedTickets { get; set; }
    }
}
