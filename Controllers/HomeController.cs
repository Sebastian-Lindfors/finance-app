using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using FinanceApp.Models;
using Microsoft.EntityFrameworkCore;
using FinanceApp.ViewModels;

namespace FinanceApp.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly ApplicationDbContext _context;

    public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
    {
        _logger = logger;
        _context = context;
    }

    public async Task<IActionResult> Index()
    {
        var transactions = await _context.Transactions.ToListAsync();

        IndexVm vm = new()
        {
            Transactions = transactions
        };

        return View(vm);
    }

    public IActionResult Create()
    {
        // Create logic for transactions goes here.
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
