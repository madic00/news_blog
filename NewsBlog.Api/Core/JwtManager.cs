using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using NewsBlog.EfDataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Api.Core
{
    public class JwtManager
    {
        private readonly NewsBlogContext _context;

        public JwtManager(NewsBlogContext context)
        {
            _context = context;
        }

        public string MakeToken(string username, string password)
        {
            var user = _context.Users.FirstOrDefault(x => x.Username == username);

            var passwordHash = BCrypt.Net.BCrypt.HashPassword(password);

            var userPass = user.Password;

            if(user == null || user.IsActive == false || !BCrypt.Net.BCrypt.Verify(password, user.Password))
            {
                return null;
            }

            //var actor = new FakeActor();

            var actor = new JwtActor
            {
                Id = user.Id,
                AllowedUseCases = user.UserUseCases.Select(x => x.UseCaseId),
                Identity = user.Username,
                IsAdmin = user.IsAdmin
            };

            var issuer = "newsblog";
            var secretKey = "ThisIsMyVerySecretKey";
            var claims = new List<Claim> // Jti : "", 
            {
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString(), ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iss, "asp_api", ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64, issuer),
                new Claim("UserId", actor.Id.ToString(), ClaimValueTypes.String, issuer),
                new Claim("ActorData", JsonConvert.SerializeObject(actor), ClaimValueTypes.String, issuer)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.UtcNow;
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: "Any",
                claims: claims,
                notBefore: now,
                expires: now.AddMinutes(30),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
