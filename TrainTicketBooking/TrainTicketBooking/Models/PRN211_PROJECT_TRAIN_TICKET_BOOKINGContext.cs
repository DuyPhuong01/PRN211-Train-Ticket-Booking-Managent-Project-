using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace TrainTicketBooking.Models
{
    public partial class PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext : DbContext
    {
        public PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext()
        {
        }

        public PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext(DbContextOptions<PRN211_PROJECT_TRAIN_TICKET_BOOKINGContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Carriage> Carriages { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderedTicket> OrderedTickets { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Route> Routes { get; set; }
        public virtual DbSet<Ticket> Tickets { get; set; }
        public virtual DbSet<TicketPrice> TicketPrices { get; set; }
        public virtual DbSet<TicketType> TicketTypes { get; set; }
        public virtual DbSet<Train> Trains { get; set; }
        public virtual DbSet<Trip> Trips { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server=localhost;database=PRN211_PROJECT_TRAIN_TICKET_BOOKING;user=sa;password=123");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Carriage>(entity =>
            {
                entity.ToTable("carriages");

                entity.Property(e => e.CarriageId).HasColumnName("carriage_id");

                entity.Property(e => e.CarriageNumber).HasColumnName("carriage_number");

                entity.Property(e => e.TrainId).HasColumnName("train_id");

                entity.HasOne(d => d.Train)
                    .WithMany(p => p.Carriages)
                    .HasForeignKey(d => d.TrainId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__carriages__train__3A81B327");
            });

            modelBuilder.Entity<Location>(entity =>
            {
                entity.ToTable("locations");

                entity.Property(e => e.LocationId).HasColumnName("location_id");

                entity.Property(e => e.LocationName)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("location_name");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("orders");

                entity.Property(e => e.OrderId).HasColumnName("order_id");

                entity.Property(e => e.OrderDate)
                    .HasColumnType("datetime")
                    .HasColumnName("order_date");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__orders__user_id__398D8EEE");
            });

            modelBuilder.Entity<OrderedTicket>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("ordered_tickets");

                entity.Property(e => e.OrderId).HasColumnName("order_id");

                entity.Property(e => e.Price)
                    .HasColumnType("money")
                    .HasColumnName("price");

                entity.Property(e => e.TicketId).HasColumnName("ticket_id");

                entity.HasOne(d => d.Order)
                    .WithMany()
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ordered_t__order__4316F928");

                entity.HasOne(d => d.Ticket)
                    .WithMany()
                    .HasForeignKey(d => d.TicketId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ordered_t__ticke__440B1D61");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("roles");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(128)
                    .HasColumnName("role_name");
            });

            modelBuilder.Entity<Route>(entity =>
            {
                entity.ToTable("routes");

                entity.Property(e => e.RouteId).HasColumnName("route_id");

                entity.Property(e => e.Distance).HasColumnName("distance");

                entity.Property(e => e.Duration)
                    .IsRequired()
                    .IsRowVersion()
                    .IsConcurrencyToken()
                    .HasColumnName("duration");

                entity.Property(e => e.From).HasColumnName("from");

                entity.Property(e => e.Path)
                    .HasColumnType("ntext")
                    .HasColumnName("path");

                entity.Property(e => e.RouteName)
                    .HasMaxLength(255)
                    .HasColumnName("route_name");

                entity.Property(e => e.To).HasColumnName("to");

                entity.HasOne(d => d.FromNavigation)
                    .WithMany(p => p.RouteFromNavigations)
                    .HasForeignKey(d => d.From)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__routes__from__3B75D760");

                entity.HasOne(d => d.ToNavigation)
                    .WithMany(p => p.RouteToNavigations)
                    .HasForeignKey(d => d.To)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__routes__to__3C69FB99");
            });

            modelBuilder.Entity<Ticket>(entity =>
            {
                entity.ToTable("tickets");

                entity.Property(e => e.TicketId).HasColumnName("ticket_id");

                entity.Property(e => e.CarriageId).HasColumnName("carriage_id");

                entity.Property(e => e.TicketPriceId).HasColumnName("ticket_price_id");

                entity.HasOne(d => d.Carriage)
                    .WithMany(p => p.Tickets)
                    .HasForeignKey(d => d.CarriageId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__tickets__carriag__4222D4EF");

                entity.HasOne(d => d.TicketPrice)
                    .WithMany(p => p.Tickets)
                    .HasForeignKey(d => d.TicketPriceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__tickets__ticket___412EB0B6");
            });

            modelBuilder.Entity<TicketPrice>(entity =>
            {
                entity.ToTable("ticket_prices");

                entity.Property(e => e.TicketPriceId).HasColumnName("ticket_price_id");

                entity.Property(e => e.Price)
                    .HasColumnType("money")
                    .HasColumnName("price");

                entity.Property(e => e.TripId).HasColumnName("trip_id");

                entity.Property(e => e.TypeId).HasColumnName("type_id");

                entity.HasOne(d => d.Trip)
                    .WithMany(p => p.TicketPrices)
                    .HasForeignKey(d => d.TripId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ticket_pr__trip___403A8C7D");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.TicketPrices)
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ticket_pr__type___3F466844");
            });

            modelBuilder.Entity<TicketType>(entity =>
            {
                entity.HasKey(e => e.TypeId)
                    .HasName("PK__ticket_t__2C000598F4D33B92");

                entity.ToTable("ticket_types");

                entity.Property(e => e.TypeId).HasColumnName("type_id");

                entity.Property(e => e.TypeName)
                    .HasMaxLength(128)
                    .HasColumnName("type_name");
            });

            modelBuilder.Entity<Train>(entity =>
            {
                entity.ToTable("trains");

                entity.Property(e => e.TrainId).HasColumnName("train_id");

                entity.Property(e => e.TrainName)
                    .IsRequired()
                    .HasMaxLength(64)
                    .IsUnicode(false)
                    .HasColumnName("train_name");
            });

            modelBuilder.Entity<Trip>(entity =>
            {
                entity.ToTable("trips");

                entity.Property(e => e.TripId).HasColumnName("trip_id");

                entity.Property(e => e.Date)
                    .HasColumnType("date")
                    .HasColumnName("date");

                entity.Property(e => e.RouteId).HasColumnName("route_id");

                entity.Property(e => e.Start)
                    .HasColumnType("datetime")
                    .HasColumnName("start");

                entity.Property(e => e.TrainId).HasColumnName("train_id");

                entity.HasOne(d => d.Route)
                    .WithMany(p => p.Trips)
                    .HasForeignKey(d => d.RouteId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__trips__route_id__3D5E1FD2");

                entity.HasOne(d => d.Train)
                    .WithMany(p => p.Trips)
                    .HasForeignKey(d => d.TrainId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__trips__train_id__3E52440B");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("users");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.City)
                    .HasMaxLength(128)
                    .HasColumnName("city");

                entity.Property(e => e.Country)
                    .HasMaxLength(128)
                    .HasColumnName("country");

                entity.Property(e => e.Fullname)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("fullname");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("phone");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__users__role_id__38996AB5");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
