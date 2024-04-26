namespace StudentSystemAPI.Dto.OperationEntity.CollageDepartmentOperation;

public class SelectCollegeDepartmentDto
{
	public int CollegeDepartmentId { get; set; }
	public required string CollegeDepartmentName { get; set; }
	public int CollegeId { get; set; }
}