using ParkManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace ParkManagementSystem.Services
{
   
    public interface IParkingTicketService
    {
        Task<PackingRules> AddParkingRules(PackingRules model);
        Task<PackingTickets> AddParkingTickets(string entryTime, string exitTime);
        Task<IEnumerable<PackingTickets>> GetAllTicketsByTimeRange(string entryTime, string exitTime);
    }

    public class ParkingTicketService : IParkingTicketService
    {
        private readonly DataBaseContext _context;

        public ParkingTicketService(DataBaseContext context)
        {
            _context = context;
        }

        public async Task<PackingTickets> AddParkingTickets(string entryTime, string exitTime)
        {
            #region Property
            int totalCharge = 0;
            int entrytime = 0;
            int first_full_hour = 1;
            int excess_hour_charge = 2;
            #endregion

            #region Convert string and get time difference
            DateTime enTime = DateTime.ParseExact(entryTime, "HH:mm",
                                        CultureInfo.InvariantCulture);

            DateTime exTime = DateTime.ParseExact(exitTime, "HH:mm",
                                       CultureInfo.InvariantCulture);

            TimeSpan difference = exTime - enTime;
            int hours = difference.Hours;
            #endregion

            //get packing-entry-rules
            var entryCharge = _context.PackingRules.FirstOrDefault(e => e.Hour == entrytime);
            var fullHourCharge = _context.PackingRules.FirstOrDefault(e => e.Hour == first_full_hour);
            var excessHourCharge = _context.PackingRules.FirstOrDefault(e => e.Hour == excess_hour_charge);

            if (hours >= entrytime && hours <= first_full_hour)
            {
                totalCharge = entryCharge.Charge + fullHourCharge.Charge;
            }

            if (hours > first_full_hour)
            {
                totalCharge = entryCharge.Charge + fullHourCharge.Charge + (hours * excessHourCharge.Charge);
            }

            PackingTickets packingTickets = new PackingTickets
            {
                TimeOfEntry = enTime,
                TimeOfExist = exTime,
                TotalCost = totalCharge
            };

            var result = await _context.AddAsync<PackingTickets>(packingTickets);
            await _context.SaveChangesAsync();
            return result.Entity;
        }

        public async Task<PackingRules> AddParkingRules(PackingRules model)
        {
           // var results = _context.PackingRules.AsQueryable();
            var result = await _context.AddAsync<PackingRules>(model);
            await _context.SaveChangesAsync();
            return result.Entity;
        }

        public async Task<IEnumerable<PackingTickets>> GetAllTicketsByTimeRange(string entryTime, string exitTime)
        {
            #region Convert string and get time difference
            DateTime enTime = DateTime.ParseExact(entryTime, "HH:mm",
                                        CultureInfo.InvariantCulture);

            DateTime exTime = DateTime.ParseExact(exitTime, "HH:mm",
                                       CultureInfo.InvariantCulture);

            #endregion

            var result = _context.PackingTickets.AsQueryable().Where(e => e.TimeOfEntry >= enTime && e.TimeOfExist <= exTime);
            return await Task.FromResult(result.ToList());

        }
    }
}
