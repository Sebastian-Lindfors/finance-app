using FinanceApp.Models;
using Microsoft.EntityFrameworkCore;

namespace FinanceApp.Controllers;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : DbContext(options)
{
    public DbSet<Transaction> Transactions { get; set; }
}