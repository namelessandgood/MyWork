namespace StudentSystemAPI.Dto.OperationEntity.StudentSurveyOperation;

public class UpdateStudentSurveyDto
{
	public required int PersonId { get; set; }
	public required string GrantingTheCertificate { get; set; }
	public required float StudentTotal { get; set; }
	public required string GraduationYear { get; set; }
	public required DateTime CertificateDate { get; set; }
	public required int DocumentNumber { get; set; }
	public required DateTime DocumentDate { get; set; }
}