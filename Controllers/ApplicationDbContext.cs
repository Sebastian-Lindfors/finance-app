using FinanceApp.Models;
using Microsoft.EntityFrameworkCore;

namespace FinanceApp.Controllers;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : DbContext(options)
{
    DbSet<Transaction> Transactions { get; set; }
}