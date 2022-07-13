using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Route
    {
        public Route()
        {
            Trips = new HashSet<Trip>();
        }

        public int RouteId { get; set; }
        public string RouteName { get; set; }
        public int From { get; set; }
        public int To { get; set; }
        public int Duration { get; set; }
        public string Path { get; set; }
        public double? Distance { get; set; }

        public virtual Location FromNavigation { get; set; }
        public virtual Location ToNavigation { get; set; }
        public virtual ICollection<Trip> Trips { get; set; }
    }
}
