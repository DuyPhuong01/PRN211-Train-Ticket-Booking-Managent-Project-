using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Train
    {
        public Train()
        {
            Carriages = new HashSet<Carriage>();
            Trips = new HashSet<Trip>();
        }

        public int TrainId { get; set; }
        public string TrainName { get; set; }

        public virtual ICollection<Carriage> Carriages { get; set; }
        public virtual ICollection<Trip> Trips { get; set; }
    }
}
