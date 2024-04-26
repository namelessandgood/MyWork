namespace StudentSystemAPI.Dto.OperationEntity.SyllabusOperation;

public class AddSyllabusDto
{
	public required string Subject { get; set; }
	public required string SubjectArb { get; set; }
	public int Units { get; set; }
	public int? TotalHours { get; set; }
	public int Semester { get; set; }
}