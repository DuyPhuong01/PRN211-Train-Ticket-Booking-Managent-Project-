﻿using System;
using System.Collections.Generic;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class Order
    {
        public int OrderId { get; set; }
        public int UserId { get; set; }
        public DateTime? OrderDate { get; set; }

        public virtual User User { get; set; }
    }
}