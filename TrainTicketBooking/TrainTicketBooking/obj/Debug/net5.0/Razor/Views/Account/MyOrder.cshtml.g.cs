#pragma checksum "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "58d43fe71c989873ec0b9cc790bc2328391e19b5"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Account_MyOrder), @"mvc.1.0.view", @"/Views/Account/MyOrder.cshtml")]
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
#line 1 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
using TrainTicketBooking.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"58d43fe71c989873ec0b9cc790bc2328391e19b5", @"/Views/Account/MyOrder.cshtml")]
    #nullable restore
    public class Views_Account_MyOrder : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<Order>>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 5 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
  
    Layout = "_Layout";
    ViewBag.Title = "Vé của tôi";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n");
            WriteLiteral("\r\n<div class=\"container-lg\">\r\n    <div class=\"my-3\">\r\n");
#nullable restore
#line 14 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
         if(Model.Count == 0){

#line default
#line hidden
#nullable disable
            WriteLiteral("        <h3>Bạn chưa mua vé nào!</h3>\r\n");
#nullable restore
#line 16 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
        } else {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <div class=\"text-center\">\r\n                <h3>Vé của tôi</h3>\r\n            </div>\r\n");
#nullable restore
#line 20 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
             foreach (Order o in Model)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <div class=\"bg-white rounded-3 shadow-sm mb-3\">\r\n                <a");
            BeginWriteAttribute("href", " href=\"", 620, "\"", 652, 2);
            WriteAttributeValue("", 627, "/account/order/", 627, 15, true);
#nullable restore
#line 23 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
WriteAttributeValue("", 642, o.OrderId, 642, 10, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" class=\"text-muted text-decoration-none fs-4\">\r\n                    <div class=\"p-3\">\r\n                        <div><b>Ngày: </b><span>");
#nullable restore
#line 25 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
                                           Write(o.OrderDate.Value.ToString("dd'/'MM'/'yyy HH:mm"));

#line default
#line hidden
#nullable disable
            WriteLiteral("</span></div>\r\n");
#nullable restore
#line 26 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
                          
                        int sum = 0;
                        

#line default
#line hidden
#nullable disable
            WriteLiteral("                        <div>\r\n                            <b>Vé: </b>\r\n");
#nullable restore
#line 31 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
                             foreach (OrderedTicket ot in o.OrderedTickets)
                            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <span>");
#nullable restore
#line 33 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
                              Write(ot.Ticket.Row);

#line default
#line hidden
#nullable disable
#nullable restore
#line 33 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
                                              Write(ot.Ticket.Seat);

#line default
#line hidden
#nullable disable
            WriteLiteral(",</span>\r\n");
#nullable restore
#line 34 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
                            sum += (int)ot.Price;
                            }

#line default
#line hidden
#nullable disable
            WriteLiteral("                        </div>\r\n                        <div><b>Tổng: </b><span class=\"format-price\">");
#nullable restore
#line 37 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
                                                                Write(sum);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span></div>\r\n                    </div>\r\n                </a>\r\n            </div>\r\n");
#nullable restore
#line 41 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
            }

#line default
#line hidden
#nullable disable
#nullable restore
#line 41 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Account\MyOrder.cshtml"
             
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </div>\r\n</div>\r\n");
            DefineSection("Scripts", async() => {
                WriteLiteral(@"  
    
    <script>
        var formatter = new Intl.NumberFormat('vie-VN', {
                style: 'currency',
                currency: 'VND',
            });
            $.each($('.format-price'), function(t){
                var price = parseInt($(this).html());
                $(this).html(formatter.format(price));
            });
    </script>
    ");
            }
            );
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<Order>> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591