namespace StudentSystemAPI.Models.Entity;

public class UserModel
{
	public int UserId { get; set; } = 0;

	public required string UserName { get; set; }

	public required string Password { get; set; }
}