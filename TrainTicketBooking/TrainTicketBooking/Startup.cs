using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TrainTicketBooking
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddSession();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseStaticFiles();
            }
            app.UseSession();

            app.UseStaticFiles();
            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "route-list",
                    pattern: "route/list/{pagenumber?}",
                    new { controller = "Route", action = "List" }
                    );
                endpoints.MapControllerRoute(
                    name: "trip-list",
                    pattern: "trip/list/{routeid}/{pagenumber?}",
                    new { controller = "Trip", action = "List" }
                    );
                endpoints.MapControllerRoute(
                    name: "trip-details",
                    pattern: "trip/details/{tripid}",
                    new { controller = "Trip", action = "Details" }
                    );
                endpoints.MapControllerRoute(
                    name: "order-details",
                    pattern: "account/order/{orderid}",
                    new { controller = "Account", action = "Order" }
                    );
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=route}/{action=list}"
                    );
            });
        }
    }
}
