namespace StudentSystemAPI.Models.Entity;

public class TeacherModel
{
	public int TeacherId { get; set; } = 0;

	public required string FirstName { get; set; }

	public required string SecondName { get; set; }

	public required string ThirdName { get; set; }

	public string ForthName { get; set; } = string.Empty;

	public required string Email { get; set; }

	public DateTime DateOfBirth { get; set; }

	public required string PhoneNumber { get; set; }

	public int SexType { get; set; }

	public int HighDiploma { get; set; } = 0;

	public int MasterStudent { get; set; } = 0;

	public int PhDStudent { get; set; } = 0;

	public required string StudyTypeName { get; set; }

	public required string ScientificTitle { get; set; }

	public required string StudyGeneralName { get; set; }

	public required string StudyCompetenceName { get; set; }

	public required string NBookCurrent { get; set; }

	public required string DateBookCurrent { get; set; }
}