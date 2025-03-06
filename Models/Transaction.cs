namespace FinanceApp.Models;

public class Transaction
{
    public int Id { get; set; }
    public DateTime Date { get; set; }
    public decimal Amount { get; set; }
    public string? Note { get; set; }
}