using Microsoft.EntityFrameworkCore.Migrations;

namespace ParkManagementSystem.Migrations
{
    public partial class MysecondMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PackingRules",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Hour = table.Column<int>(nullable: false),
                    Charge = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PackingRules", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PackingTickets",
                columns: table => new
                {
                    TicketId = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TimeOfEntry = table.Column<string>(nullable: true),
                    TimeOfExist = table.Column<string>(nullable: true),
                    TotalCost = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PackingTickets", x => x.TicketId);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PackingRules");

            migrationBuilder.DropTable(
                name: "PackingTickets");
        }
    }
}
