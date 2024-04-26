namespace StudentSystemAPI.Dto.OperationEntity.CollageDepartmentOperation;

public class AddCollegeDepartmentDto
{
	public required string CollegeDepartmentName { get; set; }

	public int CollegeId { get; set; }
}