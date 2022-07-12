using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Location
    {
        public Location()
        {
            RouteFromNavigations = new HashSet<Route>();
            RouteToNavigations = new HashSet<Route>();
        }

        public int LocationId { get; set; }
        public string LocationName { get; set; }

        public virtual ICollection<Route> RouteFromNavigations { get; set; }
        public virtual ICollection<Route> RouteToNavigations { get; set; }
    }
}
