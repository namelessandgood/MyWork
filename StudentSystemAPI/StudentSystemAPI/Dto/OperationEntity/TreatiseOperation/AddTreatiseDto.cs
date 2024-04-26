namespace StudentSystemAPI.Dto.OperationEntity.TreatiseOperation;
public class AddTreatiseDto
{
	public required string ThesisTitle { get; set; }
	public DateTime DateOfCommencementOfSupervision { get; set; }
	public required string SupervisorAssignmentOrderNumber { get; set; }
	public DateTime TheDateOfTheOrderAppointingSupervisor { get; set; }
	public required string NameAndTitleOfTheSupervisor { get; set; }
	public required string SupervisorSpecialty { get; set; }
	public bool MessageDelivery { get; set; }
	public required string DiscussionCommitteeOrderNumber { get; set; }
	public DateTime DateOfTheDiscussionCommitteeOrder { get; set; }
	public float CourseRate { get; set; }
	public float DegreeOfDiscussion { get; set; }
	public float FinalGraduationRate { get; set; }
	public string? UniversityOrderNumberGrantingTheCertificate { get; set; }
	public DateTime? DateOfTheUniversityOrderGrantingTheCertificate { get; set; }
	public string? AdministrativeOrderNumberForTheFirstExtension { get; set; }
	public DateTime? DateOfTheAdministrativeOrderForTheFirstExtension { get; set; }
	public string? AdministrativeOrderNumberForTheSecondExtension { get; set; }
	public DateTime? DateOfTheAdministrativeOrderForTheSecondExtension { get; set; }
	public string? Notes { get; set; }
	public int StudentId { get; set; }
}