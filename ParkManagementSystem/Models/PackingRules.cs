using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ParkManagementSystem.Models
{
    public class PackingRules
    {
        [Key]
        public long Id { get; set; }
        public int Hour { get; set; }
        public int Charge { get; set; }
    }
}
