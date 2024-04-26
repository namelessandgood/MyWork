namespace StudentSystemAPI.Models.Entity;

public class CollegeModel
{
	public int CollegeId { get; set; }

	public required string CollegeName { get; set; }

	public int UniversityId { get; set; }
}