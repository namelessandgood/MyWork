namespace StudentSystemAPI.Models.Entity;

public class CollegeDepartmentModel
{
	public int CollegeDepartmentId { get; set; }

	public required string CollegeDepartmentName { get; set; }

	public int CollegeId { get; set; }
}