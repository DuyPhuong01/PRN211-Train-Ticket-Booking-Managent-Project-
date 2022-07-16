using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Trip
    {
        public Trip()
        {
            TicketPrices = new HashSet<TicketPrice>();
        }

        public int TripId { get; set; }
        public int RouteId { get; set; }
        public int TrainId { get; set; }
        public DateTime Time { get; set; }

        public virtual Route Route { get; set; }
        public virtual Train Train { get; set; }
        public virtual ICollection<TicketPrice> TicketPrices { get; set; }
    }
}
