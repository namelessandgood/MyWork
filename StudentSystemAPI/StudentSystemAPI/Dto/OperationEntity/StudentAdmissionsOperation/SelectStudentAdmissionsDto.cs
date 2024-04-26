namespace StudentSystemAPI.Dto.OperationEntity.StudentAdmissionsOperation;

public class SelectStudentAdmissionsDto
{
	public int ChannelId { get; set; }
	public required string AcceptanceChannel { get; set; }
	public required string YearOfAdmission { get; set; }
	public required string AdmissionMeal { get; set; }
	public required string UniversityAdmissionOrderNumber { get; set; }
	public string? DateOfUniversityAdmissionOrder { get; set; }
	public string? AdministrativeOrderNumberForAcceptance { get; set; }
	public string? DateAdministrativeOrderOfAcceptance { get; set; }
}