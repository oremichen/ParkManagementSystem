using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ParkManagementSystem.Models
{
    public class PackingTickets
    {
        [Key]
        public long TicketId { get; set; }
        public DateTime TimeOfEntry { get; set; }
        public DateTime TimeOfExist { get; set; }
        public int TotalCost { get; set; }
    }
}
