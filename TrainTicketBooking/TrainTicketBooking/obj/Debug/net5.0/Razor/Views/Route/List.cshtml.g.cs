#pragma checksum "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Route\List.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "3fd00d2405cd0d50d878a458752fcf0206c4de76"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Route_List), @"mvc.1.0.view", @"/Views/Route/List.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Route\List.cshtml"
using TrainTicketBooking.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3fd00d2405cd0d50d878a458752fcf0206c4de76", @"/Views/Route/List.cshtml")]
    #nullable restore
    public class Views_Route_List : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<Route>>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 5 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Route\List.cshtml"
  
    Layout = "_Layout";
    ViewBag.Title = "Route List";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"<div class=""container-lg"">
    <div class=""p-3 bg-white rounded-3 shadow-sm my-3"">
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
");
#nullable restore
#line 22 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Route\List.cshtml"
                 foreach (Route route in Model)
                {

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <tr class=\"py-1 bg-light\">\r\n                        <td>\r\n                            <div>\r\n                                ");
#nullable restore
#line 27 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Route\List.cshtml"
                           Write(route.RouteName);

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n                            </div>\r\n                        </td>\r\n                    </tr>\r\n");
#nullable restore
#line 31 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Route\List.cshtml"
                }

#line default
#line hidden
#nullable disable
            WriteLiteral("            </tbody>\r\n        </table>\r\n    </div>\r\n</div>");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<Route>> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
