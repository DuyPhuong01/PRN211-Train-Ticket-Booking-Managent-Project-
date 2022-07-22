CREATE DATABASE [PRN211_PROJECT_TRAIN_TICKET_BOOKING]
GO
USE [PRN211_PROJECT_TRAIN_TICKET_BOOKING]
GO

CREATE TABLE [roles] (
  [role_id] int PRIMARY KEY NOT NULL,
  [role_name] nvarchar(128)
)
GO

CREATE TABLE [users] (
  [user_id] int PRIMARY KEY NOT NULL,
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
  [order_id] int PRIMARY KEY NOT NULL,
  [user_id] int NOT NULL,
  [order_date] datetime,
  [status] int
)
GO

CREATE TABLE [trains] (
  [train_id] int PRIMARY KEY NOT NULL,
  [train_name] varchar(64) NOT NULL
)
GO

CREATE TABLE [carriages] (
  [carriage_id] int PRIMARY KEY NOT NULL,
  [train_id] int NOT NULL,
  [carriage_number] int NOT NULL
)
GO

CREATE TABLE [locations] (
  [location_id] int PRIMARY KEY NOT NULL,
  [location_name] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [routes] (
  [route_id] int PRIMARY KEY NOT NULL,
  [route_name] nvarchar(255),
  [from] int NOT NULL,
  [to] int NOT NULL,
  [duration] int NOT NULL,
  [path] ntext,
  [distance] float
)
GO

CREATE TABLE [trips] (
  [trip_id] int PRIMARY KEY NOT NULL,
  [route_id] int NOT NULL,
  [train_id] int NOT NULL,
  [time] datetime NOT NULL,
)
GO

CREATE TABLE [ticket_types] (
  [type_id] int PRIMARY KEY NOT NULL,
  [type_name] nvarchar(128)
)
GO

CREATE TABLE [ticket_classes] (
  [class_id] int PRIMARY KEY NOT NULL,
  [class_name] nvarchar(128)
)
GO

CREATE TABLE [ticket_prices] (
  [ticket_price_id] int PRIMARY KEY NOT NULL,
  [class_id] int NOT NULL,
  [trip_id] int NOT NULL,
  [price] money NOT NULL
)
GO

CREATE TABLE [tickets] (
  [ticket_id] int PRIMARY KEY NOT NULL,
  [ticket_price_id] int NOT NULL,
  [carriage_id] int NOT NULL,
  [row] varchar(1) NOT NULL,
  [seat] int NOT NULL,
  [status] int NOT NULL,
)
GO

CREATE TABLE [ordered_tickets] (
  [id] int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
  [order_id] int NOT NULL,
  [ticket_id] int NOT NULL,
  [type_id] int NOT NULL,
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

ALTER TABLE [ticket_prices]  WITH CHECK ADD  CONSTRAINT [FK_TicketPrice_TicketClass] FOREIGN KEY ([class_id]) REFERENCES [ticket_classes] ([class_id])
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

ALTER TABLE [ordered_tickets]  WITH CHECK ADD  CONSTRAINT [FK_OrderdTicket_TicketType] FOREIGN KEY ([type_id]) REFERENCES [ticket_types] ([type_id])
GO

insert into trains (train_id, train_name) values (1, 'A088');
insert into trains (train_id, train_name) values (2, 'B705');
insert into trains (train_id, train_name) values (3, 'C352');
insert into trains (train_id, train_name) values (4, 'D451');
insert into trains (train_id, train_name) values (5, 'E721');

insert into carriages (carriage_id, train_id, carriage_number) values (1, 1, 1);
insert into carriages (carriage_id, train_id, carriage_number) values (2, 1, 2);
insert into carriages (carriage_id, train_id, carriage_number) values (3, 1, 3);
insert into carriages (carriage_id, train_id, carriage_number) values (4, 1, 4);
insert into carriages (carriage_id, train_id, carriage_number) values (5, 1, 5);
insert into carriages (carriage_id, train_id, carriage_number) values (6, 2, 1);
insert into carriages (carriage_id, train_id, carriage_number) values (7, 2, 2);
insert into carriages (carriage_id, train_id, carriage_number) values (8, 2, 3);
insert into carriages (carriage_id, train_id, carriage_number) values (9, 2, 4);
insert into carriages (carriage_id, train_id, carriage_number) values (10, 2, 5);
insert into carriages (carriage_id, train_id, carriage_number) values (11, 3, 1);
insert into carriages (carriage_id, train_id, carriage_number) values (12, 3, 2);
insert into carriages (carriage_id, train_id, carriage_number) values (13, 3, 3);
insert into carriages (carriage_id, train_id, carriage_number) values (14, 3, 4);
insert into carriages (carriage_id, train_id, carriage_number) values (15, 3, 5);
insert into carriages (carriage_id, train_id, carriage_number) values (16, 4, 1);
insert into carriages (carriage_id, train_id, carriage_number) values (17, 4, 2);
insert into carriages (carriage_id, train_id, carriage_number) values (18, 4, 3);
insert into carriages (carriage_id, train_id, carriage_number) values (19, 4, 4);
insert into carriages (carriage_id, train_id, carriage_number) values (20, 4, 5);
insert into carriages (carriage_id, train_id, carriage_number) values (21, 5, 1);
insert into carriages (carriage_id, train_id, carriage_number) values (22, 5, 2);
insert into carriages (carriage_id, train_id, carriage_number) values (23, 5, 3);
insert into carriages (carriage_id, train_id, carriage_number) values (24, 5, 4);
insert into carriages (carriage_id, train_id, carriage_number) values (25, 5, 5);

insert into locations (location_id, location_name) values (1, N'An Giang');
insert into locations (location_id, location_name) values (2, N'Bà Rịa – Vũng Tàu');
insert into locations (location_id, location_name) values (3, N'Bắc Giang');
insert into locations (location_id, location_name) values (4, N'Bắc Kạn');
insert into locations (location_id, location_name) values (5, N'Bạc Liêu');
insert into locations (location_id, location_name) values (6, N'Bắc Ninh');
insert into locations (location_id, location_name) values (7, N'Bến Tre');
insert into locations (location_id, location_name) values (8, N'Bình Định');
insert into locations (location_id, location_name) values (9, N'Bình Dương');
insert into locations (location_id, location_name) values (10, N'Bình Phước');
insert into locations (location_id, location_name) values (11, N'Bình Thuận');
insert into locations (location_id, location_name) values (12, N'Cà Mau');
insert into locations (location_id, location_name) values (13, N'Cần Thơ');
insert into locations (location_id, location_name) values (14, N'Cao Bằng');
insert into locations (location_id, location_name) values (15, N'Đà Nẵng');
insert into locations (location_id, location_name) values (16, N'Đắk Lắk');
insert into locations (location_id, location_name) values (17, N'Đắk Nông');
insert into locations (location_id, location_name) values (18, N'Điện Biên');
insert into locations (location_id, location_name) values (19, N'Đồng Nai');
insert into locations (location_id, location_name) values (20, N'Đồng Tháp');
insert into locations (location_id, location_name) values (21, N'Gia Lai');
insert into locations (location_id, location_name) values (22, N'Hà Giang');
insert into locations (location_id, location_name) values (23, N'Hà Nam');
insert into locations (location_id, location_name) values (24, N'Hà Nội');
insert into locations (location_id, location_name) values (25, N'Hà Tĩnh');
insert into locations (location_id, location_name) values (26, N'Hải Dương');
insert into locations (location_id, location_name) values (27, N'Hải Phòng');
insert into locations (location_id, location_name) values (28, N'Hậu Giang');
insert into locations (location_id, location_name) values (29, N'Hòa Bình');
insert into locations (location_id, location_name) values (30, N'Hưng Yên');
insert into locations (location_id, location_name) values (31, N'Khánh Hòa');
insert into locations (location_id, location_name) values (32, N'Kiên Giang');
insert into locations (location_id, location_name) values (33, N'Kon Tum');
insert into locations (location_id, location_name) values (34, N'Lai Châu');
insert into locations (location_id, location_name) values (35, N'Lâm Đồng');
insert into locations (location_id, location_name) values (36, N'Lạng Sơn');
insert into locations (location_id, location_name) values (37, N'Lào Cai');
insert into locations (location_id, location_name) values (38, N'Long An');
insert into locations (location_id, location_name) values (39, N'Nam Định');
insert into locations (location_id, location_name) values (40, N'Nghệ An');
insert into locations (location_id, location_name) values (41, N'Ninh Bình');
insert into locations (location_id, location_name) values (42, N'Ninh Thuận');
insert into locations (location_id, location_name) values (43, N'Phú Thọ');
insert into locations (location_id, location_name) values (44, N'Phú Yên');
insert into locations (location_id, location_name) values (45, N'Quảng Bình');
insert into locations (location_id, location_name) values (46, N'Quảng Nam');
insert into locations (location_id, location_name) values (47, N'Quảng Ngãi');
insert into locations (location_id, location_name) values (48, N'Quảng Ninh');
insert into locations (location_id, location_name) values (49, N'Quảng Trị');
insert into locations (location_id, location_name) values (50, N'Sóc Trăng');
insert into locations (location_id, location_name) values (51, N'Sơn La');
insert into locations (location_id, location_name) values (52, N'Tây Ninh');
insert into locations (location_id, location_name) values (53, N'Thái Bình');
insert into locations (location_id, location_name) values (54, N'Thái Nguyên');
insert into locations (location_id, location_name) values (55, N'Thanh Hóa');
insert into locations (location_id, location_name) values (56, N'Thừa Thiên Huế');
insert into locations (location_id, location_name) values (57, N'Tiền Giang');
insert into locations (location_id, location_name) values (58, N'TP Hồ Chí Minh');
insert into locations (location_id, location_name) values (59, N'Trà Vinh');
insert into locations (location_id, location_name) values (60, N'Tuyên Quang');
insert into locations (location_id, location_name) values (61, N'Vĩnh Long');
insert into locations (location_id, location_name) values (62, N'Vĩnh Phúc');
insert into locations (location_id, location_name) values (63, N'Yên Bái');

insert into roles(role_id, role_name) values (1, 'Customer');
insert into roles(role_id, role_name) values (2, 'Admin');

insert into ticket_types(type_id, type_name) values (1, N'Người lớn');
insert into ticket_types(type_id, type_name) values (2, N'Trẻ con');

insert into ticket_classes(class_id, class_name) values (1, N'Bình thường');
insert into ticket_classes(class_id, class_name) values (2, N'Thương gia');

insert into users (user_id, username, password, fullname, role_id, phone) values (1, 'rkob0', '3SMQS7cx1T', N'Rutherford Kob', 1, '872-498-3594');
insert into users (user_id, username, password, fullname, role_id, phone) values (2, 'bdominico1', 'wH0YFC', N'Benedicto Dominico', 1, '953-721-8253');
insert into users (user_id, username, password, fullname, role_id, phone) values (3, 'unorley2', '5zKFmK', N'Uri Norley', 1, '240-686-8735');
insert into users (user_id, username, password, fullname, role_id, phone) values (4, 'rburkett3', 'mB8JK3J8M', N'Robenia Burkett', 1, '172-289-7352');
insert into users (user_id, username, password, fullname, role_id, phone) values (5, 'ghorburgh4', 'SAI1STcyKotU', N'Grant Horburgh', 1, '428-400-4164');
insert into users (user_id, username, password, fullname, role_id, phone) values (6, 'rjillions5', 'LWCXM2s', N'Ricardo Jillions', 1, '301-178-6565');
insert into users (user_id, username, password, fullname, role_id, phone) values (7, 'fstarten6', 'n9nn5EGk4X', N'Freddie Starten', 1, '381-158-9223');
insert into users (user_id, username, password, fullname, role_id, phone) values (8, 'maltree7', 'Nym5yy5PO', N'Marilin Altree', 1, '423-335-2284');
insert into users (user_id, username, password, fullname, role_id, phone) values (9, 'kcopping8', 'qLKEv76', N'Kaycee Copping', 1, '877-484-4414');
insert into users (user_id, username, password, fullname, role_id, phone) values (10, 'aboydon9', 'Kh965bfG', N'Anett Boydon', 1, '953-249-5913');
insert into users (user_id, username, password, fullname, role_id, phone) values (11, 'ncannona', 'TGHEkrMo2hc', N'Natal Cannon', 1, '637-347-9579');
insert into users (user_id, username, password, fullname, role_id, phone) values (12, 'sbecketb', 'sx4wKhCu', N'Shepperd Becket', 1, '129-835-1082');
insert into users (user_id, username, password, fullname, role_id, phone) values (13, 'nbareheadc', 'Sewe9ih', N'Norrie Barehead', 1, '787-377-5595');
insert into users (user_id, username, password, fullname, role_id, phone) values (14, 'hcharnickd', 'tiaYlwVrd4V', N'Hedvig Charnick', 1, '955-687-7783');
insert into users (user_id, username, password, fullname, role_id, phone) values (15, 'bcantoe', 'zHwyi2', N'Barnie Canto', 1, '313-387-4253');
insert into users (user_id, username, password, fullname, role_id, phone) values (16, 'lverissimof', '8UIFHu', N'Lynette Verissimo', 1, '605-672-5590');
insert into users (user_id, username, password, fullname, role_id, phone) values (17, 'aindgsg', '38HFoTCEz9c', N'Arty Indgs', 1, '963-134-7353');
insert into users (user_id, username, password, fullname, role_id, phone) values (18, 'ayanukh', 'F0PbjSOP', N'Arte Yanuk', 1, '797-661-0875');
insert into users (user_id, username, password, fullname, role_id, phone) values (19, 'fwoodsfordi', 'D2fMygjk', N'Floris Woodsford', 1, '443-916-0820');
insert into users (user_id, username, password, fullname, role_id, phone) values (20, 'kmccreeryj', '48M3gEFUn8', N'Karalynn McCreery', 1, '870-812-2994');
insert into users (user_id, username, password, fullname, role_id, phone) values (21, 'pbanasikk', '98bWsA0A', N'Pascal Banasik', 1, '878-318-7452');
insert into users (user_id, username, password, fullname, role_id, phone) values (22, 'spetfordl', 'ADxfLri8PBWB', N'Silvana Petford', 1, '236-136-0609');
insert into users (user_id, username, password, fullname, role_id, phone) values (23, 'gcorainim', 'wruqnFFCu', N'Gabriela Coraini', 1, '634-200-1712');
insert into users (user_id, username, password, fullname, role_id, phone) values (24, 'alampen', 'YxDFxEL', N'Addi Lampe', 1, '299-637-9367');
insert into users (user_id, username, password, fullname, role_id, phone) values (25, 'llelloo', '5pBKXjruP', N'Lucia Lello', 1, '603-816-9912');
insert into users (user_id, username, password, fullname, role_id, phone) values (26, 'dproctorp', '7SXKWr2k', N'Dermot Proctor', 1, '968-602-3663');
insert into users (user_id, username, password, fullname, role_id, phone) values (27, 'slochheadq', 'FaWl3EO', N'Sharai Lochhead', 1, '867-243-6890');
insert into users (user_id, username, password, fullname, role_id, phone) values (28, 'cclothierr', 'mj4Z2yhif', N'Caprice Clothier', 1, '907-875-0054');
insert into users (user_id, username, password, fullname, role_id, phone) values (29, 'pcottiss', 'QsfB3j', N'Paule Cottis', 1, '785-501-2997');
insert into users (user_id, username, password, fullname, role_id, phone) values (30, 'kcoopt', 'a5MEB4czldlD', N'Krishnah Coop', 1, '567-919-4940');
insert into users (user_id, username, password, fullname, role_id, phone) values (31, 'gmckennyu', 'CfWOtfTkJtD', N'Graham McKenny', 1, '619-527-2463');
insert into users (user_id, username, password, fullname, role_id, phone) values (32, 'wcarruthv', '4enG6HNny', N'Willette Carruth', 1, '950-596-2585');
insert into users (user_id, username, password, fullname, role_id, phone) values (33, 'rturfinw', 'NeruPkAOr9', N'Richmound Turfin', 1, '894-869-5413');
insert into users (user_id, username, password, fullname, role_id, phone) values (34, 'tvassarx', 'cm3NZwi2S', N'Tildy Vassar', 1, '262-214-5475');
insert into users (user_id, username, password, fullname, role_id, phone) values (35, 'gtucky', 'cGfyg603KZ', N'Gwen Tuck', 1, '522-804-5248');
insert into users (user_id, username, password, fullname, role_id, phone) values (36, 'thaffendenz', 'hFrEUxCO', N'Torie Haffenden', 1, '710-617-9160');
insert into users (user_id, username, password, fullname, role_id, phone) values (37, 'ltraill10', 'WZhUeyT', N'Leonelle Traill', 1, '397-113-2526');
insert into users (user_id, username, password, fullname, role_id, phone) values (38, 'ochampe11', 'IEQEO7Xij', N'Olivie Champe', 1, '545-792-4234');
insert into users (user_id, username, password, fullname, role_id, phone) values (39, 'emactavish12', '2bqmAanMXe', N'Eustace MacTavish', 1, '750-438-8741');
insert into users (user_id, username, password, fullname, role_id, phone) values (40, 'ktheobold13', 'mFry26OP', N'Krishnah Theobold', 1, '680-705-4589');
insert into users (user_id, username, password, fullname, role_id, phone) values (41, 'nholson14', '2dJEA7kt', N'Nickey Holson', 1, '150-591-4115');
insert into users (user_id, username, password, fullname, role_id, phone) values (42, 'ptrill15', '0D6vmtE5JkS', N'Pen Trill', 1, '190-894-6903');
insert into users (user_id, username, password, fullname, role_id, phone) values (43, 'ldoxsey16', '18jLh4', N'Leonelle Doxsey', 1, '955-127-7938');
insert into users (user_id, username, password, fullname, role_id, phone) values (44, 'qingerson17', '00N31Bc8', N'Quinton Ingerson', 1, '147-731-3713');
insert into users (user_id, username, password, fullname, role_id, phone) values (45, 'tfairhurst18', 'yc546A', N'Tessie Fairhurst', 1, '822-488-1928');
insert into users (user_id, username, password, fullname, role_id, phone) values (46, 'igorrissen19', 'lpZH2M', N'Ingaborg Gorrissen', 1, '705-646-8375');
insert into users (user_id, username, password, fullname, role_id, phone) values (47, 'npeert1a', 'bpmFkkO', N'Nadine Peert', 1, '286-194-5077');
insert into users (user_id, username, password, fullname, role_id, phone) values (48, 'beaves1b', '1RwPUil4', N'Benny Eaves', 1, '565-148-9949');
insert into users (user_id, username, password, fullname, role_id, phone) values (49, 'cdobbinson1c', '4sDaA77MaOTC', N'Cris Dobbinson', 1, '544-231-4089');
insert into users (user_id, username, password, fullname, role_id, phone) values (50, 'togrowgane1d', 'IA8l9UUx6', N'Trenna O''Growgane', 1, '936-373-9952');
insert into users (user_id, username, password, fullname, role_id, phone) values (51, 'nvan1e', 'jJQ3LHbJ3fii', N'Nerta Van Leijs', 1, '901-309-7121');
insert into users (user_id, username, password, fullname, role_id, phone) values (52, 'dmattioni1f', '2AezNA', N'Denney Mattioni', 1, '123-659-8440');
insert into users (user_id, username, password, fullname, role_id, phone) values (53, 'gmccathy1g', 'nNWpKxH0u', N'Giorgi McCathy', 1, '164-399-2351');
insert into users (user_id, username, password, fullname, role_id, phone) values (54, 'mwadham1h', 'YSQBIc', N'Marna Wadham', 1, '998-439-5213');
insert into users (user_id, username, password, fullname, role_id, phone) values (55, 'jales1i', 'T3Onx9', N'Joe Ales0', 1, '160-495-6915');
insert into users (user_id, username, password, fullname, role_id, phone) values (56, 'csmoughton1j', 'BHRHuWcV', N'Claudette Smoughton', 1, '497-824-5171');
insert into users (user_id, username, password, fullname, role_id, phone) values (57, 'lhefner1k', '7ZgQDe6', N'Lucy Hefner', 1, '774-910-9845');
insert into users (user_id, username, password, fullname, role_id, phone) values (58, 'cclarae1l', 'U2rRRcxmyrtH', N'Chas Clarae', 1, '985-242-7393');
insert into users (user_id, username, password, fullname, role_id, phone) values (59, 'kchevins1m', 'Qis7fMdFG', N'Kaylil Chevins', 1, '809-604-1311');
insert into users (user_id, username, password, fullname, role_id, phone) values (60, 'cashment1n', 'uISRFkE', N'Cordey Ashment', 1, '274-202-2736');
insert into users (user_id, username, password, fullname, role_id, phone) values (61, 'sdabernott1o', 'yiwykGyb', N'Steffane Dabernott', 1, '631-175-2697');
insert into users (user_id, username, password, fullname, role_id, phone) values (62, 'vkiggel1p', '6PT7tJ1x', N'Vanya Kiggel', 1, '484-390-9977');
insert into users (user_id, username, password, fullname, role_id, phone) values (63, 'rmoores1q', 'wPLLxslJEd', N'Rodi Moores', 1, '312-509-7677');
insert into users (user_id, username, password, fullname, role_id, phone) values (64, 'arumgay1r', 'jS9oCNOcz', N'Asia Rumgay', 1, '941-430-8914');
insert into users (user_id, username, password, fullname, role_id, phone) values (65, 'hcaslett1s', 'ogJl5d', N'Hakim Caslett', 1, '413-414-7697');
insert into users (user_id, username, password, fullname, role_id, phone) values (66, 'wpiggins1t', '1AAGQ0G6oSq', N'Willyt Piggins', 1, '917-928-3702');
insert into users (user_id, username, password, fullname, role_id, phone) values (67, 'ashew1u', 'Whs3FNTOBi', N'Alvie Shew', 1, '609-721-0741');
insert into users (user_id, username, password, fullname, role_id, phone) values (68, 'klavarack1v', 'MdjNVWo', N'Katerina Lavarack', 1, '607-263-1084');
insert into users (user_id, username, password, fullname, role_id, phone) values (69, 'dtodari1w', '870pVlha6rl', N'Devinne Todari', 1, '604-919-8662');
insert into users (user_id, username, password, fullname, role_id, phone) values (70, 'jblackborne1x', 'IcyHajPtYJ', N'Janifer Blackborne', 1, '722-921-5578');
insert into users (user_id, username, password, fullname, role_id, phone) values (71, 'ablasoni1y', 'uXK2dt', N'Almira Blasoni', 1, '507-927-8865');
insert into users (user_id, username, password, fullname, role_id, phone) values (72, 'vainley1z', 'rcxvJXBb', N'Veda Ainley', 1, '340-656-9731');
insert into users (user_id, username, password, fullname, role_id, phone) values (73, 'aphethean20', 'JjtJyZZS1zhb', N'Arleen Phethean', 1, '450-762-7096');
insert into users (user_id, username, password, fullname, role_id, phone) values (74, 'aaujouanet21', 'kt6UpeBa', N'Aloise Aujouanet', 1, '745-354-2781');
insert into users (user_id, username, password, fullname, role_id, phone) values (75, 'leasen22', 'xYn3jM00A7e', N'Lindsey Easen', 1, '928-718-8149');
insert into users (user_id, username, password, fullname, role_id, phone) values (76, 'ekitter23', 'u4aVRESETa49', N'Erasmus Kitter', 1, '728-277-3394');
insert into users (user_id, username, password, fullname, role_id, phone) values (77, 'heddies24', 'hgxQ9Qb2V', N'Hildy Eddies', 1, '271-100-4254');
insert into users (user_id, username, password, fullname, role_id, phone) values (78, 'lcondict25', 'RBT6JKs', N'Lita Condict', 1, '638-796-5272');
insert into users (user_id, username, password, fullname, role_id, phone) values (79, 'nkitteman26', 'GUofGOuT64', N'Nanette Kitteman', 1, '385-747-7103');
insert into users (user_id, username, password, fullname, role_id, phone) values (80, 'mquantick27', 'ttf1iBk', N'Marjy Quantick', 1, '913-880-8263');
insert into users (user_id, username, password, fullname, role_id, phone) values (81, 'bpetrasek28', 'nNs2wOi', N'Braden Petrasek', 1, '770-424-0640');
insert into users (user_id, username, password, fullname, role_id, phone) values (82, 'afearnill29', 'ftBzb7', N'Averil Fearnill', 1, '946-590-0453');
insert into users (user_id, username, password, fullname, role_id, phone) values (83, 'hhirtzmann2a', 'VAzCFU42HmP3', N'Hewett Hirtzmann', 1, '259-369-1673');
insert into users (user_id, username, password, fullname, role_id, phone) values (84, 'awilber2b', '2IAMaznx', N'Allsun Wilber', 1, '150-425-8650');
insert into users (user_id, username, password, fullname, role_id, phone) values (85, 'cpurver2c', 'UjDq1AB', N'Cassandry Purver', 1, '452-732-9231');
insert into users (user_id, username, password, fullname, role_id, phone) values (86, 'ascandroot2d', 'cp483h5C', N'Angele Scandroot', 1, '971-815-3584');
insert into users (user_id, username, password, fullname, role_id, phone) values (87, 'cgeal2e', 'zuJkGMW', N'Chlo Geal', 1, '544-304-5249');
insert into users (user_id, username, password, fullname, role_id, phone) values (88, 'icrat2f', 'mBubAxvoAajI', N'Ignacius Crat', 1, '644-571-9215');
insert into users (user_id, username, password, fullname, role_id, phone) values (89, 'cembleton2g', 'TU0xpzkn46', N'Chris Embleton', 1, '713-248-5914');
insert into users (user_id, username, password, fullname, role_id, phone) values (90, 'rspatarul2h', 'QyWFRGP', N'Rodrigo Spatarul', 1, '660-973-5866');
insert into users (user_id, username, password, fullname, role_id, phone) values (91, 'blindell2i', '01Rn7hk', N'Bogey Lindell', 1, '704-581-8173');
insert into users (user_id, username, password, fullname, role_id, phone) values (92, 'harmatys2j', 'F2rOUbLcz0', N'Haven Armatys', 1, '483-870-5542');
insert into users (user_id, username, password, fullname, role_id, phone) values (93, 'ldonaghie2k', 'DHKO5Te', N'Lawry Donaghie', 1, '396-405-2069');
insert into users (user_id, username, password, fullname, role_id, phone) values (94, 'dstonman2l', '6Ev7xUOuQvcG', N'Dagny Stonman', 1, '701-666-8974');
insert into users (user_id, username, password, fullname, role_id, phone) values (95, 'bwymer2m', 'ZX5v2oOxIupz', N'Bay Wymer', 1, '795-642-1748');
insert into users (user_id, username, password, fullname, role_id, phone) values (96, 'pdregan2n', 'hhdutAFKg', N'Phedra Dregan', 1, '786-867-5977');
insert into users (user_id, username, password, fullname, role_id, phone) values (97, 'dhehir2o', 'Ogpv0MK', N'Derwin Hehir', 1, '336-988-1582');
insert into users (user_id, username, password, fullname, role_id, phone) values (98, 'apitford2p', 'cuowxefwQB', N'Alexandrina Pitford', 1, '285-601-0115');
insert into users (user_id, username, password, fullname, role_id, phone) values (99, 'tdumbreck2q', 'HCCMIyc7I3', N'Terence Dumbreck', 1, '420-898-1961');
insert into users (user_id, username, password, fullname, role_id, phone) values (100, 'jbasketter2r', 'r38e6Zd', N'Janith Basketter', 1, '636-738-7688');

insert into routes (route_id, route_name, [from], [to], duration) values (1, N'Chuyến tàu Bắc Nam', 24, 58, 38)
insert into routes (route_id, route_name, [from], [to], duration) values (2, N'McCullough-Wolff', 50, 3, 22);
insert into routes (route_id, route_name, [from], [to], duration) values (3, N'Hettinger, Pacocha and Koch', 35, 13, 10);
insert into routes (route_id, route_name, [from], [to], duration) values (4, N'Russel, Wehner and Mertz', 56, 55, 24);
insert into routes (route_id, route_name, [from], [to], duration) values (5, N'Zboncak, Homenick and Paucek', 18, 30, 35);
insert into routes (route_id, route_name, [from], [to], duration) values (6, N'Langworth, Lueilwitz and Lakin', 54, 27, 29);
insert into routes (route_id, route_name, [from], [to], duration) values (7, N'Emard, D''Amore and Kuhlman', 52, 38, 11);
insert into routes (route_id, route_name, [from], [to], duration) values (8, N'Green and Sons', 27, 40, 23);
insert into routes (route_id, route_name, [from], [to], duration) values (9, N'Bruen-Collins', 8, 11, 15);
insert into routes (route_id, route_name, [from], [to], duration) values (10, N'Langosh Inc', 11, 16, 10);
insert into routes (route_id, route_name, [from], [to], duration) values (11, N'Corkery, Hermiston and Bailey', 40, 38, 8);
insert into routes (route_id, route_name, [from], [to], duration) values (12, N'Harber-Osinski', 19, 49, 22);
insert into routes (route_id, route_name, [from], [to], duration) values (13, N'Hansen-Toy', 14, 28, 36);
insert into routes (route_id, route_name, [from], [to], duration) values (14, N'Jacobs-Block', 45, 54, 1);
insert into routes (route_id, route_name, [from], [to], duration) values (15, N'Denesik-Emard', 63, 56, 26);
insert into routes (route_id, route_name, [from], [to], duration) values (16, N'Frami-Nitzsche', 28, 37, 21);
insert into routes (route_id, route_name, [from], [to], duration) values (17, N'Frami, Zboncak and Crooks', 5, 5, 14);
insert into routes (route_id, route_name, [from], [to], duration) values (18, N'Hodkiewicz, Schinner and Bernier', 54, 57, 27);
insert into routes (route_id, route_name, [from], [to], duration) values (19, N'Thiel, Barrows and Wisoky', 40, 32, 40);
insert into routes (route_id, route_name, [from], [to], duration) values (20, N'Gutmann, Hermiston and Feeney', 41, 48, 12);
insert into routes (route_id, route_name, [from], [to], duration) values (21, N'Abshire and Sons', 14, 52, 28);
insert into routes (route_id, route_name, [from], [to], duration) values (22, N'Denesik Group', 12, 15, 30);
insert into routes (route_id, route_name, [from], [to], duration) values (23, N'Auer-Marks', 53, 26, 29);
insert into routes (route_id, route_name, [from], [to], duration) values (24, N'Sipes-Crist', 40, 8, 20);
insert into routes (route_id, route_name, [from], [to], duration) values (25, N'O''Hara and Sons', 22, 16, 24);
insert into routes (route_id, route_name, [from], [to], duration) values (26, N'Grant, Zieme and Bogan', 7, 8, 9);
insert into routes (route_id, route_name, [from], [to], duration) values (27, N'Wolf LLC', 59, 28, 16);
insert into routes (route_id, route_name, [from], [to], duration) values (28, N'Kulas-Brown', 21, 38, 40);
insert into routes (route_id, route_name, [from], [to], duration) values (29, N'Bashirian, Kovacek and Feil', 40, 2, 35);
insert into routes (route_id, route_name, [from], [to], duration) values (30, N'Kautzer LLC', 31, 27, 31);
insert into routes (route_id, route_name, [from], [to], duration) values (31, N'Schmidt, Johns and Turner', 59, 37, 40);
insert into routes (route_id, route_name, [from], [to], duration) values (32, N'Lind, Kozey and Corwin', 14, 44, 37);
insert into routes (route_id, route_name, [from], [to], duration) values (33, N'Senger, Rath and Crona', 10, 3, 18);
insert into routes (route_id, route_name, [from], [to], duration) values (34, N'Veum-Schmidt', 42, 6, 32);
insert into routes (route_id, route_name, [from], [to], duration) values (35, N'Stamm, Padberg and Keeling', 17, 20, 4);
insert into routes (route_id, route_name, [from], [to], duration) values (36, N'Gleichner-Kris', 29, 52, 12);
insert into routes (route_id, route_name, [from], [to], duration) values (37, N'McGlynn LLC', 40, 28, 23);
insert into routes (route_id, route_name, [from], [to], duration) values (38, N'Waelchi-Schuster', 26, 63, 9);
insert into routes (route_id, route_name, [from], [to], duration) values (39, N'Terry LLC', 16, 16, 39);
insert into routes (route_id, route_name, [from], [to], duration) values (40, N'Hauck-Feil', 34, 27, 33);
insert into routes (route_id, route_name, [from], [to], duration) values (41, N'Dach Inc', 32, 27, 37);
insert into routes (route_id, route_name, [from], [to], duration) values (42, N'Buckridge-Lang', 46, 13, 37);
insert into routes (route_id, route_name, [from], [to], duration) values (43, N'Morar-Hudson', 55, 60, 16);
insert into routes (route_id, route_name, [from], [to], duration) values (44, N'Mraz and Sons', 33, 53, 27);
insert into routes (route_id, route_name, [from], [to], duration) values (45, N'Kovacek Group', 40, 56, 17);
insert into routes (route_id, route_name, [from], [to], duration) values (46, N'Zemlak Group', 26, 21, 33);
insert into routes (route_id, route_name, [from], [to], duration) values (47, N'Jast LLC', 9, 7, 9);
insert into routes (route_id, route_name, [from], [to], duration) values (48, N'Christiansen LLC', 6, 53, 22);
insert into routes (route_id, route_name, [from], [to], duration) values (49, N'Prosacco, Feest and Cormier', 62, 24, 34);
insert into routes (route_id, route_name, [from], [to], duration) values (50, N'Rohan-Stark', 8, 25, 7);
insert into routes (route_id, route_name, [from], [to], duration) values (51, N'Gaylord, Harber and Hudson', 3, 44, 23);
insert into routes (route_id, route_name, [from], [to], duration) values (52, N'Veum, Langosh and Wuckert', 61, 1, 18);
insert into routes (route_id, route_name, [from], [to], duration) values (53, N'Cartwright, Reilly and Nikolaus', 33, 4, 37);
insert into routes (route_id, route_name, [from], [to], duration) values (54, N'Cassin, Satterfield and Bernhard', 36, 5, 10);
insert into routes (route_id, route_name, [from], [to], duration) values (55, N'Wisozk-Thompson', 13, 42, 21);
insert into routes (route_id, route_name, [from], [to], duration) values (56, N'Towne, Williamson and Pfannerstill', 14, 57, 24);
insert into routes (route_id, route_name, [from], [to], duration) values (57, N'Romaguera, Reilly and Senger', 34, 2, 6);
insert into routes (route_id, route_name, [from], [to], duration) values (58, N'Walter Inc', 13, 24, 40);
insert into routes (route_id, route_name, [from], [to], duration) values (59, N'Kulas-Feest', 33, 58, 21);
insert into routes (route_id, route_name, [from], [to], duration) values (60, N'Pacocha and Sons', 1, 48, 16);
insert into routes (route_id, route_name, [from], [to], duration) values (61, N'Boyer LLC', 52, 45, 10);
insert into routes (route_id, route_name, [from], [to], duration) values (62, N'Murphy and Sons', 52, 10, 14);
insert into routes (route_id, route_name, [from], [to], duration) values (63, N'Nitzsche-Bernier', 33, 8, 1);
insert into routes (route_id, route_name, [from], [to], duration) values (64, N'Carroll, Leffler and Gislason', 63, 21, 27);
insert into routes (route_id, route_name, [from], [to], duration) values (65, N'MacGyver-Macejkovic', 48, 50, 33);
insert into routes (route_id, route_name, [from], [to], duration) values (66, N'Feil, Heller and Dietrich', 22, 16, 33);
insert into routes (route_id, route_name, [from], [to], duration) values (67, N'Kuhic-Kunze', 24, 5, 35);
insert into routes (route_id, route_name, [from], [to], duration) values (68, N'Bogisich Group', 21, 58, 12);
insert into routes (route_id, route_name, [from], [to], duration) values (69, N'Feeney-Harber', 29, 40, 15);
insert into routes (route_id, route_name, [from], [to], duration) values (70, N'Littel, Koss and Stehr', 15, 57, 3);
insert into routes (route_id, route_name, [from], [to], duration) values (71, N'Jacobson, Bruen and Nitzsche', 32, 27, 15);
insert into routes (route_id, route_name, [from], [to], duration) values (72, N'McClure, McDermott and Muller', 19, 11, 29);
insert into routes (route_id, route_name, [from], [to], duration) values (73, N'Marvin, Veum and Bergstrom', 27, 4, 1);
insert into routes (route_id, route_name, [from], [to], duration) values (74, N'Zieme Inc', 55, 61, 35);
insert into routes (route_id, route_name, [from], [to], duration) values (75, N'Langosh LLC', 50, 15, 39);
insert into routes (route_id, route_name, [from], [to], duration) values (76, N'Bahringer Group', 19, 49, 1);
insert into routes (route_id, route_name, [from], [to], duration) values (77, N'Hand-Sawayn', 23, 4, 6);
insert into routes (route_id, route_name, [from], [to], duration) values (78, N'Johnston, Hoeger and Hyatt', 60, 54, 15);
insert into routes (route_id, route_name, [from], [to], duration) values (79, N'VonRueden, Wolff and Bode', 51, 30, 29);
insert into routes (route_id, route_name, [from], [to], duration) values (80, N'Feil, Skiles and Collins', 21, 11, 10);
insert into routes (route_id, route_name, [from], [to], duration) values (81, N'Hudson, Doyle and Muller', 16, 46, 7);
insert into routes (route_id, route_name, [from], [to], duration) values (82, N'Kuphal-Jakubowski', 59, 49, 32);
insert into routes (route_id, route_name, [from], [to], duration) values (83, N'Mann Inc', 42, 30, 27);
insert into routes (route_id, route_name, [from], [to], duration) values (84, N'Shields, Cremin and Quigley', 42, 29, 23);
insert into routes (route_id, route_name, [from], [to], duration) values (85, N'Marquardt LLC', 56, 16, 23);
insert into routes (route_id, route_name, [from], [to], duration) values (86, N'Heidenreich, Lehner and Dach', 60, 8, 30);
insert into routes (route_id, route_name, [from], [to], duration) values (87, N'Stroman Group', 22, 9, 33);
insert into routes (route_id, route_name, [from], [to], duration) values (88, N'Gerhold, Schiller and Fritsch', 5, 59, 15);
insert into routes (route_id, route_name, [from], [to], duration) values (89, N'Kertzmann LLC', 50, 33, 28);
insert into routes (route_id, route_name, [from], [to], duration) values (90, N'Mueller, Stroman and Funk', 6, 55, 2);
insert into routes (route_id, route_name, [from], [to], duration) values (91, N'Murazik and Sons', 49, 35, 40);
insert into routes (route_id, route_name, [from], [to], duration) values (92, N'Turcotte, Kuhic and Kassulke', 13, 19, 9);
insert into routes (route_id, route_name, [from], [to], duration) values (93, N'Hermann Group', 39, 51, 39);
insert into routes (route_id, route_name, [from], [to], duration) values (94, N'Mitchell Inc', 48, 11, 18);
insert into routes (route_id, route_name, [from], [to], duration) values (95, N'Kuhic-Hyatt', 19, 50, 26);
insert into routes (route_id, route_name, [from], [to], duration) values (96, N'Greenholt LLC', 30, 52, 18);
insert into routes (route_id, route_name, [from], [to], duration) values (97, N'Cummerata, Okuneva and Kub', 11, 26, 22);
insert into routes (route_id, route_name, [from], [to], duration) values (98, N'Waters Group', 5, 6, 10);
insert into routes (route_id, route_name, [from], [to], duration) values (99, N'Hermann-Wilderman', 47, 62, 12);
insert into routes (route_id, route_name, [from], [to], duration) values (100, N'Rodriguez and Sons', 22, 18, 2);

insert into trips (trip_id, route_id, train_id, time) values (1, 79, 1, '2022-01-22 03:29:22');
insert into trips (trip_id, route_id, train_id, time) values (2, 45, 3, '2021-10-30 08:21:46');
insert into trips (trip_id, route_id, train_id, time) values (3, 5, 5, '2022-03-25 08:25:32');
insert into trips (trip_id, route_id, train_id, time) values (4, 78, 5, '2022-06-12 22:32:15');
insert into trips (trip_id, route_id, train_id, time) values (5, 49, 4, '2022-05-25 16:05:31');
insert into trips (trip_id, route_id, train_id, time) values (6, 45, 4, '2021-10-14 21:38:56');
insert into trips (trip_id, route_id, train_id, time) values (7, 16, 5, '2021-08-09 11:04:02');
insert into trips (trip_id, route_id, train_id, time) values (8, 71, 4, '2022-07-20 03:35:51');
insert into trips (trip_id, route_id, train_id, time) values (9, 68, 3, '2022-06-29 06:48:56');
insert into trips (trip_id, route_id, train_id, time) values (10, 54, 1, '2022-07-19 21:13:18');
insert into trips (trip_id, route_id, train_id, time) values (11, 3, 3, '2022-04-13 04:07:15');
insert into trips (trip_id, route_id, train_id, time) values (12, 95, 2, '2021-09-08 14:46:33');
insert into trips (trip_id, route_id, train_id, time) values (13, 11, 5, '2021-08-29 17:02:12');
insert into trips (trip_id, route_id, train_id, time) values (14, 58, 2, '2022-04-03 15:30:57');
insert into trips (trip_id, route_id, train_id, time) values (15, 56, 1, '2021-12-01 05:17:17');
insert into trips (trip_id, route_id, train_id, time) values (16, 66, 4, '2021-08-02 09:10:58');
insert into trips (trip_id, route_id, train_id, time) values (17, 23, 5, '2022-03-15 22:32:13');
insert into trips (trip_id, route_id, train_id, time) values (18, 50, 2, '2022-06-08 02:31:37');
insert into trips (trip_id, route_id, train_id, time) values (19, 5, 5, '2022-01-05 13:29:33');
insert into trips (trip_id, route_id, train_id, time) values (20, 92, 5, '2022-02-23 09:41:13');
insert into trips (trip_id, route_id, train_id, time) values (21, 47, 3, '2021-08-28 01:43:26');
insert into trips (trip_id, route_id, train_id, time) values (22, 35, 3, '2022-06-16 21:18:21');
insert into trips (trip_id, route_id, train_id, time) values (23, 77, 2, '2021-08-22 04:43:46');
insert into trips (trip_id, route_id, train_id, time) values (24, 81, 2, '2022-05-17 16:46:24');
insert into trips (trip_id, route_id, train_id, time) values (25, 93, 5, '2022-06-29 19:53:22');
insert into trips (trip_id, route_id, train_id, time) values (26, 99, 1, '2021-08-22 17:57:30');
insert into trips (trip_id, route_id, train_id, time) values (27, 23, 1, '2021-08-12 18:58:46');
insert into trips (trip_id, route_id, train_id, time) values (28, 62, 4, '2022-07-29 06:35:25');
insert into trips (trip_id, route_id, train_id, time) values (29, 53, 3, '2022-02-19 23:19:36');
insert into trips (trip_id, route_id, train_id, time) values (30, 14, 1, '2021-08-12 07:35:15');
insert into trips (trip_id, route_id, train_id, time) values (31, 97, 1, '2022-05-24 07:52:25');
insert into trips (trip_id, route_id, train_id, time) values (32, 30, 3, '2021-08-13 22:57:46');
insert into trips (trip_id, route_id, train_id, time) values (33, 67, 2, '2021-11-02 04:59:27');
insert into trips (trip_id, route_id, train_id, time) values (34, 51, 1, '2021-07-15 13:07:06');
insert into trips (trip_id, route_id, train_id, time) values (35, 28, 4, '2021-09-14 06:29:07');
insert into trips (trip_id, route_id, train_id, time) values (36, 52, 3, '2022-01-01 08:00:58');
insert into trips (trip_id, route_id, train_id, time) values (37, 26, 3, '2022-01-25 22:43:23');
insert into trips (trip_id, route_id, train_id, time) values (38, 20, 3, '2021-12-21 23:02:26');
insert into trips (trip_id, route_id, train_id, time) values (39, 86, 4, '2021-12-30 04:35:50');
insert into trips (trip_id, route_id, train_id, time) values (40, 33, 4, '2021-08-12 17:29:26');
insert into trips (trip_id, route_id, train_id, time) values (41, 49, 3, '2021-08-18 18:55:53');
insert into trips (trip_id, route_id, train_id, time) values (42, 11, 3, '2022-07-26 00:41:03');
insert into trips (trip_id, route_id, train_id, time) values (43, 45, 4, '2021-09-07 05:15:59');
insert into trips (trip_id, route_id, train_id, time) values (44, 91, 5, '2021-11-05 11:30:43');
insert into trips (trip_id, route_id, train_id, time) values (45, 9, 1, '2022-05-05 11:49:19');
insert into trips (trip_id, route_id, train_id, time) values (46, 59, 5, '2021-09-05 11:48:03');
insert into trips (trip_id, route_id, train_id, time) values (47, 9, 5, '2021-08-19 02:30:53');
insert into trips (trip_id, route_id, train_id, time) values (48, 36, 5, '2022-02-18 22:40:31');
insert into trips (trip_id, route_id, train_id, time) values (49, 31, 3, '2022-02-16 01:56:40');
insert into trips (trip_id, route_id, train_id, time) values (50, 97, 5, '2022-04-11 13:33:03');
insert into trips (trip_id, route_id, train_id, time) values (51, 44, 4, '2022-01-16 19:12:04');
insert into trips (trip_id, route_id, train_id, time) values (52, 18, 2, '2021-08-10 17:22:27');
insert into trips (trip_id, route_id, train_id, time) values (53, 83, 4, '2022-02-27 18:31:31');
insert into trips (trip_id, route_id, train_id, time) values (54, 72, 1, '2021-08-29 10:35:57');
insert into trips (trip_id, route_id, train_id, time) values (55, 39, 3, '2022-07-22 15:44:20');
insert into trips (trip_id, route_id, train_id, time) values (56, 26, 1, '2022-03-09 15:16:55');
insert into trips (trip_id, route_id, train_id, time) values (57, 30, 1, '2022-06-01 14:21:29');
insert into trips (trip_id, route_id, train_id, time) values (58, 83, 4, '2021-09-19 02:13:41');
insert into trips (trip_id, route_id, train_id, time) values (59, 65, 2, '2022-01-23 04:34:30');
insert into trips (trip_id, route_id, train_id, time) values (60, 95, 3, '2022-05-21 17:35:30');
insert into trips (trip_id, route_id, train_id, time) values (61, 23, 1, '2022-07-17 21:00:44');
insert into trips (trip_id, route_id, train_id, time) values (62, 11, 3, '2022-01-13 00:15:27');
insert into trips (trip_id, route_id, train_id, time) values (63, 12, 5, '2022-04-29 02:41:53');
insert into trips (trip_id, route_id, train_id, time) values (64, 52, 2, '2022-06-05 14:49:47');
insert into trips (trip_id, route_id, train_id, time) values (65, 39, 3, '2021-07-15 06:55:17');
insert into trips (trip_id, route_id, train_id, time) values (66, 48, 1, '2021-12-10 23:46:41');
insert into trips (trip_id, route_id, train_id, time) values (67, 3, 5, '2021-09-19 06:09:36');
insert into trips (trip_id, route_id, train_id, time) values (68, 87, 2, '2021-11-28 00:14:30');
insert into trips (trip_id, route_id, train_id, time) values (69, 28, 5, '2022-05-04 05:11:44');
insert into trips (trip_id, route_id, train_id, time) values (70, 30, 1, '2022-06-15 11:30:54');
insert into trips (trip_id, route_id, train_id, time) values (71, 77, 4, '2022-02-10 05:56:51');
insert into trips (trip_id, route_id, train_id, time) values (72, 51, 1, '2022-04-01 17:38:18');
insert into trips (trip_id, route_id, train_id, time) values (73, 89, 2, '2022-05-22 11:49:07');
insert into trips (trip_id, route_id, train_id, time) values (74, 56, 2, '2021-12-07 03:40:03');
insert into trips (trip_id, route_id, train_id, time) values (75, 59, 3, '2022-03-11 06:25:54');
insert into trips (trip_id, route_id, train_id, time) values (76, 38, 5, '2022-07-22 15:41:26');
insert into trips (trip_id, route_id, train_id, time) values (77, 8, 5, '2021-12-29 05:30:06');
insert into trips (trip_id, route_id, train_id, time) values (78, 81, 1, '2022-02-14 03:30:14');
insert into trips (trip_id, route_id, train_id, time) values (79, 3, 2, '2022-03-05 09:06:35');
insert into trips (trip_id, route_id, train_id, time) values (80, 37, 2, '2021-10-14 04:01:14');
insert into trips (trip_id, route_id, train_id, time) values (81, 64, 2, '2022-02-02 23:46:09');
insert into trips (trip_id, route_id, train_id, time) values (82, 62, 1, '2021-09-13 20:00:06');
insert into trips (trip_id, route_id, train_id, time) values (83, 11, 4, '2021-09-17 20:21:36');
insert into trips (trip_id, route_id, train_id, time) values (84, 18, 1, '2021-10-05 11:49:28');
insert into trips (trip_id, route_id, train_id, time) values (85, 17, 1, '2021-12-19 11:01:03');
insert into trips (trip_id, route_id, train_id, time) values (86, 63, 5, '2021-07-29 09:08:38');
insert into trips (trip_id, route_id, train_id, time) values (87, 19, 3, '2022-02-01 02:13:35');
insert into trips (trip_id, route_id, train_id, time) values (88, 24, 3, '2021-12-31 22:03:50');
insert into trips (trip_id, route_id, train_id, time) values (89, 21, 4, '2021-10-15 18:18:21');
insert into trips (trip_id, route_id, train_id, time) values (90, 44, 1, '2021-08-12 01:58:24');
insert into trips (trip_id, route_id, train_id, time) values (91, 87, 5, '2022-06-20 09:47:46');
insert into trips (trip_id, route_id, train_id, time) values (92, 66, 3, '2021-10-05 11:17:04');
insert into trips (trip_id, route_id, train_id, time) values (93, 35, 3, '2022-04-26 07:03:11');
insert into trips (trip_id, route_id, train_id, time) values (94, 43, 5, '2022-03-08 15:54:57');
insert into trips (trip_id, route_id, train_id, time) values (95, 59, 1, '2021-09-29 13:08:19');
insert into trips (trip_id, route_id, train_id, time) values (96, 62, 1, '2022-01-20 04:32:49');
insert into trips (trip_id, route_id, train_id, time) values (97, 22, 4, '2022-03-22 22:03:16');
insert into trips (trip_id, route_id, train_id, time) values (98, 63, 1, '2021-08-15 09:13:05');
insert into trips (trip_id, route_id, train_id, time) values (99, 60, 1, '2022-05-01 05:36:54');
insert into trips (trip_id, route_id, train_id, time) values (100, 28, 2, '2022-02-23 18:05:06');
insert into trips (trip_id, route_id, train_id, time) values (101, 55, 4, '2022-07-13 05:17:54');
insert into trips (trip_id, route_id, train_id, time) values (102, 76, 4, '2022-07-13 14:30:28');
insert into trips (trip_id, route_id, train_id, time) values (103, 69, 3, '2021-09-18 19:02:17');
insert into trips (trip_id, route_id, train_id, time) values (104, 67, 5, '2022-06-02 02:00:57');
insert into trips (trip_id, route_id, train_id, time) values (105, 42, 1, '2021-07-24 09:03:21');
insert into trips (trip_id, route_id, train_id, time) values (106, 6, 2, '2022-04-15 03:46:20');
insert into trips (trip_id, route_id, train_id, time) values (107, 91, 4, '2021-12-08 16:32:38');
insert into trips (trip_id, route_id, train_id, time) values (108, 22, 2, '2022-04-09 16:16:00');
insert into trips (trip_id, route_id, train_id, time) values (109, 72, 3, '2022-02-14 19:01:21');
insert into trips (trip_id, route_id, train_id, time) values (110, 23, 3, '2022-05-24 04:49:16');
insert into trips (trip_id, route_id, train_id, time) values (111, 79, 4, '2022-06-20 11:38:25');
insert into trips (trip_id, route_id, train_id, time) values (112, 14, 4, '2021-08-06 22:52:00');
insert into trips (trip_id, route_id, train_id, time) values (113, 79, 1, '2022-03-01 05:09:15');
insert into trips (trip_id, route_id, train_id, time) values (114, 59, 2, '2021-09-15 07:07:09');
insert into trips (trip_id, route_id, train_id, time) values (115, 23, 5, '2022-02-24 12:23:02');
insert into trips (trip_id, route_id, train_id, time) values (116, 100, 4, '2021-12-24 15:35:27');
insert into trips (trip_id, route_id, train_id, time) values (117, 93, 1, '2022-05-28 23:09:48');
insert into trips (trip_id, route_id, train_id, time) values (118, 25, 3, '2022-03-01 11:55:07');
insert into trips (trip_id, route_id, train_id, time) values (119, 29, 2, '2022-04-29 03:57:51');
insert into trips (trip_id, route_id, train_id, time) values (120, 74, 3, '2022-01-13 15:36:47');
insert into trips (trip_id, route_id, train_id, time) values (121, 59, 5, '2021-09-26 04:14:28');
insert into trips (trip_id, route_id, train_id, time) values (122, 53, 4, '2022-06-19 23:26:38');
insert into trips (trip_id, route_id, train_id, time) values (123, 15, 1, '2022-01-08 21:47:24');
insert into trips (trip_id, route_id, train_id, time) values (124, 51, 5, '2021-08-07 06:21:46');
insert into trips (trip_id, route_id, train_id, time) values (125, 70, 5, '2022-04-19 11:10:33');
insert into trips (trip_id, route_id, train_id, time) values (126, 80, 4, '2022-07-12 08:10:11');
insert into trips (trip_id, route_id, train_id, time) values (127, 20, 3, '2022-01-19 15:29:53');
insert into trips (trip_id, route_id, train_id, time) values (128, 90, 2, '2022-04-17 23:17:04');
insert into trips (trip_id, route_id, train_id, time) values (129, 99, 5, '2022-04-28 11:13:45');
insert into trips (trip_id, route_id, train_id, time) values (130, 73, 4, '2021-11-16 07:58:48');
insert into trips (trip_id, route_id, train_id, time) values (131, 33, 4, '2021-08-07 22:23:48');
insert into trips (trip_id, route_id, train_id, time) values (132, 22, 5, '2021-09-07 17:20:45');
insert into trips (trip_id, route_id, train_id, time) values (133, 12, 5, '2022-06-09 17:35:08');
insert into trips (trip_id, route_id, train_id, time) values (134, 61, 1, '2021-09-22 08:16:20');
insert into trips (trip_id, route_id, train_id, time) values (135, 51, 5, '2021-10-26 09:29:26');
insert into trips (trip_id, route_id, train_id, time) values (136, 100, 3, '2021-11-08 15:18:01');
insert into trips (trip_id, route_id, train_id, time) values (137, 26, 4, '2022-03-28 05:45:41');
insert into trips (trip_id, route_id, train_id, time) values (138, 67, 2, '2022-06-04 20:52:15');
insert into trips (trip_id, route_id, train_id, time) values (139, 79, 5, '2022-01-02 22:35:03');
insert into trips (trip_id, route_id, train_id, time) values (140, 72, 5, '2022-02-21 18:20:05');
insert into trips (trip_id, route_id, train_id, time) values (141, 46, 4, '2021-10-12 08:01:59');
insert into trips (trip_id, route_id, train_id, time) values (142, 94, 3, '2022-02-05 22:19:46');
insert into trips (trip_id, route_id, train_id, time) values (143, 1, 1, '2021-10-13 23:43:00');
insert into trips (trip_id, route_id, train_id, time) values (144, 34, 3, '2022-02-24 11:33:31');
insert into trips (trip_id, route_id, train_id, time) values (145, 12, 2, '2022-07-23 07:50:18');
insert into trips (trip_id, route_id, train_id, time) values (146, 50, 2, '2022-04-09 15:22:11');
insert into trips (trip_id, route_id, train_id, time) values (147, 4, 1, '2022-06-22 07:39:42');
insert into trips (trip_id, route_id, train_id, time) values (148, 45, 1, '2021-07-20 17:18:51');
insert into trips (trip_id, route_id, train_id, time) values (149, 40, 3, '2022-07-09 10:08:43');
insert into trips (trip_id, route_id, train_id, time) values (150, 45, 4, '2021-11-24 18:34:55');
insert into trips (trip_id, route_id, train_id, time) values (151, 45, 1, '2022-04-07 03:45:59');
insert into trips (trip_id, route_id, train_id, time) values (152, 95, 3, '2021-09-10 01:13:16');
insert into trips (trip_id, route_id, train_id, time) values (153, 46, 3, '2021-09-13 17:57:02');
insert into trips (trip_id, route_id, train_id, time) values (154, 60, 3, '2021-08-13 23:37:43');
insert into trips (trip_id, route_id, train_id, time) values (155, 25, 1, '2022-04-11 20:47:57');
insert into trips (trip_id, route_id, train_id, time) values (156, 65, 4, '2021-11-28 20:52:44');
insert into trips (trip_id, route_id, train_id, time) values (157, 93, 4, '2022-06-29 22:08:31');
insert into trips (trip_id, route_id, train_id, time) values (158, 84, 5, '2022-02-14 16:37:53');
insert into trips (trip_id, route_id, train_id, time) values (159, 94, 5, '2021-11-22 01:58:49');
insert into trips (trip_id, route_id, train_id, time) values (160, 59, 1, '2021-08-31 07:01:17');
insert into trips (trip_id, route_id, train_id, time) values (161, 81, 5, '2021-08-08 14:59:21');
insert into trips (trip_id, route_id, train_id, time) values (162, 92, 2, '2021-10-28 06:18:21');
insert into trips (trip_id, route_id, train_id, time) values (163, 67, 3, '2021-08-24 00:10:43');
insert into trips (trip_id, route_id, train_id, time) values (164, 57, 3, '2021-10-20 03:46:36');
insert into trips (trip_id, route_id, train_id, time) values (165, 45, 2, '2022-01-11 05:00:09');
insert into trips (trip_id, route_id, train_id, time) values (166, 38, 5, '2022-05-04 21:12:00');
insert into trips (trip_id, route_id, train_id, time) values (167, 62, 1, '2022-01-05 13:32:58');
insert into trips (trip_id, route_id, train_id, time) values (168, 96, 4, '2021-12-11 17:15:50');
insert into trips (trip_id, route_id, train_id, time) values (169, 42, 1, '2022-03-04 11:02:06');
insert into trips (trip_id, route_id, train_id, time) values (170, 41, 5, '2022-01-11 19:27:33');
insert into trips (trip_id, route_id, train_id, time) values (171, 68, 2, '2022-03-23 00:34:10');
insert into trips (trip_id, route_id, train_id, time) values (172, 63, 4, '2021-11-04 12:12:43');
insert into trips (trip_id, route_id, train_id, time) values (173, 86, 1, '2021-12-18 22:42:02');
insert into trips (trip_id, route_id, train_id, time) values (174, 66, 2, '2022-05-07 08:19:25');
insert into trips (trip_id, route_id, train_id, time) values (175, 100, 5, '2022-04-25 07:56:30');
insert into trips (trip_id, route_id, train_id, time) values (176, 77, 4, '2021-08-03 18:47:21');
insert into trips (trip_id, route_id, train_id, time) values (177, 81, 2, '2022-05-12 13:30:30');
insert into trips (trip_id, route_id, train_id, time) values (178, 39, 1, '2021-11-20 11:29:07');
insert into trips (trip_id, route_id, train_id, time) values (179, 94, 1, '2021-07-22 03:12:46');
insert into trips (trip_id, route_id, train_id, time) values (180, 57, 5, '2022-03-11 12:04:12');
insert into trips (trip_id, route_id, train_id, time) values (181, 40, 5, '2021-12-06 13:59:31');
insert into trips (trip_id, route_id, train_id, time) values (182, 83, 1, '2021-11-16 21:21:26');
insert into trips (trip_id, route_id, train_id, time) values (183, 53, 1, '2021-12-17 23:37:33');
insert into trips (trip_id, route_id, train_id, time) values (184, 62, 3, '2021-08-08 19:12:16');
insert into trips (trip_id, route_id, train_id, time) values (185, 16, 1, '2021-12-20 07:13:22');
insert into trips (trip_id, route_id, train_id, time) values (186, 23, 4, '2021-09-15 04:27:16');
insert into trips (trip_id, route_id, train_id, time) values (187, 32, 1, '2021-07-25 06:50:12');
insert into trips (trip_id, route_id, train_id, time) values (188, 99, 1, '2021-09-17 00:25:12');
insert into trips (trip_id, route_id, train_id, time) values (189, 53, 5, '2022-05-07 03:21:59');
insert into trips (trip_id, route_id, train_id, time) values (190, 9, 3, '2022-01-14 03:06:58');
insert into trips (trip_id, route_id, train_id, time) values (191, 81, 5, '2022-03-19 00:28:34');
insert into trips (trip_id, route_id, train_id, time) values (192, 69, 5, '2022-03-05 13:48:33');
insert into trips (trip_id, route_id, train_id, time) values (193, 37, 4, '2022-06-13 22:56:47');
insert into trips (trip_id, route_id, train_id, time) values (194, 18, 1, '2021-10-16 07:14:14');
insert into trips (trip_id, route_id, train_id, time) values (195, 89, 5, '2021-12-21 14:45:28');
insert into trips (trip_id, route_id, train_id, time) values (196, 81, 3, '2021-10-23 14:53:23');
insert into trips (trip_id, route_id, train_id, time) values (197, 100, 3, '2022-01-13 21:39:20');
insert into trips (trip_id, route_id, train_id, time) values (198, 70, 5, '2022-02-12 22:12:49');
insert into trips (trip_id, route_id, train_id, time) values (199, 5, 3, '2021-12-09 03:31:00');
insert into trips (trip_id, route_id, train_id, time) values (200, 83, 4, '2022-07-25 08:49:25');
insert into trips (trip_id, route_id, train_id, time) values (201, 20, 4, '2022-01-09 10:52:36');
insert into trips (trip_id, route_id, train_id, time) values (202, 97, 3, '2021-12-30 02:07:27');
insert into trips (trip_id, route_id, train_id, time) values (203, 77, 2, '2021-11-08 02:54:45');
insert into trips (trip_id, route_id, train_id, time) values (204, 76, 1, '2022-03-19 21:41:15');
insert into trips (trip_id, route_id, train_id, time) values (205, 23, 3, '2022-05-12 16:40:03');
insert into trips (trip_id, route_id, train_id, time) values (206, 25, 5, '2022-06-17 07:18:18');
insert into trips (trip_id, route_id, train_id, time) values (207, 41, 5, '2022-02-26 17:17:57');
insert into trips (trip_id, route_id, train_id, time) values (208, 83, 4, '2022-05-02 04:11:25');
insert into trips (trip_id, route_id, train_id, time) values (209, 77, 4, '2022-01-21 09:35:45');
insert into trips (trip_id, route_id, train_id, time) values (210, 69, 1, '2022-01-04 01:34:24');
insert into trips (trip_id, route_id, train_id, time) values (211, 58, 3, '2021-07-26 15:45:55');
insert into trips (trip_id, route_id, train_id, time) values (212, 89, 3, '2022-01-07 00:33:42');
insert into trips (trip_id, route_id, train_id, time) values (213, 32, 2, '2021-09-28 02:44:48');
insert into trips (trip_id, route_id, train_id, time) values (214, 68, 5, '2022-05-06 20:15:18');
insert into trips (trip_id, route_id, train_id, time) values (215, 65, 2, '2021-08-23 12:24:26');
insert into trips (trip_id, route_id, train_id, time) values (216, 35, 3, '2022-03-18 21:24:23');
insert into trips (trip_id, route_id, train_id, time) values (217, 85, 2, '2022-01-24 11:33:00');
insert into trips (trip_id, route_id, train_id, time) values (218, 98, 4, '2022-06-13 08:59:45');
insert into trips (trip_id, route_id, train_id, time) values (219, 77, 4, '2022-02-15 08:37:14');
insert into trips (trip_id, route_id, train_id, time) values (220, 79, 2, '2022-05-27 08:21:26');
insert into trips (trip_id, route_id, train_id, time) values (221, 17, 3, '2022-01-20 11:06:41');
insert into trips (trip_id, route_id, train_id, time) values (222, 75, 1, '2022-02-11 04:20:22');
insert into trips (trip_id, route_id, train_id, time) values (223, 2, 1, '2022-06-29 17:39:52');
insert into trips (trip_id, route_id, train_id, time) values (224, 36, 3, '2022-06-10 21:57:59');
insert into trips (trip_id, route_id, train_id, time) values (225, 97, 3, '2022-06-09 18:53:18');
insert into trips (trip_id, route_id, train_id, time) values (226, 15, 5, '2021-12-05 00:52:00');
insert into trips (trip_id, route_id, train_id, time) values (227, 28, 4, '2022-05-26 13:56:17');
insert into trips (trip_id, route_id, train_id, time) values (228, 59, 3, '2022-03-27 04:18:59');
insert into trips (trip_id, route_id, train_id, time) values (229, 51, 2, '2021-09-12 22:58:32');
insert into trips (trip_id, route_id, train_id, time) values (230, 75, 4, '2022-05-30 21:54:31');
insert into trips (trip_id, route_id, train_id, time) values (231, 77, 4, '2022-05-20 14:20:50');
insert into trips (trip_id, route_id, train_id, time) values (232, 8, 5, '2021-08-02 06:40:21');
insert into trips (trip_id, route_id, train_id, time) values (233, 86, 2, '2021-08-28 01:13:03');
insert into trips (trip_id, route_id, train_id, time) values (234, 55, 1, '2021-08-12 20:31:36');
insert into trips (trip_id, route_id, train_id, time) values (235, 1, 4, '2022-02-25 12:55:58');
insert into trips (trip_id, route_id, train_id, time) values (236, 96, 1, '2022-05-17 13:11:49');
insert into trips (trip_id, route_id, train_id, time) values (237, 48, 3, '2022-04-02 10:57:13');
insert into trips (trip_id, route_id, train_id, time) values (238, 53, 4, '2022-01-17 14:53:38');
insert into trips (trip_id, route_id, train_id, time) values (239, 33, 1, '2022-04-06 10:45:04');
insert into trips (trip_id, route_id, train_id, time) values (240, 31, 3, '2021-09-15 08:15:57');
insert into trips (trip_id, route_id, train_id, time) values (241, 61, 2, '2021-11-02 15:42:15');
insert into trips (trip_id, route_id, train_id, time) values (242, 91, 1, '2021-08-23 23:25:04');
insert into trips (trip_id, route_id, train_id, time) values (243, 2, 1, '2022-06-13 06:40:25');
insert into trips (trip_id, route_id, train_id, time) values (244, 67, 5, '2021-07-22 05:27:37');
insert into trips (trip_id, route_id, train_id, time) values (245, 38, 1, '2021-10-01 18:38:04');
insert into trips (trip_id, route_id, train_id, time) values (246, 9, 2, '2022-03-02 08:06:53');
insert into trips (trip_id, route_id, train_id, time) values (247, 96, 1, '2021-11-30 05:15:27');
insert into trips (trip_id, route_id, train_id, time) values (248, 24, 3, '2021-07-18 12:07:38');
insert into trips (trip_id, route_id, train_id, time) values (249, 54, 1, '2021-11-15 20:46:09');
insert into trips (trip_id, route_id, train_id, time) values (250, 95, 1, '2022-06-19 10:25:31');
insert into trips (trip_id, route_id, train_id, time) values (251, 82, 5, '2021-10-19 19:24:45');
insert into trips (trip_id, route_id, train_id, time) values (252, 78, 1, '2021-09-17 21:45:51');
insert into trips (trip_id, route_id, train_id, time) values (253, 12, 3, '2021-12-25 12:48:14');
insert into trips (trip_id, route_id, train_id, time) values (254, 56, 1, '2021-12-28 02:56:20');
insert into trips (trip_id, route_id, train_id, time) values (255, 41, 2, '2021-10-12 11:24:20');
insert into trips (trip_id, route_id, train_id, time) values (256, 47, 1, '2022-01-28 01:15:41');
insert into trips (trip_id, route_id, train_id, time) values (257, 37, 5, '2022-05-18 07:10:05');
insert into trips (trip_id, route_id, train_id, time) values (258, 56, 3, '2021-10-17 11:30:21');
insert into trips (trip_id, route_id, train_id, time) values (259, 35, 4, '2022-05-26 06:11:10');
insert into trips (trip_id, route_id, train_id, time) values (260, 3, 5, '2021-09-26 13:02:08');
insert into trips (trip_id, route_id, train_id, time) values (261, 67, 4, '2022-06-23 09:28:32');
insert into trips (trip_id, route_id, train_id, time) values (262, 8, 5, '2021-09-14 10:14:23');
insert into trips (trip_id, route_id, train_id, time) values (263, 27, 3, '2021-08-28 20:21:56');
insert into trips (trip_id, route_id, train_id, time) values (264, 18, 4, '2022-04-19 21:45:21');
insert into trips (trip_id, route_id, train_id, time) values (265, 7, 5, '2021-12-15 12:58:56');
insert into trips (trip_id, route_id, train_id, time) values (266, 28, 5, '2022-01-23 04:28:13');
insert into trips (trip_id, route_id, train_id, time) values (267, 56, 1, '2021-11-24 22:05:47');
insert into trips (trip_id, route_id, train_id, time) values (268, 6, 3, '2021-12-04 23:46:14');
insert into trips (trip_id, route_id, train_id, time) values (269, 71, 4, '2022-03-18 15:04:17');
insert into trips (trip_id, route_id, train_id, time) values (270, 99, 3, '2021-11-29 04:55:57');
insert into trips (trip_id, route_id, train_id, time) values (271, 31, 2, '2021-08-05 09:14:08');
insert into trips (trip_id, route_id, train_id, time) values (272, 42, 3, '2022-03-04 11:35:49');
insert into trips (trip_id, route_id, train_id, time) values (273, 86, 2, '2021-10-22 21:33:30');
insert into trips (trip_id, route_id, train_id, time) values (274, 61, 3, '2022-01-02 05:37:50');
insert into trips (trip_id, route_id, train_id, time) values (275, 47, 2, '2021-07-22 15:47:29');
insert into trips (trip_id, route_id, train_id, time) values (276, 9, 3, '2021-07-18 12:24:15');
insert into trips (trip_id, route_id, train_id, time) values (277, 78, 4, '2021-08-12 00:21:53');
insert into trips (trip_id, route_id, train_id, time) values (278, 32, 4, '2022-01-20 03:25:04');
insert into trips (trip_id, route_id, train_id, time) values (279, 1, 2, '2021-07-16 21:21:09');
insert into trips (trip_id, route_id, train_id, time) values (280, 100, 3, '2022-03-16 20:36:17');
insert into trips (trip_id, route_id, train_id, time) values (281, 76, 4, '2021-11-27 04:06:22');
insert into trips (trip_id, route_id, train_id, time) values (282, 87, 1, '2022-04-02 18:37:59');
insert into trips (trip_id, route_id, train_id, time) values (283, 22, 4, '2021-08-25 10:29:50');
insert into trips (trip_id, route_id, train_id, time) values (284, 44, 4, '2022-03-06 07:25:33');
insert into trips (trip_id, route_id, train_id, time) values (285, 31, 1, '2022-01-31 02:56:41');
insert into trips (trip_id, route_id, train_id, time) values (286, 45, 4, '2021-12-21 13:25:33');
insert into trips (trip_id, route_id, train_id, time) values (287, 65, 4, '2021-12-09 23:34:29');
insert into trips (trip_id, route_id, train_id, time) values (288, 14, 2, '2022-04-15 20:29:26');
insert into trips (trip_id, route_id, train_id, time) values (289, 26, 5, '2022-06-05 18:27:21');
insert into trips (trip_id, route_id, train_id, time) values (290, 45, 1, '2022-06-14 02:19:46');
insert into trips (trip_id, route_id, train_id, time) values (291, 91, 1, '2022-06-20 23:50:27');
insert into trips (trip_id, route_id, train_id, time) values (292, 20, 1, '2021-10-09 05:37:50');
insert into trips (trip_id, route_id, train_id, time) values (293, 59, 3, '2021-11-10 12:06:26');
insert into trips (trip_id, route_id, train_id, time) values (294, 78, 2, '2022-01-22 06:23:35');
insert into trips (trip_id, route_id, train_id, time) values (295, 91, 3, '2021-09-22 10:49:57');
insert into trips (trip_id, route_id, train_id, time) values (296, 22, 2, '2021-08-16 20:48:57');
insert into trips (trip_id, route_id, train_id, time) values (297, 52, 3, '2021-12-26 10:12:17');
insert into trips (trip_id, route_id, train_id, time) values (298, 60, 5, '2021-07-23 17:46:58');
insert into trips (trip_id, route_id, train_id, time) values (299, 51, 1, '2022-04-30 22:01:36');
insert into trips (trip_id, route_id, train_id, time) values (300, 100, 4, '2021-12-04 17:09:40');
insert into trips (trip_id, route_id, train_id, time) values (301, 6, 1, '2022-01-25 08:40:33');
insert into trips (trip_id, route_id, train_id, time) values (302, 60, 4, '2022-04-27 15:37:00');
insert into trips (trip_id, route_id, train_id, time) values (303, 38, 5, '2022-06-02 13:17:19');
insert into trips (trip_id, route_id, train_id, time) values (304, 11, 1, '2022-02-26 00:34:41');
insert into trips (trip_id, route_id, train_id, time) values (305, 61, 3, '2021-07-19 15:58:09');
insert into trips (trip_id, route_id, train_id, time) values (306, 90, 4, '2021-12-29 19:32:47');
insert into trips (trip_id, route_id, train_id, time) values (307, 50, 2, '2022-06-24 15:50:22');
insert into trips (trip_id, route_id, train_id, time) values (308, 84, 5, '2022-04-10 20:43:48');
insert into trips (trip_id, route_id, train_id, time) values (309, 29, 5, '2022-02-22 03:57:57');
insert into trips (trip_id, route_id, train_id, time) values (310, 93, 3, '2022-04-02 09:55:40');
insert into trips (trip_id, route_id, train_id, time) values (311, 20, 5, '2022-01-26 07:36:01');
insert into trips (trip_id, route_id, train_id, time) values (312, 67, 1, '2022-07-19 22:30:39');
insert into trips (trip_id, route_id, train_id, time) values (313, 78, 3, '2022-04-06 21:56:57');
insert into trips (trip_id, route_id, train_id, time) values (314, 78, 4, '2021-08-28 18:30:01');
insert into trips (trip_id, route_id, train_id, time) values (315, 23, 3, '2022-06-17 13:40:03');
insert into trips (trip_id, route_id, train_id, time) values (316, 85, 2, '2021-08-31 21:41:27');
insert into trips (trip_id, route_id, train_id, time) values (317, 78, 2, '2021-10-04 23:34:22');
insert into trips (trip_id, route_id, train_id, time) values (318, 33, 2, '2022-03-16 09:59:15');
insert into trips (trip_id, route_id, train_id, time) values (319, 73, 4, '2022-01-29 13:00:10');
insert into trips (trip_id, route_id, train_id, time) values (320, 21, 1, '2021-10-21 20:59:57');
insert into trips (trip_id, route_id, train_id, time) values (321, 5, 5, '2022-04-07 07:34:41');
insert into trips (trip_id, route_id, train_id, time) values (322, 51, 2, '2021-10-18 22:59:01');
insert into trips (trip_id, route_id, train_id, time) values (323, 56, 4, '2022-05-27 20:11:29');
insert into trips (trip_id, route_id, train_id, time) values (324, 45, 3, '2022-02-20 10:14:40');
insert into trips (trip_id, route_id, train_id, time) values (325, 36, 3, '2021-11-28 18:53:16');
insert into trips (trip_id, route_id, train_id, time) values (326, 50, 5, '2022-07-03 06:26:19');
insert into trips (trip_id, route_id, train_id, time) values (327, 49, 4, '2022-03-28 22:31:11');
insert into trips (trip_id, route_id, train_id, time) values (328, 67, 5, '2021-12-22 23:18:52');
insert into trips (trip_id, route_id, train_id, time) values (329, 40, 3, '2022-03-01 19:19:25');
insert into trips (trip_id, route_id, train_id, time) values (330, 96, 5, '2022-05-04 09:46:42');
insert into trips (trip_id, route_id, train_id, time) values (331, 18, 1, '2022-04-20 20:05:41');
insert into trips (trip_id, route_id, train_id, time) values (332, 74, 5, '2022-04-18 08:04:09');
insert into trips (trip_id, route_id, train_id, time) values (333, 62, 1, '2021-11-05 23:17:19');
insert into trips (trip_id, route_id, train_id, time) values (334, 54, 5, '2022-01-21 07:08:44');
insert into trips (trip_id, route_id, train_id, time) values (335, 13, 3, '2021-08-22 16:09:25');
insert into trips (trip_id, route_id, train_id, time) values (336, 88, 2, '2022-03-05 09:25:44');
insert into trips (trip_id, route_id, train_id, time) values (337, 70, 2, '2021-08-16 23:42:27');
insert into trips (trip_id, route_id, train_id, time) values (338, 81, 1, '2022-04-28 16:54:09');
insert into trips (trip_id, route_id, train_id, time) values (339, 71, 1, '2022-05-26 10:04:00');
insert into trips (trip_id, route_id, train_id, time) values (340, 37, 5, '2022-01-27 07:57:02');
insert into trips (trip_id, route_id, train_id, time) values (341, 27, 3, '2021-12-26 07:15:17');
insert into trips (trip_id, route_id, train_id, time) values (342, 62, 2, '2022-06-09 21:08:58');
insert into trips (trip_id, route_id, train_id, time) values (343, 39, 5, '2021-08-20 23:12:58');
insert into trips (trip_id, route_id, train_id, time) values (344, 55, 2, '2022-04-19 18:08:58');
insert into trips (trip_id, route_id, train_id, time) values (345, 34, 5, '2022-01-03 15:44:26');
insert into trips (trip_id, route_id, train_id, time) values (346, 48, 5, '2021-07-29 09:03:40');
insert into trips (trip_id, route_id, train_id, time) values (347, 39, 2, '2021-07-22 22:42:43');
insert into trips (trip_id, route_id, train_id, time) values (348, 66, 2, '2021-11-02 10:54:18');
insert into trips (trip_id, route_id, train_id, time) values (349, 66, 2, '2021-10-12 12:13:34');
insert into trips (trip_id, route_id, train_id, time) values (350, 75, 2, '2022-05-30 21:06:49');
insert into trips (trip_id, route_id, train_id, time) values (351, 90, 5, '2022-01-10 12:13:11');
insert into trips (trip_id, route_id, train_id, time) values (352, 93, 2, '2021-11-20 14:32:04');
insert into trips (trip_id, route_id, train_id, time) values (353, 68, 3, '2021-11-06 06:28:11');
insert into trips (trip_id, route_id, train_id, time) values (354, 30, 5, '2022-04-23 12:41:16');
insert into trips (trip_id, route_id, train_id, time) values (355, 33, 1, '2021-09-17 00:50:56');
insert into trips (trip_id, route_id, train_id, time) values (356, 75, 1, '2021-12-22 08:16:37');
insert into trips (trip_id, route_id, train_id, time) values (357, 8, 2, '2022-02-11 01:37:04');
insert into trips (trip_id, route_id, train_id, time) values (358, 13, 3, '2022-02-06 04:33:20');
insert into trips (trip_id, route_id, train_id, time) values (359, 63, 4, '2022-04-24 09:12:04');
insert into trips (trip_id, route_id, train_id, time) values (360, 33, 5, '2022-01-23 09:44:41');
insert into trips (trip_id, route_id, train_id, time) values (361, 27, 2, '2022-02-08 05:35:10');
insert into trips (trip_id, route_id, train_id, time) values (362, 85, 2, '2022-04-28 19:13:31');
insert into trips (trip_id, route_id, train_id, time) values (363, 69, 4, '2022-02-17 06:31:14');
insert into trips (trip_id, route_id, train_id, time) values (364, 65, 5, '2021-11-09 17:26:46');
insert into trips (trip_id, route_id, train_id, time) values (365, 99, 5, '2021-12-30 06:45:15');
insert into trips (trip_id, route_id, train_id, time) values (366, 46, 4, '2022-03-03 20:20:05');
insert into trips (trip_id, route_id, train_id, time) values (367, 24, 1, '2021-11-19 21:30:21');
insert into trips (trip_id, route_id, train_id, time) values (368, 18, 4, '2022-04-23 09:32:55');
insert into trips (trip_id, route_id, train_id, time) values (369, 83, 3, '2022-03-24 23:41:08');
insert into trips (trip_id, route_id, train_id, time) values (370, 9, 5, '2022-04-15 07:56:38');
insert into trips (trip_id, route_id, train_id, time) values (371, 28, 1, '2022-03-05 20:46:41');
insert into trips (trip_id, route_id, train_id, time) values (372, 34, 5, '2021-11-02 13:35:59');
insert into trips (trip_id, route_id, train_id, time) values (373, 78, 1, '2021-09-12 23:40:51');
insert into trips (trip_id, route_id, train_id, time) values (374, 67, 5, '2021-10-28 20:20:15');
insert into trips (trip_id, route_id, train_id, time) values (375, 98, 3, '2022-06-08 21:49:52');
insert into trips (trip_id, route_id, train_id, time) values (376, 26, 2, '2022-03-20 02:27:51');
insert into trips (trip_id, route_id, train_id, time) values (377, 44, 1, '2021-08-30 22:25:58');
insert into trips (trip_id, route_id, train_id, time) values (378, 52, 4, '2022-05-05 16:55:47');
insert into trips (trip_id, route_id, train_id, time) values (379, 37, 4, '2021-10-23 00:31:32');
insert into trips (trip_id, route_id, train_id, time) values (380, 4, 1, '2021-11-08 23:26:51');
insert into trips (trip_id, route_id, train_id, time) values (381, 79, 4, '2021-11-17 19:22:02');
insert into trips (trip_id, route_id, train_id, time) values (382, 95, 4, '2021-08-20 16:52:26');
insert into trips (trip_id, route_id, train_id, time) values (383, 63, 1, '2022-04-26 04:02:22');
insert into trips (trip_id, route_id, train_id, time) values (384, 34, 5, '2022-03-16 00:14:04');
insert into trips (trip_id, route_id, train_id, time) values (385, 57, 1, '2021-11-14 00:57:14');
insert into trips (trip_id, route_id, train_id, time) values (386, 100, 1, '2021-09-21 18:31:28');
insert into trips (trip_id, route_id, train_id, time) values (387, 47, 1, '2022-02-04 18:31:46');
insert into trips (trip_id, route_id, train_id, time) values (388, 77, 3, '2022-02-19 22:32:14');
insert into trips (trip_id, route_id, train_id, time) values (389, 45, 2, '2021-09-09 05:40:27');
insert into trips (trip_id, route_id, train_id, time) values (390, 72, 3, '2022-04-07 04:17:23');
insert into trips (trip_id, route_id, train_id, time) values (391, 65, 4, '2021-07-20 18:27:45');
insert into trips (trip_id, route_id, train_id, time) values (392, 42, 2, '2022-02-07 16:33:18');
insert into trips (trip_id, route_id, train_id, time) values (393, 59, 3, '2021-11-03 00:09:19');
insert into trips (trip_id, route_id, train_id, time) values (394, 82, 1, '2021-10-30 12:39:01');
insert into trips (trip_id, route_id, train_id, time) values (395, 35, 2, '2022-04-01 15:55:45');
insert into trips (trip_id, route_id, train_id, time) values (396, 56, 2, '2022-07-03 16:35:18');
insert into trips (trip_id, route_id, train_id, time) values (397, 86, 3, '2022-06-24 23:39:02');
insert into trips (trip_id, route_id, train_id, time) values (398, 26, 2, '2021-11-04 04:38:39');
insert into trips (trip_id, route_id, train_id, time) values (399, 31, 2, '2022-01-03 19:46:12');
insert into trips (trip_id, route_id, train_id, time) values (400, 63, 3, '2021-08-18 10:20:25');
insert into trips (trip_id, route_id, train_id, time) values (401, 22, 3, '2022-05-04 21:44:08');
insert into trips (trip_id, route_id, train_id, time) values (402, 10, 3, '2022-01-22 22:01:09');
insert into trips (trip_id, route_id, train_id, time) values (403, 21, 3, '2022-04-30 21:59:27');
insert into trips (trip_id, route_id, train_id, time) values (404, 55, 4, '2021-12-01 22:58:28');
insert into trips (trip_id, route_id, train_id, time) values (405, 94, 3, '2021-12-26 22:22:46');
insert into trips (trip_id, route_id, train_id, time) values (406, 54, 2, '2021-11-07 05:26:51');
insert into trips (trip_id, route_id, train_id, time) values (407, 99, 3, '2021-08-05 09:57:45');
insert into trips (trip_id, route_id, train_id, time) values (408, 22, 2, '2022-07-03 02:51:11');
insert into trips (trip_id, route_id, train_id, time) values (409, 23, 1, '2021-08-01 21:37:38');
insert into trips (trip_id, route_id, train_id, time) values (410, 79, 4, '2022-04-25 19:40:23');
insert into trips (trip_id, route_id, train_id, time) values (411, 63, 4, '2022-07-20 18:33:00');
insert into trips (trip_id, route_id, train_id, time) values (412, 45, 2, '2021-07-20 08:55:51');
insert into trips (trip_id, route_id, train_id, time) values (413, 19, 3, '2022-05-11 06:23:36');
insert into trips (trip_id, route_id, train_id, time) values (414, 71, 1, '2022-02-23 04:11:28');
insert into trips (trip_id, route_id, train_id, time) values (415, 84, 4, '2022-02-18 12:53:20');
insert into trips (trip_id, route_id, train_id, time) values (416, 21, 3, '2022-05-08 18:51:38');
insert into trips (trip_id, route_id, train_id, time) values (417, 23, 4, '2022-07-13 08:44:42');
insert into trips (trip_id, route_id, train_id, time) values (418, 21, 2, '2021-08-14 04:14:12');
insert into trips (trip_id, route_id, train_id, time) values (419, 14, 5, '2021-09-10 18:39:54');
insert into trips (trip_id, route_id, train_id, time) values (420, 32, 4, '2022-05-02 15:03:25');
insert into trips (trip_id, route_id, train_id, time) values (421, 8, 2, '2021-08-08 09:45:11');
insert into trips (trip_id, route_id, train_id, time) values (422, 90, 3, '2022-05-22 04:16:15');
insert into trips (trip_id, route_id, train_id, time) values (423, 57, 5, '2022-01-25 05:12:30');
insert into trips (trip_id, route_id, train_id, time) values (424, 95, 2, '2022-03-18 19:58:10');
insert into trips (trip_id, route_id, train_id, time) values (425, 34, 5, '2021-09-25 21:37:24');
insert into trips (trip_id, route_id, train_id, time) values (426, 35, 2, '2022-01-26 18:46:57');
insert into trips (trip_id, route_id, train_id, time) values (427, 6, 3, '2021-09-10 09:29:20');
insert into trips (trip_id, route_id, train_id, time) values (428, 67, 3, '2021-10-03 21:15:46');
insert into trips (trip_id, route_id, train_id, time) values (429, 3, 1, '2021-11-02 01:05:38');
insert into trips (trip_id, route_id, train_id, time) values (430, 36, 2, '2022-05-07 00:38:50');
insert into trips (trip_id, route_id, train_id, time) values (431, 29, 5, '2022-03-24 20:11:35');
insert into trips (trip_id, route_id, train_id, time) values (432, 94, 2, '2021-08-15 21:42:44');
insert into trips (trip_id, route_id, train_id, time) values (433, 69, 4, '2021-09-07 04:54:33');
insert into trips (trip_id, route_id, train_id, time) values (434, 78, 1, '2021-08-26 17:59:14');
insert into trips (trip_id, route_id, train_id, time) values (435, 34, 4, '2022-02-05 01:26:01');
insert into trips (trip_id, route_id, train_id, time) values (436, 68, 2, '2021-09-22 04:38:08');
insert into trips (trip_id, route_id, train_id, time) values (437, 87, 2, '2022-07-09 10:24:34');
insert into trips (trip_id, route_id, train_id, time) values (438, 21, 2, '2021-07-21 19:50:44');
insert into trips (trip_id, route_id, train_id, time) values (439, 35, 5, '2022-05-02 04:56:29');
insert into trips (trip_id, route_id, train_id, time) values (440, 36, 2, '2022-04-02 00:36:19');
insert into trips (trip_id, route_id, train_id, time) values (441, 46, 5, '2022-02-15 18:16:36');
insert into trips (trip_id, route_id, train_id, time) values (442, 99, 3, '2022-03-12 00:14:41');
insert into trips (trip_id, route_id, train_id, time) values (443, 57, 4, '2021-07-21 00:10:30');
insert into trips (trip_id, route_id, train_id, time) values (444, 86, 5, '2022-06-25 18:49:58');
insert into trips (trip_id, route_id, train_id, time) values (445, 51, 4, '2021-10-26 18:05:12');
insert into trips (trip_id, route_id, train_id, time) values (446, 38, 1, '2022-06-25 14:44:02');
insert into trips (trip_id, route_id, train_id, time) values (447, 74, 2, '2021-08-26 12:19:21');
insert into trips (trip_id, route_id, train_id, time) values (448, 18, 3, '2022-01-26 10:17:19');
insert into trips (trip_id, route_id, train_id, time) values (449, 87, 3, '2021-07-22 18:31:49');
insert into trips (trip_id, route_id, train_id, time) values (450, 74, 5, '2021-12-06 12:00:41');
insert into trips (trip_id, route_id, train_id, time) values (451, 22, 3, '2021-10-08 00:05:22');
insert into trips (trip_id, route_id, train_id, time) values (452, 83, 5, '2021-08-04 02:10:12');
insert into trips (trip_id, route_id, train_id, time) values (453, 58, 5, '2021-12-31 12:01:46');
insert into trips (trip_id, route_id, train_id, time) values (454, 11, 4, '2021-07-21 04:19:37');
insert into trips (trip_id, route_id, train_id, time) values (455, 100, 1, '2022-05-25 22:07:29');
insert into trips (trip_id, route_id, train_id, time) values (456, 79, 4, '2022-06-09 01:07:23');
insert into trips (trip_id, route_id, train_id, time) values (457, 34, 5, '2021-11-05 08:14:01');
insert into trips (trip_id, route_id, train_id, time) values (458, 22, 2, '2022-07-27 03:46:45');
insert into trips (trip_id, route_id, train_id, time) values (459, 20, 3, '2022-01-06 00:26:49');
insert into trips (trip_id, route_id, train_id, time) values (460, 28, 5, '2022-04-07 11:15:01');
insert into trips (trip_id, route_id, train_id, time) values (461, 4, 3, '2021-08-24 16:09:44');
insert into trips (trip_id, route_id, train_id, time) values (462, 48, 5, '2022-01-02 19:08:31');
insert into trips (trip_id, route_id, train_id, time) values (463, 58, 5, '2022-04-09 15:22:47');
insert into trips (trip_id, route_id, train_id, time) values (464, 29, 1, '2022-05-08 08:46:00');
insert into trips (trip_id, route_id, train_id, time) values (465, 99, 5, '2022-06-10 22:48:32');
insert into trips (trip_id, route_id, train_id, time) values (466, 23, 2, '2022-07-03 19:01:53');
insert into trips (trip_id, route_id, train_id, time) values (467, 30, 3, '2022-06-30 18:05:37');
insert into trips (trip_id, route_id, train_id, time) values (468, 80, 1, '2022-04-14 20:12:23');
insert into trips (trip_id, route_id, train_id, time) values (469, 84, 2, '2021-08-16 09:21:56');
insert into trips (trip_id, route_id, train_id, time) values (470, 58, 4, '2021-08-05 22:44:44');
insert into trips (trip_id, route_id, train_id, time) values (471, 8, 1, '2022-07-02 15:02:38');
insert into trips (trip_id, route_id, train_id, time) values (472, 89, 2, '2022-07-17 22:56:47');
insert into trips (trip_id, route_id, train_id, time) values (473, 49, 4, '2022-03-26 16:20:42');
insert into trips (trip_id, route_id, train_id, time) values (474, 82, 5, '2022-03-19 04:22:25');
insert into trips (trip_id, route_id, train_id, time) values (475, 87, 4, '2021-11-14 18:31:46');
insert into trips (trip_id, route_id, train_id, time) values (476, 94, 3, '2022-06-24 03:38:36');
insert into trips (trip_id, route_id, train_id, time) values (477, 12, 4, '2022-06-08 20:55:50');
insert into trips (trip_id, route_id, train_id, time) values (478, 59, 1, '2022-07-26 16:29:41');
insert into trips (trip_id, route_id, train_id, time) values (479, 51, 5, '2021-10-22 07:18:12');
insert into trips (trip_id, route_id, train_id, time) values (480, 90, 3, '2022-02-08 20:04:53');
insert into trips (trip_id, route_id, train_id, time) values (481, 6, 2, '2022-06-04 08:56:22');
insert into trips (trip_id, route_id, train_id, time) values (482, 23, 2, '2021-10-13 17:07:20');
insert into trips (trip_id, route_id, train_id, time) values (483, 53, 1, '2022-01-17 22:34:54');
insert into trips (trip_id, route_id, train_id, time) values (484, 36, 4, '2022-02-01 04:10:42');
insert into trips (trip_id, route_id, train_id, time) values (485, 38, 3, '2021-08-09 00:17:31');
insert into trips (trip_id, route_id, train_id, time) values (486, 54, 3, '2021-08-18 20:58:04');
insert into trips (trip_id, route_id, train_id, time) values (487, 92, 4, '2021-08-27 11:24:45');
insert into trips (trip_id, route_id, train_id, time) values (488, 30, 3, '2022-02-26 09:54:48');
insert into trips (trip_id, route_id, train_id, time) values (489, 62, 5, '2022-03-18 16:15:39');
insert into trips (trip_id, route_id, train_id, time) values (490, 13, 2, '2021-10-02 09:16:11');
insert into trips (trip_id, route_id, train_id, time) values (491, 56, 1, '2021-10-01 19:44:12');
insert into trips (trip_id, route_id, train_id, time) values (492, 99, 3, '2022-01-27 18:31:05');
insert into trips (trip_id, route_id, train_id, time) values (493, 47, 1, '2022-06-06 19:36:31');
insert into trips (trip_id, route_id, train_id, time) values (494, 45, 2, '2022-01-14 19:47:45');
insert into trips (trip_id, route_id, train_id, time) values (495, 97, 4, '2021-10-15 23:55:52');
insert into trips (trip_id, route_id, train_id, time) values (496, 29, 2, '2022-07-08 08:05:33');
insert into trips (trip_id, route_id, train_id, time) values (497, 42, 1, '2022-05-22 13:28:23');
insert into trips (trip_id, route_id, train_id, time) values (498, 67, 1, '2021-09-13 21:38:13');
insert into trips (trip_id, route_id, train_id, time) values (499, 99, 5, '2021-09-14 20:19:30');
insert into trips (trip_id, route_id, train_id, time) values (500, 55, 1, '2022-01-21 21:11:19');
insert into trips (trip_id, route_id, train_id, time) values (501, 51, 2, '2022-07-27 12:34:55');
insert into trips (trip_id, route_id, train_id, time) values (502, 84, 4, '2022-02-19 20:43:17');
insert into trips (trip_id, route_id, train_id, time) values (503, 28, 4, '2022-07-27 10:23:13');
insert into trips (trip_id, route_id, train_id, time) values (504, 78, 3, '2022-07-26 06:14:18');
insert into trips (trip_id, route_id, train_id, time) values (505, 8, 2, '2021-12-02 23:22:34');
insert into trips (trip_id, route_id, train_id, time) values (506, 77, 1, '2021-10-03 06:47:46');
insert into trips (trip_id, route_id, train_id, time) values (507, 27, 1, '2021-12-12 09:41:30');
insert into trips (trip_id, route_id, train_id, time) values (508, 29, 2, '2021-10-24 07:27:25');
insert into trips (trip_id, route_id, train_id, time) values (509, 32, 4, '2022-04-20 22:19:08');
insert into trips (trip_id, route_id, train_id, time) values (510, 1, 4, '2021-07-23 16:11:13');
insert into trips (trip_id, route_id, train_id, time) values (511, 95, 3, '2021-12-03 03:43:41');
insert into trips (trip_id, route_id, train_id, time) values (512, 67, 4, '2021-07-17 16:42:08');
insert into trips (trip_id, route_id, train_id, time) values (513, 23, 5, '2021-08-12 04:31:42');
insert into trips (trip_id, route_id, train_id, time) values (514, 40, 4, '2021-10-04 00:11:38');
insert into trips (trip_id, route_id, train_id, time) values (515, 30, 3, '2022-07-13 16:45:32');
insert into trips (trip_id, route_id, train_id, time) values (516, 51, 3, '2022-02-11 16:50:33');
insert into trips (trip_id, route_id, train_id, time) values (517, 97, 4, '2022-07-25 03:20:22');
insert into trips (trip_id, route_id, train_id, time) values (518, 7, 1, '2021-12-18 17:40:21');
insert into trips (trip_id, route_id, train_id, time) values (519, 48, 5, '2021-11-04 19:20:13');
insert into trips (trip_id, route_id, train_id, time) values (520, 68, 5, '2021-08-15 22:59:13');
insert into trips (trip_id, route_id, train_id, time) values (521, 41, 4, '2021-08-04 11:16:45');
insert into trips (trip_id, route_id, train_id, time) values (522, 12, 4, '2022-07-08 05:38:52');
insert into trips (trip_id, route_id, train_id, time) values (523, 94, 5, '2021-09-29 14:05:49');
insert into trips (trip_id, route_id, train_id, time) values (524, 72, 3, '2021-09-12 09:40:52');
insert into trips (trip_id, route_id, train_id, time) values (525, 33, 4, '2021-08-18 17:49:48');
insert into trips (trip_id, route_id, train_id, time) values (526, 36, 1, '2021-12-14 16:02:40');
insert into trips (trip_id, route_id, train_id, time) values (527, 100, 2, '2022-02-17 07:44:02');
insert into trips (trip_id, route_id, train_id, time) values (528, 97, 3, '2022-06-02 01:35:48');
insert into trips (trip_id, route_id, train_id, time) values (529, 20, 3, '2022-06-07 20:54:11');
insert into trips (trip_id, route_id, train_id, time) values (530, 55, 2, '2021-12-24 16:45:17');
insert into trips (trip_id, route_id, train_id, time) values (531, 88, 2, '2022-03-02 11:57:18');
insert into trips (trip_id, route_id, train_id, time) values (532, 25, 2, '2022-04-02 12:54:49');
insert into trips (trip_id, route_id, train_id, time) values (533, 66, 5, '2022-04-27 22:12:21');
insert into trips (trip_id, route_id, train_id, time) values (534, 5, 3, '2021-08-12 22:55:45');
insert into trips (trip_id, route_id, train_id, time) values (535, 14, 3, '2021-09-07 19:54:19');
insert into trips (trip_id, route_id, train_id, time) values (536, 65, 2, '2022-07-02 14:45:41');
insert into trips (trip_id, route_id, train_id, time) values (537, 83, 2, '2021-07-19 05:07:26');
insert into trips (trip_id, route_id, train_id, time) values (538, 1, 3, '2022-04-17 12:09:13');
insert into trips (trip_id, route_id, train_id, time) values (539, 51, 2, '2022-06-20 19:50:06');
insert into trips (trip_id, route_id, train_id, time) values (540, 10, 1, '2022-06-13 03:21:31');
insert into trips (trip_id, route_id, train_id, time) values (541, 88, 5, '2022-05-02 12:38:17');
insert into trips (trip_id, route_id, train_id, time) values (542, 42, 1, '2021-12-18 19:48:40');
insert into trips (trip_id, route_id, train_id, time) values (543, 11, 3, '2021-12-31 08:55:15');
insert into trips (trip_id, route_id, train_id, time) values (544, 56, 5, '2021-08-23 13:38:59');
insert into trips (trip_id, route_id, train_id, time) values (545, 31, 1, '2022-03-28 11:49:34');
insert into trips (trip_id, route_id, train_id, time) values (546, 90, 1, '2021-07-24 16:45:26');
insert into trips (trip_id, route_id, train_id, time) values (547, 66, 3, '2021-11-14 02:26:01');
insert into trips (trip_id, route_id, train_id, time) values (548, 8, 4, '2022-07-21 12:22:28');
insert into trips (trip_id, route_id, train_id, time) values (549, 72, 2, '2022-01-15 18:13:18');
insert into trips (trip_id, route_id, train_id, time) values (550, 71, 2, '2021-09-23 13:03:20');
insert into trips (trip_id, route_id, train_id, time) values (551, 28, 4, '2021-10-19 18:13:23');
insert into trips (trip_id, route_id, train_id, time) values (552, 80, 3, '2022-05-17 06:01:55');
insert into trips (trip_id, route_id, train_id, time) values (553, 94, 2, '2021-09-12 03:34:02');
insert into trips (trip_id, route_id, train_id, time) values (554, 50, 1, '2021-09-19 01:40:13');
insert into trips (trip_id, route_id, train_id, time) values (555, 89, 1, '2022-02-12 15:21:42');
insert into trips (trip_id, route_id, train_id, time) values (556, 11, 1, '2022-03-13 18:44:47');
insert into trips (trip_id, route_id, train_id, time) values (557, 34, 5, '2022-06-11 10:37:36');
insert into trips (trip_id, route_id, train_id, time) values (558, 59, 2, '2022-02-13 14:12:03');
insert into trips (trip_id, route_id, train_id, time) values (559, 29, 2, '2021-10-13 10:33:50');
insert into trips (trip_id, route_id, train_id, time) values (560, 83, 3, '2022-07-12 18:18:05');
insert into trips (trip_id, route_id, train_id, time) values (561, 32, 1, '2021-09-15 19:06:18');
insert into trips (trip_id, route_id, train_id, time) values (562, 3, 3, '2022-05-12 07:34:50');
insert into trips (trip_id, route_id, train_id, time) values (563, 19, 5, '2022-07-07 13:09:07');
insert into trips (trip_id, route_id, train_id, time) values (564, 85, 4, '2022-06-21 08:31:43');
insert into trips (trip_id, route_id, train_id, time) values (565, 62, 3, '2022-03-31 02:22:03');
insert into trips (trip_id, route_id, train_id, time) values (566, 62, 3, '2021-07-18 03:47:14');
insert into trips (trip_id, route_id, train_id, time) values (567, 5, 3, '2022-05-26 23:21:10');
insert into trips (trip_id, route_id, train_id, time) values (568, 98, 5, '2021-09-25 18:40:35');
insert into trips (trip_id, route_id, train_id, time) values (569, 92, 3, '2021-11-02 09:24:21');
insert into trips (trip_id, route_id, train_id, time) values (570, 28, 2, '2022-01-18 12:28:49');
insert into trips (trip_id, route_id, train_id, time) values (571, 6, 3, '2021-10-03 10:59:50');
insert into trips (trip_id, route_id, train_id, time) values (572, 39, 5, '2021-12-17 00:58:09');
insert into trips (trip_id, route_id, train_id, time) values (573, 87, 1, '2022-03-20 22:11:25');
insert into trips (trip_id, route_id, train_id, time) values (574, 37, 3, '2022-06-19 14:50:47');
insert into trips (trip_id, route_id, train_id, time) values (575, 50, 4, '2022-07-08 02:09:56');
insert into trips (trip_id, route_id, train_id, time) values (576, 97, 3, '2021-10-24 12:03:44');
insert into trips (trip_id, route_id, train_id, time) values (577, 21, 2, '2022-02-24 22:25:32');
insert into trips (trip_id, route_id, train_id, time) values (578, 41, 2, '2022-03-09 19:23:52');
insert into trips (trip_id, route_id, train_id, time) values (579, 17, 1, '2022-03-03 06:47:20');
insert into trips (trip_id, route_id, train_id, time) values (580, 85, 2, '2022-03-22 02:47:31');
insert into trips (trip_id, route_id, train_id, time) values (581, 69, 1, '2022-03-01 20:10:26');
insert into trips (trip_id, route_id, train_id, time) values (582, 5, 3, '2022-01-28 07:48:52');
insert into trips (trip_id, route_id, train_id, time) values (583, 21, 1, '2021-09-24 01:29:13');
insert into trips (trip_id, route_id, train_id, time) values (584, 40, 2, '2021-10-15 10:23:26');
insert into trips (trip_id, route_id, train_id, time) values (585, 61, 1, '2022-01-26 19:38:29');
insert into trips (trip_id, route_id, train_id, time) values (586, 76, 1, '2021-11-20 02:45:18');
insert into trips (trip_id, route_id, train_id, time) values (587, 16, 2, '2022-02-21 16:30:52');
insert into trips (trip_id, route_id, train_id, time) values (588, 62, 2, '2022-04-04 04:21:46');
insert into trips (trip_id, route_id, train_id, time) values (589, 15, 4, '2021-11-13 05:09:45');
insert into trips (trip_id, route_id, train_id, time) values (590, 90, 1, '2021-12-28 01:25:12');
insert into trips (trip_id, route_id, train_id, time) values (591, 62, 2, '2021-09-02 00:48:44');
insert into trips (trip_id, route_id, train_id, time) values (592, 99, 4, '2022-01-18 00:29:57');
insert into trips (trip_id, route_id, train_id, time) values (593, 35, 5, '2022-06-09 08:41:19');
insert into trips (trip_id, route_id, train_id, time) values (594, 68, 2, '2022-05-11 18:08:23');
insert into trips (trip_id, route_id, train_id, time) values (595, 28, 5, '2021-10-17 16:18:21');
insert into trips (trip_id, route_id, train_id, time) values (596, 89, 1, '2021-11-03 23:01:27');
insert into trips (trip_id, route_id, train_id, time) values (597, 42, 2, '2021-10-28 18:42:15');
insert into trips (trip_id, route_id, train_id, time) values (598, 14, 2, '2021-08-13 20:22:55');
insert into trips (trip_id, route_id, train_id, time) values (599, 45, 4, '2021-11-13 19:15:10');
insert into trips (trip_id, route_id, train_id, time) values (600, 37, 4, '2021-09-21 02:51:12');
insert into trips (trip_id, route_id, train_id, time) values (601, 35, 4, '2022-01-30 11:14:13');
insert into trips (trip_id, route_id, train_id, time) values (602, 33, 1, '2021-11-15 05:32:40');
insert into trips (trip_id, route_id, train_id, time) values (603, 37, 5, '2022-07-16 21:41:29');
insert into trips (trip_id, route_id, train_id, time) values (604, 27, 2, '2022-03-28 05:58:41');
insert into trips (trip_id, route_id, train_id, time) values (605, 51, 3, '2022-04-23 17:25:59');
insert into trips (trip_id, route_id, train_id, time) values (606, 77, 2, '2022-03-29 00:12:37');
insert into trips (trip_id, route_id, train_id, time) values (607, 46, 5, '2022-03-22 22:52:45');
insert into trips (trip_id, route_id, train_id, time) values (608, 11, 1, '2022-06-19 15:58:44');
insert into trips (trip_id, route_id, train_id, time) values (609, 95, 2, '2022-06-24 12:10:43');
insert into trips (trip_id, route_id, train_id, time) values (610, 99, 4, '2021-07-26 07:51:51');
insert into trips (trip_id, route_id, train_id, time) values (611, 55, 1, '2022-01-07 17:14:03');
insert into trips (trip_id, route_id, train_id, time) values (612, 100, 5, '2021-07-27 22:51:43');
insert into trips (trip_id, route_id, train_id, time) values (613, 42, 3, '2021-12-20 23:02:37');
insert into trips (trip_id, route_id, train_id, time) values (614, 24, 1, '2021-09-03 14:44:12');
insert into trips (trip_id, route_id, train_id, time) values (615, 95, 5, '2021-09-23 13:07:33');
insert into trips (trip_id, route_id, train_id, time) values (616, 51, 3, '2022-07-26 11:14:17');
insert into trips (trip_id, route_id, train_id, time) values (617, 88, 2, '2021-07-18 04:49:57');
insert into trips (trip_id, route_id, train_id, time) values (618, 98, 3, '2022-04-28 03:51:38');
insert into trips (trip_id, route_id, train_id, time) values (619, 24, 5, '2021-10-14 04:27:47');
insert into trips (trip_id, route_id, train_id, time) values (620, 65, 3, '2021-11-24 00:43:10');
insert into trips (trip_id, route_id, train_id, time) values (621, 87, 4, '2022-06-12 14:15:47');
insert into trips (trip_id, route_id, train_id, time) values (622, 50, 3, '2021-12-21 04:37:48');
insert into trips (trip_id, route_id, train_id, time) values (623, 92, 4, '2021-09-13 04:33:16');
insert into trips (trip_id, route_id, train_id, time) values (624, 16, 1, '2022-01-04 02:57:37');
insert into trips (trip_id, route_id, train_id, time) values (625, 71, 1, '2021-10-11 15:49:39');
insert into trips (trip_id, route_id, train_id, time) values (626, 6, 3, '2021-10-01 17:58:43');
insert into trips (trip_id, route_id, train_id, time) values (627, 11, 5, '2021-10-05 22:26:06');
insert into trips (trip_id, route_id, train_id, time) values (628, 50, 5, '2022-05-10 02:56:02');
insert into trips (trip_id, route_id, train_id, time) values (629, 96, 5, '2022-01-12 08:36:11');
insert into trips (trip_id, route_id, train_id, time) values (630, 98, 3, '2021-12-22 20:00:19');
insert into trips (trip_id, route_id, train_id, time) values (631, 29, 1, '2021-11-08 02:45:50');
insert into trips (trip_id, route_id, train_id, time) values (632, 63, 1, '2022-03-25 19:59:25');
insert into trips (trip_id, route_id, train_id, time) values (633, 71, 4, '2022-03-05 22:24:25');
insert into trips (trip_id, route_id, train_id, time) values (634, 10, 5, '2022-06-09 14:35:26');
insert into trips (trip_id, route_id, train_id, time) values (635, 95, 3, '2022-01-02 09:20:18');
insert into trips (trip_id, route_id, train_id, time) values (636, 15, 3, '2021-12-26 14:20:46');
insert into trips (trip_id, route_id, train_id, time) values (637, 94, 2, '2022-05-04 13:02:08');
insert into trips (trip_id, route_id, train_id, time) values (638, 38, 3, '2022-07-19 17:09:48');
insert into trips (trip_id, route_id, train_id, time) values (639, 92, 5, '2022-06-07 01:08:46');
insert into trips (trip_id, route_id, train_id, time) values (640, 26, 4, '2022-04-17 21:10:38');
insert into trips (trip_id, route_id, train_id, time) values (641, 74, 2, '2021-07-27 02:17:28');
insert into trips (trip_id, route_id, train_id, time) values (642, 90, 4, '2022-07-19 03:07:17');
insert into trips (trip_id, route_id, train_id, time) values (643, 77, 3, '2022-02-25 03:55:53');
insert into trips (trip_id, route_id, train_id, time) values (644, 10, 1, '2021-10-28 11:25:35');
insert into trips (trip_id, route_id, train_id, time) values (645, 64, 3, '2021-10-02 15:04:35');
insert into trips (trip_id, route_id, train_id, time) values (646, 10, 2, '2021-11-29 06:38:37');
insert into trips (trip_id, route_id, train_id, time) values (647, 83, 5, '2022-02-27 12:39:38');
insert into trips (trip_id, route_id, train_id, time) values (648, 14, 2, '2021-07-24 22:32:33');
insert into trips (trip_id, route_id, train_id, time) values (649, 91, 4, '2022-06-07 05:37:03');
insert into trips (trip_id, route_id, train_id, time) values (650, 73, 5, '2021-11-21 02:05:41');
insert into trips (trip_id, route_id, train_id, time) values (651, 100, 5, '2021-10-30 14:41:25');
insert into trips (trip_id, route_id, train_id, time) values (652, 46, 4, '2021-09-18 01:18:18');
insert into trips (trip_id, route_id, train_id, time) values (653, 61, 2, '2022-03-19 03:19:16');
insert into trips (trip_id, route_id, train_id, time) values (654, 78, 3, '2022-05-07 22:33:51');
insert into trips (trip_id, route_id, train_id, time) values (655, 2, 1, '2021-07-15 05:11:25');
insert into trips (trip_id, route_id, train_id, time) values (656, 18, 2, '2022-07-02 09:27:25');
insert into trips (trip_id, route_id, train_id, time) values (657, 76, 5, '2021-08-07 09:37:43');
insert into trips (trip_id, route_id, train_id, time) values (658, 54, 3, '2022-02-15 15:20:21');
insert into trips (trip_id, route_id, train_id, time) values (659, 40, 2, '2022-06-30 06:06:46');
insert into trips (trip_id, route_id, train_id, time) values (660, 56, 5, '2021-09-04 12:03:43');
insert into trips (trip_id, route_id, train_id, time) values (661, 58, 3, '2022-02-02 21:01:10');
insert into trips (trip_id, route_id, train_id, time) values (662, 4, 2, '2022-06-11 18:02:59');
insert into trips (trip_id, route_id, train_id, time) values (663, 55, 4, '2022-07-09 11:19:07');
insert into trips (trip_id, route_id, train_id, time) values (664, 86, 5, '2021-12-10 04:39:34');
insert into trips (trip_id, route_id, train_id, time) values (665, 7, 4, '2021-10-25 00:53:32');
insert into trips (trip_id, route_id, train_id, time) values (666, 15, 2, '2022-07-21 20:33:33');
insert into trips (trip_id, route_id, train_id, time) values (667, 23, 5, '2021-10-26 19:01:02');
insert into trips (trip_id, route_id, train_id, time) values (668, 92, 4, '2021-10-13 13:14:54');
insert into trips (trip_id, route_id, train_id, time) values (669, 79, 3, '2021-09-16 11:33:55');
insert into trips (trip_id, route_id, train_id, time) values (670, 75, 5, '2021-12-09 02:32:47');
insert into trips (trip_id, route_id, train_id, time) values (671, 95, 4, '2022-06-30 22:30:59');
insert into trips (trip_id, route_id, train_id, time) values (672, 35, 3, '2022-02-20 14:52:17');
insert into trips (trip_id, route_id, train_id, time) values (673, 19, 5, '2021-11-21 12:57:01');
insert into trips (trip_id, route_id, train_id, time) values (674, 81, 1, '2022-07-22 06:49:48');
insert into trips (trip_id, route_id, train_id, time) values (675, 80, 3, '2022-03-05 18:12:18');
insert into trips (trip_id, route_id, train_id, time) values (676, 55, 2, '2022-07-27 14:04:57');
insert into trips (trip_id, route_id, train_id, time) values (677, 31, 3, '2022-07-26 06:05:23');
insert into trips (trip_id, route_id, train_id, time) values (678, 89, 1, '2022-07-06 01:42:21');
insert into trips (trip_id, route_id, train_id, time) values (679, 57, 3, '2022-05-15 18:00:28');
insert into trips (trip_id, route_id, train_id, time) values (680, 88, 4, '2022-07-26 04:49:15');
insert into trips (trip_id, route_id, train_id, time) values (681, 58, 1, '2022-07-02 04:43:50');
insert into trips (trip_id, route_id, train_id, time) values (682, 11, 2, '2022-04-19 22:07:38');
insert into trips (trip_id, route_id, train_id, time) values (683, 23, 3, '2022-05-07 09:15:23');
insert into trips (trip_id, route_id, train_id, time) values (684, 50, 2, '2022-05-18 00:12:07');
insert into trips (trip_id, route_id, train_id, time) values (685, 42, 4, '2021-07-19 13:37:29');
insert into trips (trip_id, route_id, train_id, time) values (686, 16, 2, '2021-09-08 13:02:23');
insert into trips (trip_id, route_id, train_id, time) values (687, 12, 3, '2021-10-01 23:07:05');
insert into trips (trip_id, route_id, train_id, time) values (688, 25, 4, '2021-10-22 12:12:00');
insert into trips (trip_id, route_id, train_id, time) values (689, 20, 3, '2021-12-15 05:07:33');
insert into trips (trip_id, route_id, train_id, time) values (690, 90, 2, '2021-12-08 15:54:20');
insert into trips (trip_id, route_id, train_id, time) values (691, 8, 1, '2021-08-15 01:48:11');
insert into trips (trip_id, route_id, train_id, time) values (692, 70, 4, '2022-02-07 19:24:17');
insert into trips (trip_id, route_id, train_id, time) values (693, 19, 3, '2022-05-08 13:44:48');
insert into trips (trip_id, route_id, train_id, time) values (694, 94, 5, '2021-12-26 04:37:34');
insert into trips (trip_id, route_id, train_id, time) values (695, 50, 2, '2022-04-26 15:49:27');
insert into trips (trip_id, route_id, train_id, time) values (696, 81, 4, '2021-09-22 04:33:41');
insert into trips (trip_id, route_id, train_id, time) values (697, 15, 1, '2022-04-14 08:35:25');
insert into trips (trip_id, route_id, train_id, time) values (698, 44, 5, '2022-05-15 20:41:25');
insert into trips (trip_id, route_id, train_id, time) values (699, 58, 1, '2022-06-21 03:47:14');
insert into trips (trip_id, route_id, train_id, time) values (700, 87, 1, '2021-09-20 09:20:14');
insert into trips (trip_id, route_id, train_id, time) values (701, 15, 2, '2022-03-29 21:37:07');
insert into trips (trip_id, route_id, train_id, time) values (702, 52, 1, '2022-05-10 07:51:31');
insert into trips (trip_id, route_id, train_id, time) values (703, 23, 2, '2021-10-03 03:48:24');
insert into trips (trip_id, route_id, train_id, time) values (704, 72, 3, '2021-10-28 05:16:15');
insert into trips (trip_id, route_id, train_id, time) values (705, 92, 4, '2021-09-22 09:00:06');
insert into trips (trip_id, route_id, train_id, time) values (706, 40, 5, '2021-08-06 03:28:03');
insert into trips (trip_id, route_id, train_id, time) values (707, 98, 2, '2021-07-20 12:01:22');
insert into trips (trip_id, route_id, train_id, time) values (708, 34, 1, '2021-12-23 00:21:42');
insert into trips (trip_id, route_id, train_id, time) values (709, 35, 5, '2022-03-19 15:06:54');
insert into trips (trip_id, route_id, train_id, time) values (710, 63, 1, '2022-07-11 09:45:57');
insert into trips (trip_id, route_id, train_id, time) values (711, 18, 3, '2021-10-15 16:00:20');
insert into trips (trip_id, route_id, train_id, time) values (712, 46, 5, '2022-06-21 01:45:39');
insert into trips (trip_id, route_id, train_id, time) values (713, 29, 2, '2021-07-23 15:58:50');
insert into trips (trip_id, route_id, train_id, time) values (714, 79, 2, '2022-03-28 12:33:14');
insert into trips (trip_id, route_id, train_id, time) values (715, 40, 4, '2021-12-15 00:06:09');
insert into trips (trip_id, route_id, train_id, time) values (716, 92, 1, '2021-12-02 01:18:27');
insert into trips (trip_id, route_id, train_id, time) values (717, 12, 2, '2022-05-22 02:37:22');
insert into trips (trip_id, route_id, train_id, time) values (718, 69, 4, '2022-02-19 00:20:37');
insert into trips (trip_id, route_id, train_id, time) values (719, 40, 2, '2022-07-20 07:13:07');
insert into trips (trip_id, route_id, train_id, time) values (720, 92, 5, '2022-04-15 21:11:23');
insert into trips (trip_id, route_id, train_id, time) values (721, 17, 4, '2021-10-03 22:06:50');
insert into trips (trip_id, route_id, train_id, time) values (722, 36, 2, '2021-08-04 21:00:21');
insert into trips (trip_id, route_id, train_id, time) values (723, 54, 2, '2022-07-09 04:28:16');
insert into trips (trip_id, route_id, train_id, time) values (724, 95, 2, '2022-04-01 23:20:36');
insert into trips (trip_id, route_id, train_id, time) values (725, 53, 5, '2021-07-21 10:25:34');
insert into trips (trip_id, route_id, train_id, time) values (726, 76, 5, '2021-09-26 08:50:58');
insert into trips (trip_id, route_id, train_id, time) values (727, 48, 4, '2022-07-17 19:26:51');
insert into trips (trip_id, route_id, train_id, time) values (728, 7, 5, '2021-08-30 18:02:57');
insert into trips (trip_id, route_id, train_id, time) values (729, 83, 3, '2021-10-15 08:51:06');
insert into trips (trip_id, route_id, train_id, time) values (730, 24, 3, '2022-02-16 04:18:03');
insert into trips (trip_id, route_id, train_id, time) values (731, 14, 2, '2021-12-24 15:17:56');
insert into trips (trip_id, route_id, train_id, time) values (732, 54, 1, '2021-10-21 03:35:20');
insert into trips (trip_id, route_id, train_id, time) values (733, 23, 5, '2022-01-02 10:18:42');
insert into trips (trip_id, route_id, train_id, time) values (734, 41, 2, '2021-08-06 23:16:11');
insert into trips (trip_id, route_id, train_id, time) values (735, 82, 3, '2021-12-04 03:26:55');
insert into trips (trip_id, route_id, train_id, time) values (736, 87, 1, '2022-05-03 10:03:43');
insert into trips (trip_id, route_id, train_id, time) values (737, 7, 3, '2022-05-21 22:46:49');
insert into trips (trip_id, route_id, train_id, time) values (738, 60, 1, '2021-11-29 21:05:12');
insert into trips (trip_id, route_id, train_id, time) values (739, 5, 1, '2022-04-11 11:01:03');
insert into trips (trip_id, route_id, train_id, time) values (740, 52, 2, '2022-01-18 21:05:59');
insert into trips (trip_id, route_id, train_id, time) values (741, 98, 2, '2022-06-20 22:26:37');
insert into trips (trip_id, route_id, train_id, time) values (742, 50, 5, '2022-02-15 17:48:50');
insert into trips (trip_id, route_id, train_id, time) values (743, 75, 4, '2021-09-16 13:56:58');
insert into trips (trip_id, route_id, train_id, time) values (744, 88, 3, '2021-12-17 08:50:20');
insert into trips (trip_id, route_id, train_id, time) values (745, 48, 1, '2021-11-13 18:22:56');
insert into trips (trip_id, route_id, train_id, time) values (746, 66, 4, '2022-03-09 10:03:47');
insert into trips (trip_id, route_id, train_id, time) values (747, 52, 1, '2022-02-21 22:34:35');
insert into trips (trip_id, route_id, train_id, time) values (748, 30, 2, '2022-04-22 16:55:44');
insert into trips (trip_id, route_id, train_id, time) values (749, 28, 2, '2021-12-13 01:18:12');
insert into trips (trip_id, route_id, train_id, time) values (750, 7, 5, '2021-12-24 12:04:41');
insert into trips (trip_id, route_id, train_id, time) values (751, 27, 3, '2021-08-05 04:36:44');
insert into trips (trip_id, route_id, train_id, time) values (752, 59, 3, '2021-09-15 19:51:45');
insert into trips (trip_id, route_id, train_id, time) values (753, 73, 5, '2021-09-30 22:18:11');
insert into trips (trip_id, route_id, train_id, time) values (754, 31, 2, '2021-07-31 01:52:44');
insert into trips (trip_id, route_id, train_id, time) values (755, 10, 4, '2021-11-12 23:55:01');
insert into trips (trip_id, route_id, train_id, time) values (756, 89, 2, '2021-12-21 09:37:30');
insert into trips (trip_id, route_id, train_id, time) values (757, 94, 5, '2021-11-06 18:06:51');
insert into trips (trip_id, route_id, train_id, time) values (758, 55, 3, '2022-01-05 18:21:42');
insert into trips (trip_id, route_id, train_id, time) values (759, 15, 4, '2021-10-25 06:09:37');
insert into trips (trip_id, route_id, train_id, time) values (760, 87, 2, '2021-11-10 07:00:34');
insert into trips (trip_id, route_id, train_id, time) values (761, 14, 4, '2022-05-09 20:37:44');
insert into trips (trip_id, route_id, train_id, time) values (762, 32, 4, '2021-09-05 10:44:54');
insert into trips (trip_id, route_id, train_id, time) values (763, 63, 2, '2022-06-02 22:18:55');
insert into trips (trip_id, route_id, train_id, time) values (764, 12, 4, '2022-03-16 12:38:21');
insert into trips (trip_id, route_id, train_id, time) values (765, 43, 3, '2021-12-27 15:00:21');
insert into trips (trip_id, route_id, train_id, time) values (766, 16, 4, '2022-01-30 21:11:28');
insert into trips (trip_id, route_id, train_id, time) values (767, 28, 1, '2021-10-29 09:25:57');
insert into trips (trip_id, route_id, train_id, time) values (768, 82, 5, '2021-12-21 21:17:03');
insert into trips (trip_id, route_id, train_id, time) values (769, 91, 1, '2022-06-02 01:06:00');
insert into trips (trip_id, route_id, train_id, time) values (770, 88, 4, '2022-04-11 01:44:03');
insert into trips (trip_id, route_id, train_id, time) values (771, 86, 4, '2021-12-17 03:05:13');
insert into trips (trip_id, route_id, train_id, time) values (772, 54, 1, '2022-07-06 14:07:31');
insert into trips (trip_id, route_id, train_id, time) values (773, 4, 3, '2022-07-20 00:47:58');
insert into trips (trip_id, route_id, train_id, time) values (774, 85, 2, '2021-11-01 00:15:48');
insert into trips (trip_id, route_id, train_id, time) values (775, 25, 5, '2021-10-22 19:38:51');
insert into trips (trip_id, route_id, train_id, time) values (776, 84, 3, '2021-12-15 21:54:13');
insert into trips (trip_id, route_id, train_id, time) values (777, 70, 2, '2022-04-30 02:32:16');
insert into trips (trip_id, route_id, train_id, time) values (778, 91, 1, '2022-05-19 01:47:13');
insert into trips (trip_id, route_id, train_id, time) values (779, 71, 5, '2021-11-02 00:59:35');
insert into trips (trip_id, route_id, train_id, time) values (780, 69, 2, '2021-09-12 01:20:41');
insert into trips (trip_id, route_id, train_id, time) values (781, 72, 2, '2022-01-07 06:39:23');
insert into trips (trip_id, route_id, train_id, time) values (782, 80, 4, '2022-03-31 08:01:38');
insert into trips (trip_id, route_id, train_id, time) values (783, 67, 4, '2022-02-09 20:49:52');
insert into trips (trip_id, route_id, train_id, time) values (784, 56, 5, '2022-03-20 14:07:19');
insert into trips (trip_id, route_id, train_id, time) values (785, 88, 3, '2022-03-22 02:00:29');
insert into trips (trip_id, route_id, train_id, time) values (786, 15, 5, '2021-08-26 11:28:55');
insert into trips (trip_id, route_id, train_id, time) values (787, 60, 2, '2022-05-09 03:14:33');
insert into trips (trip_id, route_id, train_id, time) values (788, 60, 2, '2021-11-28 13:32:50');
insert into trips (trip_id, route_id, train_id, time) values (789, 68, 1, '2021-10-16 12:40:37');
insert into trips (trip_id, route_id, train_id, time) values (790, 59, 1, '2021-09-25 15:02:27');
insert into trips (trip_id, route_id, train_id, time) values (791, 98, 2, '2022-02-03 08:50:14');
insert into trips (trip_id, route_id, train_id, time) values (792, 35, 4, '2022-06-19 17:33:28');
insert into trips (trip_id, route_id, train_id, time) values (793, 93, 3, '2022-03-23 12:23:11');
insert into trips (trip_id, route_id, train_id, time) values (794, 17, 2, '2021-09-28 07:33:25');
insert into trips (trip_id, route_id, train_id, time) values (795, 84, 5, '2021-12-10 03:57:59');
insert into trips (trip_id, route_id, train_id, time) values (796, 41, 4, '2022-06-08 02:42:03');
insert into trips (trip_id, route_id, train_id, time) values (797, 70, 3, '2022-02-13 15:27:40');
insert into trips (trip_id, route_id, train_id, time) values (798, 24, 3, '2021-08-12 14:14:51');
insert into trips (trip_id, route_id, train_id, time) values (799, 44, 3, '2022-07-29 02:13:41');
insert into trips (trip_id, route_id, train_id, time) values (800, 6, 4, '2022-07-07 00:15:13');
insert into trips (trip_id, route_id, train_id, time) values (801, 5, 2, '2021-11-25 04:04:35');
insert into trips (trip_id, route_id, train_id, time) values (802, 3, 3, '2021-12-06 22:06:27');
insert into trips (trip_id, route_id, train_id, time) values (803, 1, 5, '2022-07-10 23:18:10');
insert into trips (trip_id, route_id, train_id, time) values (804, 20, 1, '2022-06-04 03:10:15');
insert into trips (trip_id, route_id, train_id, time) values (805, 10, 4, '2022-04-21 22:03:31');
insert into trips (trip_id, route_id, train_id, time) values (806, 8, 4, '2022-01-09 09:38:42');
insert into trips (trip_id, route_id, train_id, time) values (807, 50, 5, '2022-01-13 03:30:00');
insert into trips (trip_id, route_id, train_id, time) values (808, 69, 2, '2022-04-03 20:12:17');
insert into trips (trip_id, route_id, train_id, time) values (809, 31, 1, '2022-01-01 02:20:02');
insert into trips (trip_id, route_id, train_id, time) values (810, 86, 4, '2021-11-07 23:51:07');
insert into trips (trip_id, route_id, train_id, time) values (811, 60, 2, '2022-05-31 07:00:59');
insert into trips (trip_id, route_id, train_id, time) values (812, 32, 4, '2021-10-02 18:27:26');
insert into trips (trip_id, route_id, train_id, time) values (813, 53, 2, '2022-04-24 12:53:18');
insert into trips (trip_id, route_id, train_id, time) values (814, 63, 3, '2021-09-17 15:44:14');
insert into trips (trip_id, route_id, train_id, time) values (815, 63, 2, '2022-06-09 04:33:39');
insert into trips (trip_id, route_id, train_id, time) values (816, 48, 3, '2022-06-17 17:22:36');
insert into trips (trip_id, route_id, train_id, time) values (817, 53, 5, '2021-09-06 08:21:32');
insert into trips (trip_id, route_id, train_id, time) values (818, 51, 1, '2022-02-14 18:01:34');
insert into trips (trip_id, route_id, train_id, time) values (819, 23, 2, '2022-04-17 13:14:11');
insert into trips (trip_id, route_id, train_id, time) values (820, 44, 1, '2021-09-09 07:56:16');
insert into trips (trip_id, route_id, train_id, time) values (821, 95, 1, '2021-10-30 07:25:20');
insert into trips (trip_id, route_id, train_id, time) values (822, 65, 4, '2021-07-23 19:29:02');
insert into trips (trip_id, route_id, train_id, time) values (823, 32, 1, '2022-07-10 06:23:26');
insert into trips (trip_id, route_id, train_id, time) values (824, 30, 3, '2022-02-09 12:41:05');
insert into trips (trip_id, route_id, train_id, time) values (825, 37, 3, '2021-10-28 02:34:36');
insert into trips (trip_id, route_id, train_id, time) values (826, 8, 3, '2021-11-09 04:30:51');
insert into trips (trip_id, route_id, train_id, time) values (827, 85, 4, '2021-07-28 23:22:56');
insert into trips (trip_id, route_id, train_id, time) values (828, 69, 1, '2022-06-23 09:24:02');
insert into trips (trip_id, route_id, train_id, time) values (829, 40, 5, '2021-10-27 03:56:54');
insert into trips (trip_id, route_id, train_id, time) values (830, 7, 4, '2022-02-19 09:40:34');
insert into trips (trip_id, route_id, train_id, time) values (831, 27, 2, '2022-04-13 15:32:31');
insert into trips (trip_id, route_id, train_id, time) values (832, 5, 4, '2021-09-04 13:10:59');
insert into trips (trip_id, route_id, train_id, time) values (833, 61, 1, '2022-04-02 14:31:55');
insert into trips (trip_id, route_id, train_id, time) values (834, 47, 5, '2021-08-21 11:15:26');
insert into trips (trip_id, route_id, train_id, time) values (835, 39, 5, '2022-07-03 02:09:31');
insert into trips (trip_id, route_id, train_id, time) values (836, 60, 3, '2021-08-22 04:36:15');
insert into trips (trip_id, route_id, train_id, time) values (837, 60, 3, '2021-10-15 20:29:31');
insert into trips (trip_id, route_id, train_id, time) values (838, 72, 5, '2021-07-20 17:11:37');
insert into trips (trip_id, route_id, train_id, time) values (839, 100, 1, '2022-01-05 16:44:46');
insert into trips (trip_id, route_id, train_id, time) values (840, 86, 2, '2022-06-27 15:26:52');
insert into trips (trip_id, route_id, train_id, time) values (841, 93, 5, '2022-03-29 23:05:40');
insert into trips (trip_id, route_id, train_id, time) values (842, 86, 5, '2022-01-21 12:56:08');
insert into trips (trip_id, route_id, train_id, time) values (843, 86, 5, '2022-05-12 18:16:50');
insert into trips (trip_id, route_id, train_id, time) values (844, 8, 1, '2022-04-02 15:29:06');
insert into trips (trip_id, route_id, train_id, time) values (845, 6, 1, '2022-01-06 08:31:15');
insert into trips (trip_id, route_id, train_id, time) values (846, 31, 1, '2022-03-16 05:25:17');
insert into trips (trip_id, route_id, train_id, time) values (847, 20, 4, '2021-08-02 04:20:49');
insert into trips (trip_id, route_id, train_id, time) values (848, 46, 1, '2022-07-02 05:56:29');
insert into trips (trip_id, route_id, train_id, time) values (849, 17, 1, '2021-10-13 03:50:06');
insert into trips (trip_id, route_id, train_id, time) values (850, 32, 3, '2021-07-24 01:22:40');
insert into trips (trip_id, route_id, train_id, time) values (851, 91, 1, '2021-09-09 14:12:07');
insert into trips (trip_id, route_id, train_id, time) values (852, 2, 2, '2022-07-13 15:31:16');
insert into trips (trip_id, route_id, train_id, time) values (853, 46, 3, '2021-10-28 07:41:11');
insert into trips (trip_id, route_id, train_id, time) values (854, 36, 4, '2022-02-19 12:31:05');
insert into trips (trip_id, route_id, train_id, time) values (855, 4, 4, '2022-02-09 22:36:20');
insert into trips (trip_id, route_id, train_id, time) values (856, 73, 1, '2022-05-02 18:47:44');
insert into trips (trip_id, route_id, train_id, time) values (857, 33, 5, '2021-10-11 07:49:56');
insert into trips (trip_id, route_id, train_id, time) values (858, 62, 1, '2022-07-19 06:45:26');
insert into trips (trip_id, route_id, train_id, time) values (859, 17, 5, '2022-06-10 14:34:57');
insert into trips (trip_id, route_id, train_id, time) values (860, 28, 5, '2022-03-24 09:00:29');
insert into trips (trip_id, route_id, train_id, time) values (861, 10, 2, '2022-03-02 22:48:09');
insert into trips (trip_id, route_id, train_id, time) values (862, 3, 4, '2021-11-20 21:20:17');
insert into trips (trip_id, route_id, train_id, time) values (863, 47, 3, '2021-10-26 23:20:26');
insert into trips (trip_id, route_id, train_id, time) values (864, 87, 5, '2021-10-01 13:22:30');
insert into trips (trip_id, route_id, train_id, time) values (865, 63, 3, '2022-04-06 14:14:50');
insert into trips (trip_id, route_id, train_id, time) values (866, 72, 1, '2022-06-13 15:24:26');
insert into trips (trip_id, route_id, train_id, time) values (867, 89, 2, '2021-12-02 07:33:31');
insert into trips (trip_id, route_id, train_id, time) values (868, 25, 2, '2021-09-22 19:19:52');
insert into trips (trip_id, route_id, train_id, time) values (869, 24, 2, '2021-08-02 13:32:03');
insert into trips (trip_id, route_id, train_id, time) values (870, 88, 5, '2021-12-20 19:53:52');
insert into trips (trip_id, route_id, train_id, time) values (871, 31, 1, '2021-08-10 18:48:23');
insert into trips (trip_id, route_id, train_id, time) values (872, 79, 2, '2022-02-20 15:02:44');
insert into trips (trip_id, route_id, train_id, time) values (873, 70, 3, '2021-07-16 09:38:13');
insert into trips (trip_id, route_id, train_id, time) values (874, 48, 2, '2021-10-27 12:01:47');
insert into trips (trip_id, route_id, train_id, time) values (875, 61, 1, '2021-12-12 04:09:06');
insert into trips (trip_id, route_id, train_id, time) values (876, 43, 3, '2022-06-21 14:51:49');
insert into trips (trip_id, route_id, train_id, time) values (877, 10, 5, '2022-06-22 00:48:55');
insert into trips (trip_id, route_id, train_id, time) values (878, 30, 1, '2021-10-24 06:14:26');
insert into trips (trip_id, route_id, train_id, time) values (879, 77, 3, '2021-08-14 11:37:43');
insert into trips (trip_id, route_id, train_id, time) values (880, 37, 3, '2021-10-20 09:25:23');
insert into trips (trip_id, route_id, train_id, time) values (881, 1, 4, '2022-04-25 04:41:34');
insert into trips (trip_id, route_id, train_id, time) values (882, 79, 5, '2022-05-03 10:33:19');
insert into trips (trip_id, route_id, train_id, time) values (883, 69, 3, '2022-06-29 22:39:21');
insert into trips (trip_id, route_id, train_id, time) values (884, 96, 1, '2021-07-22 09:44:19');
insert into trips (trip_id, route_id, train_id, time) values (885, 21, 3, '2022-04-14 04:35:58');
insert into trips (trip_id, route_id, train_id, time) values (886, 88, 2, '2021-10-09 09:32:18');
insert into trips (trip_id, route_id, train_id, time) values (887, 98, 1, '2021-10-14 19:37:05');
insert into trips (trip_id, route_id, train_id, time) values (888, 46, 2, '2021-09-17 02:19:32');
insert into trips (trip_id, route_id, train_id, time) values (889, 100, 4, '2022-06-05 08:13:44');
insert into trips (trip_id, route_id, train_id, time) values (890, 74, 2, '2021-12-15 18:18:21');
insert into trips (trip_id, route_id, train_id, time) values (891, 89, 5, '2021-11-11 23:33:00');
insert into trips (trip_id, route_id, train_id, time) values (892, 82, 1, '2022-05-01 14:15:00');
insert into trips (trip_id, route_id, train_id, time) values (893, 91, 1, '2021-10-08 12:28:26');
insert into trips (trip_id, route_id, train_id, time) values (894, 5, 5, '2022-01-05 10:43:13');
insert into trips (trip_id, route_id, train_id, time) values (895, 70, 4, '2022-06-04 13:48:54');
insert into trips (trip_id, route_id, train_id, time) values (896, 47, 4, '2022-03-09 04:03:23');
insert into trips (trip_id, route_id, train_id, time) values (897, 94, 2, '2022-06-16 04:59:01');
insert into trips (trip_id, route_id, train_id, time) values (898, 31, 4, '2022-05-16 09:19:49');
insert into trips (trip_id, route_id, train_id, time) values (899, 97, 3, '2021-11-04 09:07:45');
insert into trips (trip_id, route_id, train_id, time) values (900, 3, 5, '2022-02-17 20:29:35');
insert into trips (trip_id, route_id, train_id, time) values (901, 34, 4, '2021-10-27 16:46:06');
insert into trips (trip_id, route_id, train_id, time) values (902, 23, 5, '2022-01-15 09:34:31');
insert into trips (trip_id, route_id, train_id, time) values (903, 77, 2, '2021-07-22 21:41:16');
insert into trips (trip_id, route_id, train_id, time) values (904, 84, 1, '2022-07-03 14:00:50');
insert into trips (trip_id, route_id, train_id, time) values (905, 82, 3, '2022-02-21 19:43:52');
insert into trips (trip_id, route_id, train_id, time) values (906, 22, 5, '2022-04-27 15:53:03');
insert into trips (trip_id, route_id, train_id, time) values (907, 12, 3, '2021-08-12 00:45:42');
insert into trips (trip_id, route_id, train_id, time) values (908, 22, 3, '2021-11-17 08:16:04');
insert into trips (trip_id, route_id, train_id, time) values (909, 2, 2, '2021-11-27 22:39:58');
insert into trips (trip_id, route_id, train_id, time) values (910, 92, 3, '2021-09-23 19:11:28');
insert into trips (trip_id, route_id, train_id, time) values (911, 39, 5, '2022-03-23 06:32:16');
insert into trips (trip_id, route_id, train_id, time) values (912, 79, 2, '2021-11-21 09:01:09');
insert into trips (trip_id, route_id, train_id, time) values (913, 48, 4, '2022-06-08 23:57:37');
insert into trips (trip_id, route_id, train_id, time) values (914, 30, 5, '2021-07-19 04:00:52');
insert into trips (trip_id, route_id, train_id, time) values (915, 3, 4, '2021-09-20 09:39:55');
insert into trips (trip_id, route_id, train_id, time) values (916, 24, 1, '2022-01-11 17:25:43');
insert into trips (trip_id, route_id, train_id, time) values (917, 26, 2, '2021-11-29 11:20:30');
insert into trips (trip_id, route_id, train_id, time) values (918, 4, 5, '2022-06-21 03:35:59');
insert into trips (trip_id, route_id, train_id, time) values (919, 69, 5, '2021-10-07 16:24:18');
insert into trips (trip_id, route_id, train_id, time) values (920, 92, 3, '2021-12-17 15:27:36');
insert into trips (trip_id, route_id, train_id, time) values (921, 78, 2, '2022-07-02 18:09:20');
insert into trips (trip_id, route_id, train_id, time) values (922, 30, 1, '2021-11-11 00:46:13');
insert into trips (trip_id, route_id, train_id, time) values (923, 76, 3, '2022-02-08 00:01:39');
insert into trips (trip_id, route_id, train_id, time) values (924, 58, 5, '2022-06-12 06:43:28');
insert into trips (trip_id, route_id, train_id, time) values (925, 67, 1, '2021-11-01 01:00:41');
insert into trips (trip_id, route_id, train_id, time) values (926, 54, 4, '2021-09-05 13:44:40');
insert into trips (trip_id, route_id, train_id, time) values (927, 21, 5, '2022-03-24 07:01:25');
insert into trips (trip_id, route_id, train_id, time) values (928, 44, 3, '2022-07-27 08:50:35');
insert into trips (trip_id, route_id, train_id, time) values (929, 32, 3, '2022-04-04 00:37:04');
insert into trips (trip_id, route_id, train_id, time) values (930, 45, 3, '2021-12-31 17:15:45');
insert into trips (trip_id, route_id, train_id, time) values (931, 25, 2, '2022-04-25 03:52:36');
insert into trips (trip_id, route_id, train_id, time) values (932, 97, 1, '2022-04-24 13:10:10');
insert into trips (trip_id, route_id, train_id, time) values (933, 34, 4, '2022-02-19 02:57:35');
insert into trips (trip_id, route_id, train_id, time) values (934, 30, 4, '2022-04-20 21:06:17');
insert into trips (trip_id, route_id, train_id, time) values (935, 81, 1, '2022-05-23 15:24:56');
insert into trips (trip_id, route_id, train_id, time) values (936, 52, 1, '2022-05-17 13:38:56');
insert into trips (trip_id, route_id, train_id, time) values (937, 73, 4, '2022-02-04 07:10:49');
insert into trips (trip_id, route_id, train_id, time) values (938, 93, 2, '2022-04-28 19:47:42');
insert into trips (trip_id, route_id, train_id, time) values (939, 93, 1, '2021-10-26 00:24:45');
insert into trips (trip_id, route_id, train_id, time) values (940, 67, 3, '2022-05-21 12:57:33');
insert into trips (trip_id, route_id, train_id, time) values (941, 6, 1, '2022-02-17 03:50:06');
insert into trips (trip_id, route_id, train_id, time) values (942, 56, 2, '2022-04-11 13:26:27');
insert into trips (trip_id, route_id, train_id, time) values (943, 40, 5, '2021-12-03 06:00:27');
insert into trips (trip_id, route_id, train_id, time) values (944, 16, 5, '2021-07-21 23:23:52');
insert into trips (trip_id, route_id, train_id, time) values (945, 100, 1, '2022-07-12 01:44:28');
insert into trips (trip_id, route_id, train_id, time) values (946, 85, 1, '2022-03-24 16:08:21');
insert into trips (trip_id, route_id, train_id, time) values (947, 17, 3, '2021-12-24 05:01:02');
insert into trips (trip_id, route_id, train_id, time) values (948, 38, 4, '2021-10-22 11:31:45');
insert into trips (trip_id, route_id, train_id, time) values (949, 65, 2, '2022-04-12 22:00:43');
insert into trips (trip_id, route_id, train_id, time) values (950, 46, 1, '2021-10-30 04:24:41');
insert into trips (trip_id, route_id, train_id, time) values (951, 27, 2, '2021-11-08 21:18:16');
insert into trips (trip_id, route_id, train_id, time) values (952, 69, 5, '2022-01-04 10:20:02');
insert into trips (trip_id, route_id, train_id, time) values (953, 23, 5, '2022-02-25 06:06:07');
insert into trips (trip_id, route_id, train_id, time) values (954, 85, 5, '2022-06-17 06:11:07');
insert into trips (trip_id, route_id, train_id, time) values (955, 75, 2, '2022-02-16 14:19:49');
insert into trips (trip_id, route_id, train_id, time) values (956, 28, 4, '2022-02-27 15:55:28');
insert into trips (trip_id, route_id, train_id, time) values (957, 56, 5, '2022-06-24 16:26:43');
insert into trips (trip_id, route_id, train_id, time) values (958, 87, 3, '2022-06-19 01:19:12');
insert into trips (trip_id, route_id, train_id, time) values (959, 78, 5, '2021-07-19 09:31:33');
insert into trips (trip_id, route_id, train_id, time) values (960, 64, 2, '2021-12-21 21:50:54');
insert into trips (trip_id, route_id, train_id, time) values (961, 3, 1, '2021-11-28 00:10:47');
insert into trips (trip_id, route_id, train_id, time) values (962, 32, 1, '2022-04-08 08:23:31');
insert into trips (trip_id, route_id, train_id, time) values (963, 8, 3, '2021-10-06 22:15:23');
insert into trips (trip_id, route_id, train_id, time) values (964, 2, 4, '2021-10-11 01:36:38');
insert into trips (trip_id, route_id, train_id, time) values (965, 75, 2, '2022-03-30 18:41:05');
insert into trips (trip_id, route_id, train_id, time) values (966, 96, 1, '2021-09-28 22:47:32');
insert into trips (trip_id, route_id, train_id, time) values (967, 96, 4, '2022-04-27 11:34:30');
insert into trips (trip_id, route_id, train_id, time) values (968, 38, 3, '2022-07-07 22:58:52');
insert into trips (trip_id, route_id, train_id, time) values (969, 32, 4, '2021-11-13 16:46:57');
insert into trips (trip_id, route_id, train_id, time) values (970, 9, 1, '2022-07-07 03:59:30');
insert into trips (trip_id, route_id, train_id, time) values (971, 32, 3, '2022-02-13 23:46:07');
insert into trips (trip_id, route_id, train_id, time) values (972, 95, 1, '2022-02-23 23:28:24');
insert into trips (trip_id, route_id, train_id, time) values (973, 35, 4, '2021-09-20 05:15:04');
insert into trips (trip_id, route_id, train_id, time) values (974, 78, 3, '2022-05-09 11:16:25');
insert into trips (trip_id, route_id, train_id, time) values (975, 28, 4, '2021-10-15 03:25:23');
insert into trips (trip_id, route_id, train_id, time) values (976, 78, 4, '2022-05-19 02:16:09');
insert into trips (trip_id, route_id, train_id, time) values (977, 79, 1, '2021-12-05 02:45:33');
insert into trips (trip_id, route_id, train_id, time) values (978, 43, 5, '2022-02-04 20:16:48');
insert into trips (trip_id, route_id, train_id, time) values (979, 49, 4, '2022-01-30 14:59:44');
insert into trips (trip_id, route_id, train_id, time) values (980, 83, 5, '2021-08-15 23:31:22');
insert into trips (trip_id, route_id, train_id, time) values (981, 44, 4, '2021-11-25 06:44:46');
insert into trips (trip_id, route_id, train_id, time) values (982, 39, 4, '2022-03-30 02:08:32');
insert into trips (trip_id, route_id, train_id, time) values (983, 75, 4, '2021-09-17 02:12:56');
insert into trips (trip_id, route_id, train_id, time) values (984, 100, 1, '2021-11-21 10:04:13');
insert into trips (trip_id, route_id, train_id, time) values (985, 11, 2, '2022-03-21 04:34:08');
insert into trips (trip_id, route_id, train_id, time) values (986, 9, 4, '2022-07-21 02:29:40');
insert into trips (trip_id, route_id, train_id, time) values (987, 10, 4, '2022-05-12 10:22:52');
insert into trips (trip_id, route_id, train_id, time) values (988, 56, 2, '2021-07-30 17:07:23');
insert into trips (trip_id, route_id, train_id, time) values (989, 55, 1, '2022-01-06 17:08:05');
insert into trips (trip_id, route_id, train_id, time) values (990, 73, 1, '2022-04-22 08:49:16');
insert into trips (trip_id, route_id, train_id, time) values (991, 87, 1, '2022-03-19 02:34:38');
insert into trips (trip_id, route_id, train_id, time) values (992, 19, 5, '2022-05-29 12:00:31');
insert into trips (trip_id, route_id, train_id, time) values (993, 3, 2, '2022-05-04 14:24:09');
insert into trips (trip_id, route_id, train_id, time) values (994, 2, 4, '2022-04-05 22:45:37');
insert into trips (trip_id, route_id, train_id, time) values (995, 10, 4, '2022-06-28 09:56:48');
insert into trips (trip_id, route_id, train_id, time) values (996, 27, 1, '2022-06-28 11:13:56');
insert into trips (trip_id, route_id, train_id, time) values (997, 28, 2, '2021-12-24 17:00:36');
insert into trips (trip_id, route_id, train_id, time) values (998, 51, 2, '2022-05-01 02:44:30');
insert into trips (trip_id, route_id, train_id, time) values (999, 61, 1, '2021-10-27 14:53:04');
insert into trips (trip_id, route_id, train_id, time) values (1000, 59, 5, '2021-08-20 13:13:34');


insert into ticket_prices (ticket_price_id, class_id, trip_id, price) values (1, 1, 143, 800000);
insert into ticket_prices (ticket_price_id, class_id, trip_id, price) values (2, 2, 143, 1600000);

insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (1, 1, 1, 'A', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (2, 1, 1, 'A', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (3, 1, 1, 'A', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (4, 1, 1, 'A', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (5, 1, 1, 'B', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (6, 1, 1, 'B', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (7, 1, 1, 'B', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (8, 1, 1, 'B', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (9, 1, 1, 'C', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (10, 1, 1, 'C', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (11, 1, 1, 'C', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (12, 1, 1, 'C', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (13, 1, 1, 'D', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (14, 1, 1, 'D', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (15, 1, 1, 'D', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (16, 1, 1, 'D', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (17, 1, 1, 'E', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (18, 1, 1, 'E', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (19, 1, 1, 'E', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (20, 1, 1, 'E', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (21, 1, 1, 'F', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (22, 1, 1, 'F', 2, 0);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (23, 1, 1, 'F', 3, 0);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (24, 1, 1, 'F', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (25, 1, 1, 'G', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (26, 1, 1, 'G', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (27, 1, 1, 'G', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (28, 1, 1, 'G', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (29, 1, 1, 'H', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (30, 1, 1, 'H', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (31, 1, 1, 'H', 3, 0);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (32, 1, 1, 'H', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (33, 1, 1, 'I', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (34, 1, 1, 'I', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (35, 1, 1, 'I', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (36, 1, 1, 'I', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (37, 1, 1, 'J', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (38, 1, 1, 'J', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (39, 1, 1, 'J', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (40, 1, 1, 'J', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (41, 1, 1, 'K', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (42, 1, 1, 'K', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (43, 1, 1, 'K', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (44, 1, 1, 'K', 4, 0);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (45, 1, 1, 'L', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (46, 1, 1, 'L', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (47, 1, 1, 'L', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (48, 1, 1, 'L', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (49, 1, 1, 'M', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (50, 1, 1, 'M', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (51, 1, 1, 'M', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (52, 1, 1, 'M', 1, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (53, 1, 1, 'N', 2, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (54, 1, 1, 'N', 3, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (55, 1, 1, 'N', 4, 1);
insert into tickets (ticket_id, ticket_price_id, carriage_id, row, seat, status) values (56, 1, 1, 'N', 4, 1);