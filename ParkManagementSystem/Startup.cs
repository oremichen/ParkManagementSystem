using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using ParkManagementSystem.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ParkManagementSystem
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddScoped<IParkingTicketService, ParkingTicketService>();

            var connectionString = "Data source=DESKTOP-31VEGUO\\SQLEXPRESS;Database=DemoBankAppDb;Trusted_Connection=true";
            var connectionString2 = "Data source=SQL5091.site4now.net;Database=db_a483f5_usertest;User Id=db_a483f5_usertest_admin;Password=userTester.1";
            services.AddDbContext<DataBaseContext>((option) =>
            {
                option.UseSqlServer(connectionString, b => b.MigrationsAssembly("ParkManagementSystem"));
            });

            services.AddSwaggerDocument(c =>
            {
                c.DocumentName = "DemoProject";
                c.Description = "DemoProject Service API";
                c.Version = "v1";
                c.Title = "DemoProject";

            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseAuthorization();

            app.UseOpenApi();
            app.UseSwaggerUi3();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
