using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ParkManagementSystem.Models;
using ParkManagementSystem.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ParkManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ParkController : ControllerBase
    {
        private readonly IParkingTicketService _parkingTicketService;

        public ParkController(IParkingTicketService parkingTicketService)
        {
            _parkingTicketService = parkingTicketService;
        }

        [HttpPost("add-parking-ticket")]
        public async Task<IActionResult> AddParkingTicket(string K, string L)
        {
            var response = await _parkingTicketService.AddParkingTickets(K, L);
            return Ok(response);
        }

        [HttpPost("add-parking-rules")]
        public async Task<IActionResult> AddPackingRules(PackingRules model)
        {
            var response = await _parkingTicketService.AddParkingRules(model);
            return Ok(response);
        }

        [HttpGet("get-all-tickets")]
        public async Task<IActionResult> GetTicketsByDateRange(string K, string L)
        {
            var response = await _parkingTicketService.GetAllTicketsByTimeRange(K, L);
            return Ok(response);
        }

       
    }
}
