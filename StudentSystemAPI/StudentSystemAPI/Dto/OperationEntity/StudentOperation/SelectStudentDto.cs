namespace StudentSystemAPI.Dto.OperationEntity.StudentOperation;

public class SelectStudentDto
{
	public int StudentId { get; set; }
	public int PersonId { get; set; }
	public int ChannelId { get; set; }
	public required string RegistrationPromotion { get; set; }
	public DateTime? DateStudy { get; set; }
	public int ProgramStudyId { get; set; }
}