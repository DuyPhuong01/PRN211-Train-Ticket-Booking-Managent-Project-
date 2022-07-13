CREATE DATABASE [PRN211_PROJECT_TRAIN_TICKET_BOOKING]
GO
USE [PRN211_PROJECT_TRAIN_TICKET_BOOKING]
GO

CREATE TABLE [roles] (
  [role_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [role_name] nvarchar(128)
)
GO

CREATE TABLE [users] (
  [user_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [username] varchar(255) NOT NULL,
  [password] varchar(255) NOT NULL,
  [fullname] nvarchar(255) NOT NULL,
  [role_id] int NOT NULL,
  [city] nvarchar(128),
  [country] nvarchar(128),
  [phone] varchar(15)
)
GO

CREATE TABLE [orders] (
  [order_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [user_id] int NOT NULL,
  [order_date] datetime
)
GO

CREATE TABLE [trains] (
  [train_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [train_name] varchar(64) NOT NULL
)
GO

CREATE TABLE [carriages] (
  [carriage_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [train_id] int NOT NULL,
  [carriage_number] int NOT NULL
)
GO

CREATE TABLE [locations] (
  [location_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [location_name] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [routes] (
  [route_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [route_name] nvarchar(255),
  [from] int NOT NULL,
  [to] int NOT NULL,
  [duration] int NOT NULL,
  [path] ntext,
  [distance] float
)
GO

CREATE TABLE [trips] (
  [trip_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [route_id] int NOT NULL,
  [train_id] int NOT NULL,
  [date] date NOT NULL,
  [start] datetime NOT NULL
)
GO

CREATE TABLE [ticket_types] (
  [type_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [type_name] nvarchar(128)
)
GO

CREATE TABLE [ticket_prices] (
  [ticket_price_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [type_id] int NOT NULL,
  [trip_id] int NOT NULL,
  [price] money NOT NULL
)
GO

CREATE TABLE [tickets] (
  [ticket_id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [ticket_price_id] int NOT NULL,
  [carriage_id] int NOT NULL
)
GO

CREATE TABLE [ordered_tickets] (
  [order_id] int NOT NULL,
  [ticket_id] int NOT NULL,
  [price] money NOT NULL
)
GO
ALTER TABLE [users]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id]) REFERENCES [roles] ([role_id])
GO

ALTER TABLE [orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [carriages]  WITH CHECK ADD  CONSTRAINT [FK_Carriage_Train] FOREIGN KEY ([train_id]) REFERENCES [trains] ([train_id])
GO

ALTER TABLE [routes]  WITH CHECK ADD  CONSTRAINT [FK_Route_Location_From] FOREIGN KEY ([from]) REFERENCES [locations] ([location_id])
GO

ALTER TABLE [routes]  WITH CHECK ADD  CONSTRAINT [FK_Route_Location_To] FOREIGN KEY ([to]) REFERENCES [locations] ([location_id])
GO

ALTER TABLE [trips]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Route] FOREIGN KEY ([route_id]) REFERENCES [routes] ([route_id])
GO

ALTER TABLE [trips]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Train] FOREIGN KEY ([train_id]) REFERENCES [trains] ([train_id])
GO

ALTER TABLE [ticket_prices]  WITH CHECK ADD  CONSTRAINT [FK_TicketPrice_TicketType] FOREIGN KEY ([type_id]) REFERENCES [ticket_types] ([type_id])
GO

ALTER TABLE [ticket_prices]  WITH CHECK ADD  CONSTRAINT [FK_TicketPrice_Trip] FOREIGN KEY ([trip_id]) REFERENCES [trips] ([trip_id])
GO

ALTER TABLE [tickets]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_TicketPrice] FOREIGN KEY ([ticket_price_id]) REFERENCES [ticket_prices] ([ticket_price_id])
GO

ALTER TABLE [tickets]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Carriage] FOREIGN KEY ([carriage_id]) REFERENCES [carriages] ([carriage_id])
GO

ALTER TABLE [ordered_tickets]  WITH CHECK ADD  CONSTRAINT [FK_OrderdTicket_Order] FOREIGN KEY ([order_id]) REFERENCES [orders] ([order_id])
GO

ALTER TABLE [ordered_tickets]  WITH CHECK ADD  CONSTRAINT [FK_OrderdTicket_Ticket] FOREIGN KEY ([ticket_id]) REFERENCES [tickets] ([ticket_id])
GO

insert into trains (train_name) values ('A088');
insert into trains (train_name) values ('B705');
insert into trains (train_name) values ('C352');
insert into trains (train_name) values ('D451');
insert into trains (train_name) values ('E721');

insert into carriages (train_id, carriage_number) values (1, 1);
insert into carriages (train_id, carriage_number) values (1, 2);
insert into carriages (train_id, carriage_number) values (1, 3);
insert into carriages (train_id, carriage_number) values (1, 4);
insert into carriages (train_id, carriage_number) values (1, 5);
insert into carriages (train_id, carriage_number) values (2, 1);
insert into carriages (train_id, carriage_number) values (2, 2);
insert into carriages (train_id, carriage_number) values (2, 3);
insert into carriages (train_id, carriage_number) values (2, 4);
insert into carriages (train_id, carriage_number) values (2, 5);
insert into carriages (train_id, carriage_number) values (3, 1);
insert into carriages (train_id, carriage_number) values (3, 2);
insert into carriages (train_id, carriage_number) values (3, 3);
insert into carriages (train_id, carriage_number) values (3, 4);
insert into carriages (train_id, carriage_number) values (3, 5);
insert into carriages (train_id, carriage_number) values (4, 1);
insert into carriages (train_id, carriage_number) values (4, 2);
insert into carriages (train_id, carriage_number) values (4, 3);
insert into carriages (train_id, carriage_number) values (4, 4);
insert into carriages (train_id, carriage_number) values (4, 5);
insert into carriages (train_id, carriage_number) values (5, 1);
insert into carriages (train_id, carriage_number) values (5, 2);
insert into carriages (train_id, carriage_number) values (5, 3);
insert into carriages (train_id, carriage_number) values (5, 4);
insert into carriages (train_id, carriage_number) values (5, 5);

insert into locations (location_name) values (N'An Giang');
insert into locations (location_name) values (N'Bà Rịa – Vũng Tàu');
insert into locations (location_name) values (N'Bắc Giang');
insert into locations (location_name) values (N'Bắc Kạn');
insert into locations (location_name) values (N'Bạc Liêu');
insert into locations (location_name) values (N'Bắc Ninh');
insert into locations (location_name) values (N'Bến Tre');
insert into locations (location_name) values (N'Bình Định');
insert into locations (location_name) values (N'Bình Dương');
insert into locations (location_name) values (N'Bình Phước');
insert into locations (location_name) values (N'Bình Thuận');
insert into locations (location_name) values (N'Cà Mau');
insert into locations (location_name) values (N'Cần Thơ');
insert into locations (location_name) values (N'Cao Bằng');
insert into locations (location_name) values (N'Đà Nẵng');
insert into locations (location_name) values (N'Đắk Lắk');
insert into locations (location_name) values (N'Đắk Nông');
insert into locations (location_name) values (N'Điện Biên');
insert into locations (location_name) values (N'Đồng Nai');
insert into locations (location_name) values (N'Đồng Tháp');
insert into locations (location_name) values (N'Gia Lai');
insert into locations (location_name) values (N'Hà Giang');
insert into locations (location_name) values (N'Hà Nam');
insert into locations (location_name) values (N'Hà Nội');
insert into locations (location_name) values (N'Hà Tĩnh');
insert into locations (location_name) values (N'Hải Dương');
insert into locations (location_name) values (N'Hải Phòng');
insert into locations (location_name) values (N'Hậu Giang');
insert into locations (location_name) values (N'Hòa Bình');
insert into locations (location_name) values (N'Hưng Yên');
insert into locations (location_name) values (N'Khánh Hòa');
insert into locations (location_name) values (N'Kiên Giang');
insert into locations (location_name) values (N'Kon Tum');
insert into locations (location_name) values (N'Lai Châu');
insert into locations (location_name) values (N'Lâm Đồng');
insert into locations (location_name) values (N'Lạng Sơn');
insert into locations (location_name) values (N'Lào Cai');
insert into locations (location_name) values (N'Long An');
insert into locations (location_name) values (N'Nam Định');
insert into locations (location_name) values (N'Nghệ An');
insert into locations (location_name) values (N'Ninh Bình');
insert into locations (location_name) values (N'Ninh Thuận');
insert into locations (location_name) values (N'Phú Thọ');
insert into locations (location_name) values (N'Phú Yên');
insert into locations (location_name) values (N'Quảng Bình');
insert into locations (location_name) values (N'Quảng Nam');
insert into locations (location_name) values (N'Quảng Ngãi');
insert into locations (location_name) values (N'Quảng Ninh');
insert into locations (location_name) values (N'Quảng Trị');
insert into locations (location_name) values (N'Sóc Trăng');
insert into locations (location_name) values (N'Sơn La');
insert into locations (location_name) values (N'Tây Ninh');
insert into locations (location_name) values (N'Thái Bình');
insert into locations (location_name) values (N'Thái Nguyên');
insert into locations (location_name) values (N'Thanh Hóa');
insert into locations (location_name) values (N'Thừa Thiên Huế');
insert into locations (location_name) values (N'Tiền Giang');
insert into locations (location_name) values (N'TP Hồ Chí Minh');
insert into locations (location_name) values (N'Trà Vinh');
insert into locations (location_name) values (N'Tuyên Quang');
insert into locations (location_name) values (N'Vĩnh Long');
insert into locations (location_name) values (N'Vĩnh Phúc');
insert into locations (location_name) values (N'Yên Bái');

insert into roles(role_name) values ('Customer');
insert into roles(role_name) values ('Admin');

insert into users (username, password, fullname, role_id, phone) values ('acruttenden0', 'paZax6', 'Allister Cruttenden', 1, '812-789-3868');
insert into users (username, password, fullname, role_id, phone) values ('gcrawford1', 'IT9IPNSmSnjs', 'George Crawford', 1, '941-855-1976');
insert into users (username, password, fullname, role_id, phone) values ('crouby2', 'ssrWSLH2cN', 'Correna Rouby', 1, '960-364-2263');
insert into users (username, password, fullname, role_id, phone) values ('ahalso3', 'VJigqb8', 'Addi Halso', 1, '354-958-2334');
insert into users (username, password, fullname, role_id, phone) values ('whorribine4', '3fgySr', 'Woodman Horribine', 1, '954-235-0809');
insert into users (username, password, fullname, role_id, phone) values ('shoodlass5', '4KBEEWQOF', 'Shela Hoodlass', 1, '199-774-9554');
insert into users (username, password, fullname, role_id, phone) values ('lofener6', 'OLXBgN56Rj3q', 'Lorie Ofener', 1, '942-644-5332');
insert into users (username, password, fullname, role_id, phone) values ('dwalles7', 'CGhgNM1', 'Damien Walles', 1, '360-472-8268');
insert into users (username, password, fullname, role_id, phone) values ('obear8', '5rP1WnP3e66', 'Odilia Bear', 1, '626-889-1557');
insert into users (username, password, fullname, role_id, phone) values ('vblaxland9', 'NB6GgAfa', 'Vanda Blaxland', 1, '334-896-4740');
insert into users (username, password, fullname, role_id, phone) values ('gdudderidgea', 'qPUASpr', 'Gerek Dudderidge', 1, '135-982-1120');
insert into users (username, password, fullname, role_id, phone) values ('wricciardellob', 'xccwXAVaFH3O', 'Wilow Ricciardello', 1, '194-846-3383');
insert into users (username, password, fullname, role_id, phone) values ('rgibbc', 'mFkaF7weYzq', 'Roy Gibb', 1, '521-979-8395');
insert into users (username, password, fullname, role_id, phone) values ('gdalyelld', 'U7YBZuzQ', 'Giovanna Dalyell', 1, '234-897-5883');
insert into users (username, password, fullname, role_id, phone) values ('fdee', 'cPywALNV', 'Fan De Vere', 1, '205-507-6113');
insert into users (username, password, fullname, role_id, phone) values ('themeretf', 'noqfy555u9oL', 'Tiebout Hemeret', 1, '361-130-1553');
insert into users (username, password, fullname, role_id, phone) values ('severissg', 'AriokVJ', 'Shela Everiss', 1, '206-515-1677');
insert into users (username, password, fullname, role_id, phone) values ('rphilsonh', 'vsEjnrjeH7T', 'Rutherford Philson', 1, '718-971-9528');
insert into users (username, password, fullname, role_id, phone) values ('warkili', '4aLZMg', 'Waneta Arkil', 1, '858-977-7495');
insert into users (username, password, fullname, role_id, phone) values ('hgenthnerj', 'JeZ1SrEL6l8J', 'Harlin Genthner', 1, '856-983-9569');
insert into users (username, password, fullname, role_id, phone) values ('dludlk', 'Y1UE56njyK', 'Del Ludl', 1, '501-715-5185');
insert into users (username, password, fullname, role_id, phone) values ('wduminil', 'ifmpJIHoqiC3', 'Wendi Dumini', 1, '306-249-5214');
insert into users (username, password, fullname, role_id, phone) values ('jstallebrassm', 'v9o9lK', 'Jody Stallebrass', 1, '653-768-7225');
insert into users (username, password, fullname, role_id, phone) values ('ltowlen', 'oBaNId', 'Lesly Towle', 1, '469-531-8999');
insert into users (username, password, fullname, role_id, phone) values ('nbelfieldo', 'RZH2KP', 'Norbert Belfield', 1, '108-607-7990');
insert into users (username, password, fullname, role_id, phone) values ('kbluntp', 'jzVAThzB', 'Kaila Blunt', 1, '105-915-2965');
insert into users (username, password, fullname, role_id, phone) values ('emaypotherq', 'H3zifEkp4plI', 'Ethelda Maypother', 1, '489-209-8460');
insert into users (username, password, fullname, role_id, phone) values ('abinghamr', 'tGtpvnNjAaC', 'Andres Bingham', 1, '585-633-6153');
insert into users (username, password, fullname, role_id, phone) values ('eharrymans', 'wpJx75HKE65', 'Emery Harryman', 1, '968-879-7762');
insert into users (username, password, fullname, role_id, phone) values ('mstuket', 'hFedk5', 'Mata Stuke', 1, '319-130-8341');
insert into users (username, password, fullname, role_id, phone) values ('chawkeru', 'hOqBqUPpNq', 'Clarisse Hawker', 1, '378-536-6575');
insert into users (username, password, fullname, role_id, phone) values ('vamberv', 'anI0Sut7', 'Vonny Amber', 1, '878-393-3087');
insert into users (username, password, fullname, role_id, phone) values ('acerithw', 'sBqRTfKJYxCu', 'Arnaldo Cerith', 1, '767-925-5573');
insert into users (username, password, fullname, role_id, phone) values ('ldex', '2t9DQO', 'Leif de Bullion', 1, '915-357-0287');
insert into users (username, password, fullname, role_id, phone) values ('pfaughnany', 'ravBgdOsWI', 'Pincas Faughnan', 1, '288-564-8607');
insert into users (username, password, fullname, role_id, phone) values ('mcarlislez', '8Y2akg0P5A6', 'Murry Carlisle', 1, '799-840-1781');
insert into users (username, password, fullname, role_id, phone) values ('mcowperthwaite10', 'GJyXxtEG', 'Mallissa Cowperthwaite', 1, '781-246-0129');
insert into users (username, password, fullname, role_id, phone) values ('bransom11', 'mS38NgQK5PZZ', 'Benita Ransom', 1, '925-239-4103');
insert into users (username, password, fullname, role_id, phone) values ('wmalin12', 'l6x2QPu', 'Wilmar Malin', 1, '986-108-0046');
insert into users (username, password, fullname, role_id, phone) values ('amegainey13', 'cdDXeYWD', 'Alaine Megainey', 1, '381-673-8609');
insert into users (username, password, fullname, role_id, phone) values ('janthiftle14', 'kI9gtwMAtA2p', 'Jimmy Anthiftle', 1, '527-826-1999');
insert into users (username, password, fullname, role_id, phone) values ('kpantin15', 'OVI5btaqhV5', 'Kirsteni Pantin', 1, '696-527-0983');
insert into users (username, password, fullname, role_id, phone) values ('clapworth16', '4rLVyAYx', 'Carce Lapworth', 1, '842-544-3283');
insert into users (username, password, fullname, role_id, phone) values ('abeckett17', 'O6uCWQoqZAOc', 'Abbot Beckett', 1, '435-335-1490');
insert into users (username, password, fullname, role_id, phone) values ('msunderland18', 'PeYqlc', 'Maddy Sunderland', 1, '183-257-0110');
insert into users (username, password, fullname, role_id, phone) values ('tzack19', 'xQYXkzz', 'Trevar Zack', 1, '388-817-4709');
insert into users (username, password, fullname, role_id, phone) values ('nbaly1a', 'KRxXsdk', 'Ninnette Baly', 1, '110-826-0865');
insert into users (username, password, fullname, role_id, phone) values ('ipinfold1b', 'k2wccVR2R3u', 'Ilse Pinfold', 1, '709-159-2752');
insert into users (username, password, fullname, role_id, phone) values ('kchidzoy1c', 'Te6oXj0R2pC', 'Kore Chidzoy', 1, '838-957-6185');
insert into users (username, password, fullname, role_id, phone) values ('chenke1d', 'VepJRE', 'Christian Henke', 1, '233-336-3139');
insert into users (username, password, fullname, role_id, phone) values ('rkubatsch1e', 'voTKjBh', 'Reube Kubatsch', 1, '192-744-1554');
insert into users (username, password, fullname, role_id, phone) values ('corable1f', 'TTJcZCtb2dG', 'Claudina Orable', 1, '420-320-9800');
insert into users (username, password, fullname, role_id, phone) values ('vpardue1g', 'AT6p04Lw', 'Vassily Pardue', 1, '539-109-2757');
insert into users (username, password, fullname, role_id, phone) values ('ccarcas1h', 'xHHKr0', 'Charmion Carcas', 1, '503-939-4481');
insert into users (username, password, fullname, role_id, phone) values ('dquillinane1i', 'mYGHkYi', 'Delora Quillinane', 1, '226-125-0435');
insert into users (username, password, fullname, role_id, phone) values ('ssiggins1j', 'kuDDAP3Gp', 'Shannon Siggins', 1, '906-349-7903');
insert into users (username, password, fullname, role_id, phone) values ('ibuxton1k', 'N9TMSSxv3E', 'Ingmar Buxton', 1, '126-633-5917');
insert into users (username, password, fullname, role_id, phone) values ('ibartusek1l', 'jv5dgmVRUiO', 'Ileana Bartusek', 1, '166-330-2011');
insert into users (username, password, fullname, role_id, phone) values ('tjunkison1m', 'M5wgwV8h', 'Tasia Junkison', 1, '879-981-3023');
insert into users (username, password, fullname, role_id, phone) values ('kbown1n', 'M9TgEHPLT', 'Kurtis Bown', 1, '627-797-0504');
insert into users (username, password, fullname, role_id, phone) values ('agallemore1o', 'XVVA7Gd', 'Annabelle Gallemore', 1, '805-142-5334');
insert into users (username, password, fullname, role_id, phone) values ('snewlin1p', 'WV1pnKy5E', 'Susann Newlin', 1, '438-853-5382');
insert into users (username, password, fullname, role_id, phone) values ('vwalewski1q', 'XgvfYQdvr4', 'Verile Walewski', 1, '581-963-5811');
insert into users (username, password, fullname, role_id, phone) values ('molivo1r', 'Q8uFtJ8', 'Melisent Olivo', 1, '795-280-2599');
insert into users (username, password, fullname, role_id, phone) values ('jtate1s', 'eHKByq2', 'Johna Tate', 1, '770-182-7143');
insert into users (username, password, fullname, role_id, phone) values ('rbraniff1t', '2Vf62jNOX', 'Rikki Braniff', 1, '584-596-5947');
insert into users (username, password, fullname, role_id, phone) values ('bosmant1u', 'dsYhByVaVm', 'Beau Osmant', 1, '895-870-3436');
insert into users (username, password, fullname, role_id, phone) values ('mwibrew1v', 'PEeVFNnAF', 'Merrick Wibrew', 1, '209-737-8664');
insert into users (username, password, fullname, role_id, phone) values ('rtrevallion1w', 'GiAtVtiBp', 'Randi Trevallion', 1, '149-957-1341');
insert into users (username, password, fullname, role_id, phone) values ('jmarjoram1x', 'cfBTROPc3', 'Jackquelin Marjoram', 1, '567-277-0329');
insert into users (username, password, fullname, role_id, phone) values ('rhaddon1y', 'bINj21dej', 'Ranice Haddon', 1, '440-422-7717');
insert into users (username, password, fullname, role_id, phone) values ('wsharper1z', '0QIZ9a', 'Waldo Sharper', 1, '101-852-3185');
insert into users (username, password, fullname, role_id, phone) values ('ejanes20', 'wZhoWpRW', 'Elvin Janes', 1, '804-549-5210');
insert into users (username, password, fullname, role_id, phone) values ('cgawke21', 'V7l9C8PyyL', 'Candice Gawke', 1, '373-202-0968');
insert into users (username, password, fullname, role_id, phone) values ('krimer22', 'uDYVd0FQS', 'Kandy Rimer', 1, '303-764-6722');
insert into users (username, password, fullname, role_id, phone) values ('jlutzmann23', 'Wjk6e5Np', 'Jedd Lutzmann', 1, '881-674-9574');
insert into users (username, password, fullname, role_id, phone) values ('lgonzalvo24', 'ymlEJjlCBT', 'Lucia Gonzalvo', 1, '690-690-6358');
insert into users (username, password, fullname, role_id, phone) values ('jgallahue25', 'D6BjDQgPg0f', 'Josy Gallahue', 1, '326-369-5173');
insert into users (username, password, fullname, role_id, phone) values ('tcardenoso26', '9BVS2aSFuMq', 'Terrie Cardenoso', 1, '675-893-6969');
insert into users (username, password, fullname, role_id, phone) values ('cmaccosty27', 'KRgOGx6Hx', 'Curcio MacCosty', 1, '842-824-0143');
insert into users (username, password, fullname, role_id, phone) values ('apadbury28', 'bCYNlV', 'Abbe Padbury', 1, '148-853-8415');
insert into users (username, password, fullname, role_id, phone) values ('mhalley29', 'Ba5PCUyWCzrG', 'Marilyn Halley', 1, '884-126-3756');
insert into users (username, password, fullname, role_id, phone) values ('rchevis2a', '9mZAu5gO9gTc', 'Russ Chevis', 1, '106-382-3982');
insert into users (username, password, fullname, role_id, phone) values ('jwindless2b', 'KbnRdCr', 'Jimmy Windless', 1, '419-147-1531');
insert into users (username, password, fullname, role_id, phone) values ('aflores2c', 'i2Ql7O1tgGl', 'Aksel Flores', 1, '603-600-2486');
insert into users (username, password, fullname, role_id, phone) values ('dhunnywell2d', '3pDjrFT2', 'Dominique Hunnywell', 1, '835-358-5639');
insert into users (username, password, fullname, role_id, phone) values ('arikard2e', 'TsTow7w', 'Allard Rikard', 1, '946-338-4780');
insert into users (username, password, fullname, role_id, phone) values ('cstripp2f', 'gcq9J7', 'Cari Stripp', 1, '251-731-2862');
insert into users (username, password, fullname, role_id, phone) values ('kblatchford2g', 'pCE4wYe', 'Klemens Blatchford', 1, '455-361-2938');
insert into users (username, password, fullname, role_id, phone) values ('esells2h', '20n8H3Q', 'Erik Sells', 1, '922-286-7940');
insert into users (username, password, fullname, role_id, phone) values ('hinnett2i', '6ZQCBXm', 'Harriott Innett', 1, '491-476-9021');
insert into users (username, password, fullname, role_id, phone) values ('erogers2j', 'l7WooHKW', 'Evangeline Rogers', 1, '553-308-0556');
insert into users (username, password, fullname, role_id, phone) values ('bfairhall2k', '74znWPQd', 'Bruno Fairhall', 1, '909-160-2313');
insert into users (username, password, fullname, role_id, phone) values ('hrobbie2l', 'fwXNlAv4EO', 'Haskel Robbie', 1, '422-588-5343');
insert into users (username, password, fullname, role_id, phone) values ('npenquet2m', 'LKDEhdt', 'Nerty Penquet', 1, '211-829-8704');
insert into users (username, password, fullname, role_id, phone) values ('ehuck2n', 'APOmvyC', 'Eward Huck', 1, '927-557-5118');
insert into users (username, password, fullname, role_id, phone) values ('nputtick2o', 'be6wPohtaW', 'Neel Puttick', 1, '858-283-6673');
insert into users (username, password, fullname, role_id, phone) values ('mbloom2p', '2M555Ze', 'Meggi Bloom', 1, '217-210-1073');
insert into users (username, password, fullname, role_id, phone) values ('mputson2q', 'zQserL1Lt3K1', 'Merrile Putson', 1, '770-687-5598');
insert into users (username, password, fullname, role_id, phone) values ('abeernaert2r', 'Dv4JtTC5EUY', 'Aristotle Beernaert', 1, '366-263-5787');

insert into routes (route_name, [from], [to], duration) values (N'Chuyến tàu Bắc Nam', 24, 58, 38)
