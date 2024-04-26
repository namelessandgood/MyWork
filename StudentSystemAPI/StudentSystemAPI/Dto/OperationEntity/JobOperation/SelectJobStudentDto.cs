namespace StudentSystemAPI.Dto.OperationEntity.JobOperation;

public class SelectJobStudentDto
{
	public int JobId { get; set; }
	public int PersonId { get; set; }
	public required string JobLocation { get; set; }
	public required string JobType { get; set; }
	public DateTime? DateOfCommencementAfterTheLastCertificate { get; set; }
	public int? NoObjectionLetterNumber { get; set; }
	public DateTime? DateOfTheNoObjectionBook { get; set; }
	public required string TypeOfStudyLeave { get; set; }

}