namespace StudentSystemAPI.Dto.OperationEntity.CollageOperation;

public class AddCollegeDto
{
	public required string CollegeName { get; set; }

	public int UniversityId { get; set; }
}