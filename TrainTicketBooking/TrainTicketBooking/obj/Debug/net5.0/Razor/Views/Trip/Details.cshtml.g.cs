#pragma checksum "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "93d469a2b5714dc146944512b4c76e942769b72b"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Trip_Details), @"mvc.1.0.view", @"/Views/Trip/Details.cshtml")]
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
#line 1 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
using TrainTicketBooking.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"93d469a2b5714dc146944512b4c76e942769b72b", @"/Views/Trip/Details.cshtml")]
    #nullable restore
    public class Views_Trip_Details : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Trip>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 5 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
  
    Layout = "_Layout";
    ViewBag.Title = "Tickets";

#line default
#line hidden
#nullable disable
            WriteLiteral("<div class=\"container-lg\">\r\n    <div class=\"my-3 row\">\r\n        <div class=\"col-4\">\r\n            <div class=\"p-3 bg-white rounded-3 shadow-sm mb-3\">\r\n                <div>\r\n                    <p>");
#nullable restore
#line 15 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                  Write(Model.Route.RouteName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n                    <p>");
#nullable restore
#line 16 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                  Write(Model.Route.FromNavigation.LocationName);

#line default
#line hidden
#nullable disable
            WriteLiteral(" - ");
#nullable restore
#line 16 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                             Write(Model.Route.ToNavigation.LocationName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n                    <p>");
#nullable restore
#line 17 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                  Write(Model.Train.TrainName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n                    <p>");
#nullable restore
#line 18 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                   Write(Model.Time.Day);

#line default
#line hidden
#nullable disable
            WriteLiteral("/");
#nullable restore
#line 18 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                     Write(Model.Time.Month);

#line default
#line hidden
#nullable disable
            WriteLiteral("/");
#nullable restore
#line 18 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                         Write(Model.Time.Year);

#line default
#line hidden
#nullable disable
            WriteLiteral(" ");
#nullable restore
#line 18 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                                            Write(Model.Time.Hour);

#line default
#line hidden
#nullable disable
            WriteLiteral(":");
#nullable restore
#line 18 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                                                               Write(Model.Time.Minute);

#line default
#line hidden
#nullable disable
            WriteLiteral(@"</p>
                </div>
            </div>
            <div class=""p-3 bg-white rounded-3 shadow-sm mb-3"">
                <div>
                    <div class=""ticket-type-selector d-flex justify-content-between"">
                    </div>
                    <div class=""mt-3"">
                        <div class=""d-flex justify-content-between"">
                            <b>Vị trí</b>
                            <b>Loại</b>
                            <b>Giá</b>
                        </div>
                        <hr />
                    </div>
                    <div id=""bill-list"">
                    </div>
                    <div>
                        <hr />
                        <div class=""d-flex justify-content-between"">
                            <b>Tổng</b>
                            <b><span id=""total-bill"">0</span><span> đ</span></b>
                        </div>
                    </div>
                </div>
                <div>
                ");
            WriteLiteral(@"    <div class=""d-flex justify-content-between mt-3"">
                        <a class=""btn btn-outline-danger"" onclick=""clearlist()"">Clear</a>
                        <a class=""btn btn-outline-success"">Add to cart</a>
                    </div>
                </div>
            </div>
        </div>
        <div class=""col-8"">
");
#nullable restore
#line 52 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
             foreach (Carriage carriage in ViewBag.Carriages)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <div class=\"p-3 bg-white rounded-3 shadow-sm mb-3\">\r\n                    <div class=\"text-center\">\r\n                        <div");
            BeginWriteAttribute("class", " class=\"", 2323, "\"", 2331, 0);
            EndWriteAttribute();
            WriteLiteral("><h3>Toa tàu số ");
#nullable restore
#line 56 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                Write(carriage.CarriageNumber);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h3></div>\r\n                    </div>\r\n                    <div class=\"carriage p-3 border border-5 rounded-3\">\r\n                        <div class=\"d-flex\">\r\n");
#nullable restore
#line 60 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                             for (int i = 0; i < @carriage.Tickets.Count - 4; i += 4)
                            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                                <div>\r\n");
#nullable restore
#line 63 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                     for (int j = i; j < i + 4; j++)
                                    {
                                        

#line default
#line hidden
#nullable disable
#nullable restore
#line 65 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                         if (carriage.Tickets.ToList()[j].Status == 1)
                                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                                            <label>\r\n                                                <input type=\"checkbox\" name=\"seat_name\"");
            BeginWriteAttribute("value", " value=\"", 3070, "\"", 3118, 1);
#nullable restore
#line 68 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
WriteAttributeValue("", 3078, carriage.Tickets.ToList()[j].TicketId, 3078, 40, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            BeginWriteAttribute("onclick", " onclick=\"", 3119, "\"", 3196, 3);
            WriteAttributeValue("", 3129, "selectSeat(this,", 3129, 16, true);
#nullable restore
#line 68 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
WriteAttributeValue(" ", 3145, carriage.Tickets.ToList()[j].TicketPrice.Price, 3146, 49, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 3195, ")", 3195, 1, true);
            EndWriteAttribute();
            WriteLiteral(" hidden>\r\n                                                <a");
            BeginWriteAttribute("class", " class=\"", 3257, "\"", 3316, 3);
            WriteAttributeValue("", 3265, "btn", 3265, 3, true);
            WriteAttributeValue(" ", 3268, "btn-outline-success", 3269, 20, true);
#nullable restore
#line 69 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
WriteAttributeValue(" ", 3288, j==i+1 ? "mb-5" : "mb-2", 3289, 27, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 69 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                                                                           Write(carriage.Tickets.ToList()[j].Row);

#line default
#line hidden
#nullable disable
#nullable restore
#line 69 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                                                                                                              Write(carriage.Tickets.ToList()[j].Seat);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a>\r\n                                            </label>\r\n");
#nullable restore
#line 71 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                        }
                                        else
                                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                                            <a");
            BeginWriteAttribute("class", " class=\"", 3627, "\"", 3677, 3);
            WriteAttributeValue("", 3635, "btn", 3635, 3, true);
            WriteAttributeValue(" ", 3638, "btn-danger", 3639, 11, true);
#nullable restore
#line 74 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
WriteAttributeValue(" ", 3649, j==i+1 ? "mb-5" : "mb-2", 3650, 27, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 74 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                                                              Write(carriage.Tickets.ToList()[j].Row);

#line default
#line hidden
#nullable disable
#nullable restore
#line 74 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                                                                                                                 Write(carriage.Tickets.ToList()[j].Seat);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a>\r\n");
#nullable restore
#line 75 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                        }

#line default
#line hidden
#nullable disable
#nullable restore
#line 75 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                         
                                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                                </div>\r\n");
#nullable restore
#line 78 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                            }

#line default
#line hidden
#nullable disable
            WriteLiteral("                        </div>\r\n                    </div>\r\n                </div>\r\n");
#nullable restore
#line 82 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </div>\r\n    </div>\r\n</div>\r\n<div id=\"select-ticket-type\" class=\"d-none\">\r\n    <select name=\"type_id\" class=\"form-select\">\r\n");
#nullable restore
#line 88 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
         foreach (TicketType ticketType in ViewBag.TicketTypes)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <option");
            BeginWriteAttribute("value", " value=\"", 4234, "\"", 4260, 1);
#nullable restore
#line 90 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
WriteAttributeValue("", 4242, ticketType.TypeId, 4242, 18, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 90 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
                                          Write(ticketType.TypeName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</option>\r\n");
#nullable restore
#line 91 "C:\Users\Duy Phuong\Desktop\Summer 2022\PRN211\Project\GIt\PRN211-Train-Ticket-Booking-Managent-Project-\TrainTicketBooking\TrainTicketBooking\Views\Trip\Details.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </select>\r\n</div>\r\n");
            DefineSection("Scripts", async() => {
                WriteLiteral(@"
    <script>
        var a = $('#select-ticket-type').html();

        function selectSeat(cb, price) {
            if (cb.checked) {
                var name = $('.carriage label input[value=""' + cb.value + '""] + a').text();
                var row = '<div id=""bill-' + cb.value + '"" class=""d-flex justify-content-between align-items-center mb-2"">'
                    + '<div>' + name + '</div>'
                    + '<div>'
                    + a
                    + '</div>'
                    + '<div class=""price"">' + price + '</div>'
                    + '</div>';

                $('#bill-list').append(row);
                $('#bill-list #bill-' + cb.value + ' select').change(function() {
                    if ($('#bill-list #bill-' + cb.value + ' select option').first().is(':selected')) {
                        $('#bill-list #bill-' + cb.value + ' .price').text(price);
                    } else {
                        $('#bill-list #bill-' + cb.value + ' .price').text(price ");
                WriteLiteral(@"/ 2);
                    }
                    calculateTotal();
                });
            } else {
                $('#bill-list #bill-' + cb.value).remove();
            }
            calculateTotal();
        }

        function calculateTotal() {
            var sum = 0;
            $('#bill-list .price').each(function() {
                sum += parseInt($(this).text());

            });
            $('#total-bill').text(sum);
        }

        function clearlist() {
            $('#bill-list').html('');
            $('.carriage label input[type=""checkbox""]:checked').each(function() {
                    this.checked = false;
            });
        }
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Trip> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
