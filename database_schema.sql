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
  [duration] timestamp NOT NULL,
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

ALTER TABLE [users] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([role_id])
GO

ALTER TABLE [orders] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [carriages] ADD FOREIGN KEY ([train_id]) REFERENCES [trains] ([train_id])
GO

ALTER TABLE [routes] ADD FOREIGN KEY ([from]) REFERENCES [locations] ([location_id])
GO

ALTER TABLE [routes] ADD FOREIGN KEY ([to]) REFERENCES [locations] ([location_id])
GO

ALTER TABLE [trips] ADD FOREIGN KEY ([route_id]) REFERENCES [routes] ([route_id])
GO

ALTER TABLE [trips] ADD FOREIGN KEY ([train_id]) REFERENCES [trains] ([train_id])
GO

ALTER TABLE [ticket_prices] ADD FOREIGN KEY ([type_id]) REFERENCES [ticket_types] ([type_id])
GO

ALTER TABLE [ticket_prices] ADD FOREIGN KEY ([trip_id]) REFERENCES [trips] ([trip_id])
GO

ALTER TABLE [tickets] ADD FOREIGN KEY ([ticket_price_id]) REFERENCES [ticket_prices] ([ticket_price_id])
GO

ALTER TABLE [tickets] ADD FOREIGN KEY ([carriage_id]) REFERENCES [carriages] ([carriage_id])
GO

ALTER TABLE [ordered_tickets] ADD FOREIGN KEY ([order_id]) REFERENCES [orders] ([order_id])
GO

ALTER TABLE [ordered_tickets] ADD FOREIGN KEY ([ticket_id]) REFERENCES [tickets] ([ticket_id])
GO
