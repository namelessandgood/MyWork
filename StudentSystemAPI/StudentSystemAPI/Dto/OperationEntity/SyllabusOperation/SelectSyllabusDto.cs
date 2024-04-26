namespace StudentSystemAPI.Dto.OperationEntity.SyllabusOperation;

public class SelectSyllabusDto
{
	public int SyllabusId { get; set; }

	public string? Subject { get; set; }

	public string? SubjectArb { get; set; }

	public int Units { get; set; }

	public int? TotalHours { get; set; }

	public int Semester { get; set; }
}