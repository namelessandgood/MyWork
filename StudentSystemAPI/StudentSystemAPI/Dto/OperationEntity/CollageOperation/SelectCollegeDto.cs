namespace StudentSystemAPI.Dto.OperationEntity.CollageOperation;

public class SelectCollegeDto
{
	public int CollegeId { get; set; }

	public required string CollegeName { get; set; }

	public int UniversityId { get; set; }
}