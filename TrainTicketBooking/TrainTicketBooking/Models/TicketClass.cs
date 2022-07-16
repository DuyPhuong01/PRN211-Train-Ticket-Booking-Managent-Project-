using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class TicketClass
    {
        public TicketClass()
        {
            TicketPrices = new HashSet<TicketPrice>();
        }

        public int ClassId { get; set; }
        public string ClassName { get; set; }

        public virtual ICollection<TicketPrice> TicketPrices { get; set; }
    }
}
