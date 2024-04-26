namespace StudentSystemAPI.Models.Entity;

public class SyllabusModel
{
	public int SyllabusId { get; set; } = 0;

	public required string Subject { get; set; }

	public required string SubjectArb { get; set; }

	public int Units { get; set; }

	public int? TotalHours { get; set; }

	public int Semester { get; set; }
}