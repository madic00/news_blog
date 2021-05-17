using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace NewsBlog.EfDataAccess.Migrations
{
    public partial class init_setup : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Categories",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CategoryName = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categories", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Ratings",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ratings", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UseCaseLogs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Date = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UseCaseName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Data = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Actor = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UseCaseLogs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false),
                    LastName = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false),
                    Email = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false),
                    Password = table.Column<string>(type: "varchar(255)", maxLength: 255, nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                    table.UniqueConstraint("AK_Users_Email", x => x.Email);
                });

            migrationBuilder.CreateTable(
                name: "Posts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "varchar(100)", maxLength: 100, nullable: false),
                    Content = table.Column<string>(type: "text", nullable: false),
                    MainImg = table.Column<string>(type: "varchar(255)", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    CategoryId = table.Column<int>(type: "int", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Posts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Posts_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Posts_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "UserUseCases",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    UseCaseId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserUseCases", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserUseCases_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Comments",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Text = table.Column<string>(type: "varchar(255)", maxLength: 255, nullable: false),
                    PostId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Comments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Comments_Posts_PostId",
                        column: x => x.PostId,
                        principalTable: "Posts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Comments_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Images",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Source = table.Column<string>(type: "varchar", nullable: false),
                    Alt = table.Column<string>(type: "varchar", nullable: false),
                    PostId = table.Column<int>(type: "int", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Images", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Images_Posts_PostId",
                        column: x => x.PostId,
                        principalTable: "Posts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PostRatings",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    PostId = table.Column<int>(type: "int", nullable: false),
                    RatingId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PostRatings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PostRatings_Posts_PostId",
                        column: x => x.PostId,
                        principalTable: "Posts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PostRatings_Ratings_RatingId",
                        column: x => x.RatingId,
                        principalTable: "Ratings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PostRatings_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ReadingLists",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    PostId = table.Column<int>(type: "int", nullable: false),
                    IsActive = table.Column<bool>(type: "bit", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ReadingLists", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ReadingLists_Posts_PostId",
                        column: x => x.PostId,
                        principalTable: "Posts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ReadingLists_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Categories",
                columns: new[] { "Id", "CategoryName", "CreatedAt", "IsActive", "UpdatedAt" },
                values: new object[,]
                {
                    { 1, "Sport", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, null },
                    { 2, "Tech", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, null },
                    { 3, "News", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, null },
                    { 4, "Business", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, null },
                    { 5, "Entertainment", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, null },
                    { 6, "Health", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, null }
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "CreatedAt", "Email", "FirstName", "IsActive", "LastName", "Password", "UpdatedAt" },
                values: new object[,]
                {
                    { 22, new DateTime(2021, 5, 3, 13, 9, 50, 787, DateTimeKind.Local).AddTicks(1561), "Marty_Wisozk89@gmail.com", "Misael", true, "Olson", "sifra1", null },
                    { 23, new DateTime(2021, 5, 4, 7, 16, 10, 3, DateTimeKind.Local).AddTicks(2891), "Alta.Kuvalis@hotmail.com", "Colin", true, "Jenkins", "sifra1", null },
                    { 24, new DateTime(2021, 5, 4, 7, 30, 10, 345, DateTimeKind.Local).AddTicks(7861), "Devyn40@gmail.com", "Stefanie", true, "Windler", "sifra1", null },
                    { 25, new DateTime(2021, 5, 4, 9, 17, 43, 933, DateTimeKind.Local).AddTicks(9592), "Nathanial33@gmail.com", "Sonya", true, "Johnston", "sifra1", null },
                    { 26, new DateTime(2021, 5, 3, 21, 41, 8, 312, DateTimeKind.Local).AddTicks(2099), "Kurtis.Jenkins@yahoo.com", "Yasmine", true, "Kemmer", "sifra1", null },
                    { 27, new DateTime(2021, 5, 4, 11, 4, 57, 985, DateTimeKind.Local).AddTicks(6535), "Tom6@gmail.com", "Leon", true, "Stoltenberg", "sifra1", null },
                    { 28, new DateTime(2021, 5, 3, 21, 44, 57, 35, DateTimeKind.Local).AddTicks(5170), "Hubert.Kuhic@hotmail.com", "Hollis", true, "Hoeger", "sifra1", null },
                    { 29, new DateTime(2021, 5, 4, 11, 16, 39, 533, DateTimeKind.Local).AddTicks(2945), "Ezequiel16@gmail.com", "Myriam", true, "Kunde", "sifra1", null },
                    { 32, new DateTime(2021, 5, 4, 3, 35, 19, 425, DateTimeKind.Local).AddTicks(4052), "Haskell_Graham34@gmail.com", "Fleta", true, "Boyer", "sifra1", null },
                    { 31, new DateTime(2021, 5, 3, 17, 1, 0, 341, DateTimeKind.Local).AddTicks(9617), "Palma.Yost@yahoo.com", "Raphaelle", true, "Leannon", "sifra1", null },
                    { 21, new DateTime(2021, 5, 3, 14, 22, 30, 837, DateTimeKind.Local).AddTicks(98), "Kendall.McDermott60@yahoo.com", "Brooklyn", true, "Mante", "sifra1", null },
                    { 33, new DateTime(2021, 5, 4, 11, 22, 10, 970, DateTimeKind.Local).AddTicks(8536), "Euna.Schmitt69@hotmail.com", "Victor", true, "Stanton", "sifra1", null },
                    { 34, new DateTime(2021, 5, 3, 21, 15, 12, 969, DateTimeKind.Local).AddTicks(100), "Zander_Conroy39@gmail.com", "Ruthie", true, "Crist", "sifra1", null },
                    { 35, new DateTime(2021, 5, 3, 12, 26, 47, 299, DateTimeKind.Local).AddTicks(5556), "Letha27@gmail.com", "Violette", true, "Ziemann", "sifra1", null },
                    { 36, new DateTime(2021, 5, 3, 19, 6, 48, 93, DateTimeKind.Local).AddTicks(705), "Nicholas71@hotmail.com", "Kianna", true, "Smith", "sifra1", null },
                    { 37, new DateTime(2021, 5, 4, 10, 4, 32, 131, DateTimeKind.Local).AddTicks(2759), "Cale.Anderson@hotmail.com", "Troy", true, "Price", "sifra1", null },
                    { 38, new DateTime(2021, 5, 3, 14, 43, 7, 700, DateTimeKind.Local).AddTicks(3560), "Nicolette.Hettinger82@gmail.com", "Vanessa", true, "Morar", "sifra1", null },
                    { 30, new DateTime(2021, 5, 4, 0, 30, 27, 607, DateTimeKind.Local).AddTicks(4441), "Anthony_Turcotte@gmail.com", "Antonina", true, "Predovic", "sifra1", null },
                    { 20, new DateTime(2021, 5, 3, 20, 9, 13, 481, DateTimeKind.Local).AddTicks(8472), "Joana34@yahoo.com", "Georgianna", true, "Volkman", "sifra1", null },
                    { 17, new DateTime(2021, 5, 4, 0, 53, 37, 473, DateTimeKind.Local).AddTicks(7601), "Elnora_Grady76@hotmail.com", "Madyson", true, "Pfeffer", "sifra1", null },
                    { 18, new DateTime(2021, 5, 4, 3, 4, 28, 487, DateTimeKind.Local).AddTicks(721), "Alfreda.Yost@hotmail.com", "Esta", true, "Roberts", "sifra1", null },
                    { 1, new DateTime(2021, 5, 3, 14, 18, 42, 955, DateTimeKind.Local).AddTicks(3060), "Haley9@hotmail.com", "Ludwig", true, "Kuphal", "sifra1", null },
                    { 2, new DateTime(2021, 5, 4, 2, 26, 3, 23, DateTimeKind.Local).AddTicks(1786), "Darby.Batz83@gmail.com", "Zora", true, "Davis", "sifra1", null },
                    { 3, new DateTime(2021, 5, 3, 15, 31, 34, 638, DateTimeKind.Local).AddTicks(2054), "Sanford.Zemlak17@hotmail.com", "Duncan", true, "Lubowitz", "sifra1", null },
                    { 4, new DateTime(2021, 5, 4, 4, 58, 43, 149, DateTimeKind.Local).AddTicks(1594), "Chaz40@gmail.com", "Clare", true, "Franecki", "sifra1", null },
                    { 5, new DateTime(2021, 5, 3, 18, 43, 3, 123, DateTimeKind.Local).AddTicks(5530), "Ila.Willms@hotmail.com", "Sharon", true, "Ratke", "sifra1", null },
                    { 6, new DateTime(2021, 5, 3, 20, 59, 9, 639, DateTimeKind.Local).AddTicks(2233), "Chaim.Will51@hotmail.com", "Rita", true, "Kiehn", "sifra1", null },
                    { 7, new DateTime(2021, 5, 4, 6, 40, 15, 629, DateTimeKind.Local).AddTicks(8655), "Kaycee_OConner@hotmail.com", "Clotilde", true, "Nitzsche", "sifra1", null },
                    { 8, new DateTime(2021, 5, 3, 16, 22, 42, 815, DateTimeKind.Local).AddTicks(1260), "Montana.Schuster@hotmail.com", "Benjamin", true, "Torp", "sifra1", null },
                    { 9, new DateTime(2021, 5, 3, 21, 31, 50, 71, DateTimeKind.Local).AddTicks(855), "Bradley93@yahoo.com", "Myrtis", true, "Carroll", "sifra1", null },
                    { 10, new DateTime(2021, 5, 3, 20, 6, 35, 84, DateTimeKind.Local).AddTicks(6096), "Jonathon.Abshire96@yahoo.com", "Brook", true, "Cronin", "sifra1", null },
                    { 11, new DateTime(2021, 5, 4, 9, 21, 4, 666, DateTimeKind.Local).AddTicks(1496), "Lonny7@yahoo.com", "Karley", true, "Johnson", "sifra1", null },
                    { 12, new DateTime(2021, 5, 3, 22, 27, 5, 634, DateTimeKind.Local).AddTicks(7776), "Donna87@hotmail.com", "Cory", true, "Steuber", "sifra1", null },
                    { 13, new DateTime(2021, 5, 4, 8, 19, 5, 348, DateTimeKind.Local).AddTicks(6057), "Madelyn_Howell70@yahoo.com", "Faustino", true, "Emmerich", "sifra1", null },
                    { 14, new DateTime(2021, 5, 3, 14, 47, 34, 71, DateTimeKind.Local).AddTicks(6143), "Arne42@gmail.com", "Harrison", true, "Kuhn", "sifra1", null },
                    { 15, new DateTime(2021, 5, 4, 12, 2, 58, 495, DateTimeKind.Local).AddTicks(9308), "Margot_Dickinson55@gmail.com", "Andreanne", true, "Gorczany", "sifra1", null }
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "CreatedAt", "Email", "FirstName", "IsActive", "LastName", "Password", "UpdatedAt" },
                values: new object[,]
                {
                    { 16, new DateTime(2021, 5, 3, 13, 35, 46, 798, DateTimeKind.Local).AddTicks(4966), "Euna54@gmail.com", "Nick", true, "Kohler", "sifra1", null },
                    { 39, new DateTime(2021, 5, 4, 10, 38, 8, 99, DateTimeKind.Local).AddTicks(762), "Antone_Hegmann@yahoo.com", "Dwight", true, "Osinski", "sifra1", null },
                    { 19, new DateTime(2021, 5, 4, 9, 45, 12, 746, DateTimeKind.Local).AddTicks(7870), "Stan72@hotmail.com", "Trisha", true, "Rippin", "sifra1", null },
                    { 40, new DateTime(2021, 5, 4, 5, 24, 38, 998, DateTimeKind.Local).AddTicks(3608), "Uriah.Grady33@yahoo.com", "Raphael", true, "Hettinger", "sifra1", null }
                });

            migrationBuilder.InsertData(
                table: "Posts",
                columns: new[] { "Id", "CategoryId", "Content", "CreatedAt", "IsActive", "MainImg", "Title", "UpdatedAt", "UserId" },
                values: new object[,]
                {
                    { 9, 5, "Ut aperiam veniam sit.\nQuis explicabo amet aut similique rerum necessitatibus.\nEx eum cupiditate veniam dolorem.\nNostrum quae consequatur nesciunt.\nVero officia a consequuntur debitis iusto accusantium aspernatur fugiat.\nEum tempora ipsa facilis id officia quo quae qui.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Maiores accusamus ipsam quo et et aut.", null, 1 },
                    { 13, 6, "Ipsum voluptas quia dolores quis neque aut sequi cum magnam.\nIusto sed rerum aut omnis quasi quo illo est.\nLaudantium consequatur ut saepe.\nVelit impedit autem explicabo similique quae.\nEarum explicabo dolore dolorem quasi iusto.\nOmnis iste nihil reprehenderit assumenda dolores ut deserunt repudiandae.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Deleniti porro blanditiis officiis facere.", null, 31 },
                    { 70, 5, "A quae alias.\nDoloribus incidunt velit assumenda fugit.\nPraesentium pariatur est quis et voluptatem et et autem molestiae.\nQuibusdam sint et consectetur voluptatem consequatur.\nOmnis mollitia temporibus minima.\nLabore nam sed facilis explicabo sed.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Omnis voluptatem libero nemo incidunt laudantium esse.", null, 30 },
                    { 45, 5, "Quaerat eius cumque excepturi aut temporibus quas et dolores unde. Corrupti consequatur deleniti laboriosam maiores. Pariatur architecto perspiciatis ratione consequatur delectus modi. Dolorem aperiam sed. Accusamus aut aut animi ut sit.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Provident aut quasi.", null, 30 },
                    { 95, 3, "A illum qui nemo consequatur nemo est repudiandae dolore.\nMollitia molestias magnam eos ad consequatur nihil rem.\nEt ullam saepe rem expedita aspernatur delectus qui sint.\nUt et esse.\nExcepturi ut minima sunt pariatur ad necessitatibus.\nDoloribus vero sunt porro alias quia.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Odit quaerat ipsam excepturi praesentium fugit et numquam magni perspiciatis.", null, 29 },
                    { 77, 5, "Quasi et asperiores.\nEt tempora sequi.\nMaiores aperiam sit iure molestiae.\nSed id aut culpa dicta.\nLabore modi debitis commodi quis autem sunt autem omnis.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Iusto inventore voluptatem qui non saepe voluptates nihil.", null, 29 },
                    { 47, 3, "provident", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dignissimos commodi a ut commodi recusandae suscipit distinctio.", null, 29 },
                    { 46, 1, "Dolor distinctio quia magni.\nPerspiciatis provident modi placeat et repellendus ducimus magnam voluptatum.\nRerum possimus eum quia ut nam.\nRerum laudantium praesentium reiciendis doloribus sit.\nVeniam voluptatum rem quae.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Repellat qui expedita autem et.", null, 29 },
                    { 94, 1, "ab", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Nemo dolores explicabo cum nesciunt veniam.", null, 28 },
                    { 58, 2, "Sapiente nihil quidem veritatis delectus vitae reprehenderit dolores quis.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quo commodi natus optio ab voluptates voluptates dolor.", null, 26 },
                    { 10, 5, "magni", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Et explicabo similique sapiente.", null, 26 },
                    { 81, 4, "expedita", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Necessitatibus tempore qui odit ut.", null, 25 },
                    { 41, 1, "Necessitatibus eligendi fugiat consectetur rerum voluptas repellat voluptatum vel vitae.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quis impedit minima.", null, 24 },
                    { 98, 1, "Delectus non nemo aperiam.\nItaque aspernatur possimus voluptas enim libero et perspiciatis maxime laboriosam.\nRem recusandae neque.\nUt dolorem placeat voluptatem a dolores ut eaque.\nRecusandae est est similique debitis nihil.\nAmet aperiam ducimus doloribus aut minima qui quam ipsum reiciendis.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quo ut architecto dolor sapiente id quia repellat.", null, 23 },
                    { 83, 5, "odit", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quia enim amet modi placeat rerum qui.", null, 23 },
                    { 79, 5, "Aut et atque rerum. Qui dolores quaerat aut incidunt dolor. Unde inventore voluptas vel dolorem ullam nihil rem. Eligendi sit ducimus iure amet aut aut est.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Natus laboriosam ducimus possimus quia quae ullam ut consequuntur sit.", null, 22 },
                    { 65, 4, "Nulla laborum et quisquam provident fugiat dolores quaerat et.\nIllum velit quia voluptas aut illo aspernatur beatae enim nisi.\nEos rerum qui unde ex qui.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Ex a repudiandae provident.", null, 22 },
                    { 64, 6, "Ut rem facere velit saepe. Aut a velit saepe explicabo. Explicabo ex sapiente eveniet voluptas.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dignissimos nobis in.", null, 22 },
                    { 1, 2, "Velit nam et sapiente occaecati et dolorum voluptate et.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Amet quo et laborum.", null, 22 },
                    { 99, 2, "Sequi architecto ea in inventore quis. Fuga voluptatibus aliquid nam eaque nisi. Odio atque quia provident tenetur est voluptas voluptatibus voluptatibus. Odit esse facere vitae qui dolores ex sint voluptates sed. A quae officia. Asperiores repellat quibusdam.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Iusto fuga quisquam pariatur et omnis numquam.", null, 21 },
                    { 88, 1, "Esse recusandae enim.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dolorum et doloremque dolorum ipsa deserunt iure beatae.", null, 21 },
                    { 63, 2, "ullam", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dolorem illo ad sed odio est.", null, 21 },
                    { 49, 5, "consequuntur", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Aliquid accusantium totam deserunt enim in provident.", null, 31 },
                    { 62, 1, "Dolor aut quis dolorem autem expedita.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Neque numquam velit.", null, 21 },
                    { 53, 2, "Dolorem ut maxime qui explicabo molestiae magnam.\nEt ut enim quis ea excepturi nesciunt sit autem quae.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Et vero illum sapiente consequatur aspernatur sit voluptas.", null, 31 },
                    { 82, 1, "Eligendi est ducimus mollitia consectetur.\nVoluptatibus sed rerum voluptas.\nLaboriosam vel qui et odit modi dolor minima.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Sed nihil ullam rerum odit saepe rem esse veniam eaque.", null, 31 },
                    { 52, 1, "neque", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Aut amet et fuga sed in.", null, 39 },
                    { 38, 2, "quidem", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Iure quos magni quidem nisi et.", null, 39 },
                    { 57, 3, "Dolores tenetur quibusdam.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dolore autem ipsum odit sed repudiandae eligendi doloremque.", null, 38 },
                    { 17, 2, "Qui fugit facere porro iste.\nEligendi qui veritatis reprehenderit occaecati doloremque enim distinctio.\nAut repellendus rem qui.\nNostrum dolorum repudiandae.\nAut quibusdam saepe.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Aut voluptatem dignissimos quis corrupti eos ipsa sit consequatur quisquam.", null, 38 },
                    { 84, 5, "Saepe expedita libero perspiciatis qui enim. Enim inventore vero ad nobis dolorem. Laudantium modi nulla nemo qui rerum. Quibusdam facere asperiores mollitia suscipit iure. Ut impedit odit.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Aut quidem maxime ipsa adipisci voluptatem eos excepturi architecto.", null, 37 },
                    { 31, 6, "Aliquid aspernatur ut soluta.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Ullam dolorem pariatur explicabo molestias minus in et.", null, 37 },
                    { 96, 5, "dolores", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Facilis voluptate nihil architecto tempore.", null, 36 },
                    { 90, 3, "Ipsam fugiat quo eum.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Porro rerum rem.", null, 35 },
                    { 51, 6, "Dolores nulla inventore magni quo doloribus similique doloribus dolorem quis.\nTempore nostrum repudiandae repellendus dignissimos ratione.\nQuia adipisci perspiciatis et et iste tempora in et quia.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Eos rerum consequatur laborum velit et.", null, 35 },
                    { 42, 3, "modi", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Cum in laudantium quisquam ipsa quis voluptatem quis aut.", null, 35 },
                    { 33, 1, "assumenda", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Placeat magnam enim quia unde doloribus exercitationem est enim dolores.", null, 35 },
                    { 6, 3, "Officiis ipsa modi eius in est ratione officiis. Necessitatibus nemo fuga in nobis officiis rerum maxime. Atque harum aut est alias exercitationem porro. Ut quas a modi reiciendis commodi vitae quis id enim.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quos aliquam consequuntur ipsam consequatur eligendi quia.", null, 35 },
                    { 78, 2, "Expedita molestiae vero nam magnam libero saepe qui qui sequi.\nNulla est illum.\nNulla omnis harum quod provident eos ea est eum.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Aut fuga ab reiciendis dolores voluptas est.", null, 34 },
                    { 73, 1, "Et mollitia est voluptates ut non id quia.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Aliquam ad illo omnis repudiandae.", null, 34 },
                    { 5, 2, "dolorem", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Consequuntur iure praesentium odio.", null, 34 },
                    { 93, 3, "Atque et facere illo cumque.\nRepellat qui ut laborum.\nCumque quo nostrum deleniti nesciunt rerum.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Qui pariatur perspiciatis sint.", null, 33 }
                });

            migrationBuilder.InsertData(
                table: "Posts",
                columns: new[] { "Id", "CategoryId", "Content", "CreatedAt", "IsActive", "MainImg", "Title", "UpdatedAt", "UserId" },
                values: new object[,]
                {
                    { 100, 1, "Vel nobis consequatur accusantium dolores quia explicabo. Nostrum rerum sed ipsam eaque nulla. Placeat magni aut et atque odio qui voluptatum sapiente est. Autem ex aspernatur impedit dolores eos tempore.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Fuga et qui minima.", null, 32 },
                    { 72, 5, "Fuga minus nulla reprehenderit totam.\nEt excepturi omnis autem dolor consequatur.\nAsperiores mollitia quas architecto enim consequatur dignissimos est omnis libero.\nNisi voluptatibus ut quisquam officia nam.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dolor dolor totam provident impedit quisquam dolorum.", null, 32 },
                    { 71, 6, "Magnam exercitationem eum ut vel repellendus voluptatem iure.\nNeque magni quis dicta tempore quam ipsa consequatur.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Aut cum hic.", null, 32 },
                    { 19, 5, "Ea eius dolore tempora id delectus velit sed eligendi.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Doloremque nihil consectetur ipsa et et laboriosam eius.", null, 32 },
                    { 86, 3, "debitis", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Est quibusdam repellendus sequi ea.", null, 31 },
                    { 66, 3, "tempore", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Adipisci iusto nihil et reprehenderit odio.", null, 31 },
                    { 28, 5, "Qui nisi repellendus suscipit quia.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Nesciunt voluptatibus enim aliquam distinctio voluptatem cumque et eos.", null, 21 },
                    { 61, 4, "Iure quam perspiciatis ad voluptatem ipsa et. Minus ut velit sed quia esse corporis. Facere debitis totam magnam veritatis cumque. Quod quia delectus consequatur assumenda et sed beatae repudiandae.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Veniam quia est molestias eum non odit.", null, 20 },
                    { 26, 2, "Dignissimos et culpa labore.\nVero ut magnam unde culpa.\nImpedit tempora aut eum cupiditate beatae fugit dolorum unde reprehenderit.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Vel quibusdam suscipit omnis.", null, 20 },
                    { 35, 4, "Laboriosam nam quaerat at voluptas aut quidem fugiat.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Et expedita in unde molestiae explicabo deserunt.", null, 9 },
                    { 4, 6, "Non aut unde amet maxime numquam accusantium nihil.\nImpedit delectus rerum est quasi id nesciunt velit neque.\nInventore asperiores est accusamus.\nUnde accusamus ipsum.\nQuia modi aspernatur qui assumenda repudiandae sit ullam sed.\nVoluptatum ex aut.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Fugit et libero nostrum.", null, 9 },
                    { 56, 5, "Temporibus laudantium recusandae porro nulla vel numquam consequuntur odio atque.\nId sed esse quod nihil sint atque aut assumenda.\nQuo delectus reiciendis sint magni nam at.\nMaxime et aut eum nihil tenetur reiciendis.\nVel nulla rerum et sed quia eum eligendi.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Ipsam atque blanditiis qui non repudiandae consequatur porro qui.", null, 8 },
                    { 27, 4, "Et aut voluptate aut corporis quis totam sit. Sit labore atque. Veritatis quae voluptas.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Et non esse recusandae quasi.", null, 8 },
                    { 7, 1, "Eos rerum est blanditiis qui non.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Doloremque omnis omnis ipsam error ducimus minima sed et at.", null, 8 },
                    { 97, 5, "est", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Ut molestiae non.", null, 7 },
                    { 60, 5, "fuga", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Animi eum voluptas soluta aspernatur sequi provident quisquam.", null, 7 },
                    { 54, 6, "Autem culpa officiis voluptas autem praesentium.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Suscipit repellendus minima deleniti.", null, 7 },
                    { 37, 1, "Tempore nihil tenetur enim ut quo enim non ipsa.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Sed dolor aut tempora.", null, 7 },
                    { 22, 2, "rerum", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Maiores asperiores nemo fugiat rerum occaecati.", null, 7 },
                    { 80, 4, "a", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quidem doloribus deleniti similique cupiditate consequuntur quae.", null, 6 },
                    { 32, 2, "Sed dolore eius officiis quam consequatur voluptate molestias. Mollitia eum molestias eligendi sapiente labore corporis eaque ea animi. Iure et aperiam ducimus. Rem deserunt recusandae culpa in ipsam. Voluptas ratione saepe voluptatem sint cupiditate. Earum maxime voluptas qui earum at.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dignissimos numquam molestias fuga officia reprehenderit.", null, 6 },
                    { 20, 1, "Et sunt omnis sed eum consequatur animi aut culpa quis.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Possimus repellendus ea nemo architecto nihil nemo.", null, 6 },
                    { 16, 2, "Quos provident at sed sapiente iure adipisci impedit fugit.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Recusandae quas voluptatum quis doloremque voluptas facere asperiores.", null, 6 },
                    { 69, 2, "Dignissimos veritatis quos.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dolorum dolore est consequatur odit.", null, 4 },
                    { 11, 5, "Voluptas eaque sit delectus enim tempore ut.\nInventore occaecati cupiditate animi atque rerum molestiae.\nIn repellat ex voluptatibus necessitatibus omnis sit.\nSed maxime eius beatae porro corporis et aspernatur aliquid excepturi.\nCumque quaerat maxime minus dolor.\nQuia eaque ab iusto voluptate facilis in occaecati.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Rerum eum non voluptatem.", null, 4 },
                    { 18, 3, "Dicta non libero.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quam maiores nobis non minus.", null, 3 },
                    { 55, 2, "distinctio", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Culpa fuga enim quod dignissimos tempore provident est voluptas.", null, 2 },
                    { 39, 1, "unde", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Nesciunt quis est illum quaerat voluptatum ut.", null, 2 },
                    { 25, 1, "Officiis aperiam rerum expedita et exercitationem maxime provident. Similique ex ipsa. Minus omnis facilis alias omnis aperiam.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Vero ducimus numquam ut.", null, 2 },
                    { 89, 5, "Debitis dolor culpa adipisci quia nemo beatae aut et consequatur.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Veniam nemo esse rerum assumenda pariatur voluptas ipsam temporibus iure.", null, 1 },
                    { 50, 3, "Ad dolor et autem aut omnis. Beatae officia numquam tempora. Vel maiores harum libero earum dolore ipsum. Dolores dolor sit sit nam quaerat error. Sunt quam voluptas repellendus repudiandae sunt architecto. Modi quibusdam laboriosam pariatur iure hic sed totam fuga.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "At voluptatem labore recusandae alias minima ex ut.", null, 9 },
                    { 87, 5, "Et commodi laboriosam ut facere recusandae.\nDolores quae itaque libero rerum voluptatem enim velit quidem.\nAnimi harum sed.\nLaborum atque illo ipsa suscipit doloribus.\nEst veniam dolorum.\nAliquam voluptas aliquid quia blanditiis iusto ea nihil tempora vel.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Natus repudiandae libero assumenda aliquid temporibus voluptatem explicabo et.", null, 9 },
                    { 34, 3, "Perspiciatis quasi reiciendis temporibus.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Hic omnis voluptatum non iste minima.", null, 10 },
                    { 44, 2, "Distinctio fugit rem impedit facere.\nQuia sit facilis numquam aut.\nTenetur nihil numquam ad minima culpa optio voluptates praesentium qui.\nVoluptas eveniet temporibus architecto voluptatem sit est.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Nam fugit et alias cumque dicta possimus et.", null, 10 },
                    { 14, 1, "Culpa soluta maxime sit dolor. Natus eum repellat in magnam eius culpa eaque esse. Qui neque illum quibusdam. Nostrum et quam ut sit iure est saepe totam unde.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Et sint et sequi possimus impedit occaecati enim id necessitatibus.", null, 20 },
                    { 24, 6, "Veritatis rerum consequuntur qui. Et commodi occaecati porro. Sunt est totam nam voluptatem.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quia consequatur voluptatibus et nemo ut voluptatem ullam est.", null, 18 },
                    { 36, 5, "Sed sit nostrum provident aperiam et quidem nostrum voluptas.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Ab maxime architecto provident dolorem enim voluptates qui distinctio.", null, 17 },
                    { 40, 2, "Commodi quos deserunt soluta qui nesciunt consequuntur et est.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Similique et nemo qui blanditiis ut debitis impedit quia ut.", null, 16 },
                    { 2, 3, "similique", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Necessitatibus iure commodi rerum mollitia fugit odit vitae velit.", null, 16 },
                    { 75, 5, "Soluta amet laboriosam consequatur.\nQuo dolor dolores praesentium optio ipsum.\nPossimus repellendus vel sit alias nihil non deleniti eveniet.\nEt est nihil nisi voluptatem voluptatibus sequi voluptas non.\nVoluptatem dolore aliquam sit nemo voluptatibus.\nIncidunt autem consequatur animi.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Ut molestiae aut ducimus cupiditate.", null, 15 },
                    { 92, 4, "ducimus", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Natus repellat a unde iste et et.", null, 14 },
                    { 68, 2, "Voluptatem sit nihil libero voluptas. Quia iusto quae et. Ipsum repudiandae voluptatem id porro et pariatur vero voluptate magnam. Laboriosam voluptatum totam asperiores veritatis quia reiciendis velit.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Ratione atque voluptatem esse magnam ut.", null, 14 }
                });

            migrationBuilder.InsertData(
                table: "Posts",
                columns: new[] { "Id", "CategoryId", "Content", "CreatedAt", "IsActive", "MainImg", "Title", "UpdatedAt", "UserId" },
                values: new object[,]
                {
                    { 15, 5, "Inventore quibusdam ex occaecati aut sint.\nItaque quia libero aut eos non.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Aliquam adipisci voluptas.", null, 14 },
                    { 91, 1, "Provident delectus nemo qui facilis incidunt. Porro quia et. Quo aut vero. Sit rem nostrum optio repellat ullam.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Dignissimos ipsum magni.", null, 12 },
                    { 8, 6, "Rem voluptates earum perspiciatis accusantium vitae error inventore quo quae.\nIpsam perspiciatis ad est sunt pariatur aut non.\nExplicabo ad consequatur.\nQuaerat nulla blanditiis ad sapiente non itaque eos tempore et.\nQuis voluptatem quia dolorem commodi debitis aut incidunt natus placeat.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Eaque molestiae et laborum.", null, 40 },
                    { 30, 4, "doloribus", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Voluptates repudiandae aut odio.", null, 12 },
                    { 12, 6, "Dolorem facere necessitatibus molestiae magnam ut.\nQui nisi fugiat voluptatem sunt.\nSimilique est delectus natus quo.\nFacilis natus recusandae.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Hic voluptatem vel saepe rerum error sit sit pariatur.", null, 12 },
                    { 43, 2, "Quis doloribus perferendis.\nArchitecto pariatur aut commodi sit.\nAnimi vel atque est.\nDelectus aut repellat nobis doloribus et.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Suscipit consectetur earum soluta et omnis eligendi.", null, 11 },
                    { 23, 5, "Nulla est mollitia aut.\nVero eos eos et sint omnis.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Sit aut delectus et.", null, 11 },
                    { 21, 1, "voluptas", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Omnis culpa quam nihil.", null, 11 },
                    { 3, 3, "placeat", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Tempore molestiae explicabo molestiae.", null, 11 },
                    { 85, 3, "sequi", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "At libero autem non iste.", null, 10 },
                    { 76, 3, "Eum minima est earum quasi.\nEt nisi optio atque est dignissimos excepturi.\nCommodi impedit sit similique voluptatibus nobis non.\nConsectetur consequatur nihil nulla.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Debitis quisquam et natus perspiciatis explicabo dignissimos illum.", null, 10 },
                    { 74, 2, "Et in et veritatis velit ab atque.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Voluptatum itaque quia est.", null, 10 },
                    { 67, 4, "distinctio", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Labore libero inventore animi.", null, 10 },
                    { 48, 2, "Culpa consequatur est maxime tempore dolor.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Sunt aut cupiditate et perferendis eaque nobis.", null, 10 },
                    { 29, 2, "Voluptates ullam id dolorem sunt.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Quo rerum corporis consequuntur tempore ut inventore placeat eaque.", null, 12 },
                    { 59, 4, "Quibusdam sequi debitis deleniti.\nPerferendis magni incidunt iusto aut fuga dolor dolor vel.\nVoluptas voluptate qui dolores ad harum.\nAmet soluta commodi.", new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), true, "https://via.placeholder.com/150x150/cccccc/9c9c9c.png", "Rerum officiis soluta praesentium.", null, 40 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Categories_CategoryName",
                table: "Categories",
                column: "CategoryName",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Comments_PostId",
                table: "Comments",
                column: "PostId");

            migrationBuilder.CreateIndex(
                name: "IX_Comments_UserId",
                table: "Comments",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Images_PostId",
                table: "Images",
                column: "PostId");

            migrationBuilder.CreateIndex(
                name: "IX_PostRatings_PostId",
                table: "PostRatings",
                column: "PostId");

            migrationBuilder.CreateIndex(
                name: "IX_PostRatings_RatingId",
                table: "PostRatings",
                column: "RatingId");

            migrationBuilder.CreateIndex(
                name: "IX_PostRatings_UserId",
                table: "PostRatings",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Posts_CategoryId",
                table: "Posts",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Posts_UserId",
                table: "Posts",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_ReadingLists_PostId",
                table: "ReadingLists",
                column: "PostId");

            migrationBuilder.CreateIndex(
                name: "IX_ReadingLists_UserId",
                table: "ReadingLists",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserUseCases_UserId",
                table: "UserUseCases",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Comments");

            migrationBuilder.DropTable(
                name: "Images");

            migrationBuilder.DropTable(
                name: "PostRatings");

            migrationBuilder.DropTable(
                name: "ReadingLists");

            migrationBuilder.DropTable(
                name: "UseCaseLogs");

            migrationBuilder.DropTable(
                name: "UserUseCases");

            migrationBuilder.DropTable(
                name: "Ratings");

            migrationBuilder.DropTable(
                name: "Posts");

            migrationBuilder.DropTable(
                name: "Categories");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
