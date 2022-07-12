using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class TicketType
    {
        public TicketType()
        {
            TicketPrices = new HashSet<TicketPrice>();
        }

        public int TypeId { get; set; }
        public string TypeName { get; set; }

        public virtual ICollection<TicketPrice> TicketPrices { get; set; }
    }
}
