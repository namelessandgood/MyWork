namespace StudentSystemAPI.Dto.OperationEntity.PersonOperation;
public class AddPersonDto
{
	public required string FirstName { get; set; }

	public required string SecondName { get; set; }

	public required string ThirdName { get; set; }

	public string ForthName { get; set; } = string.Empty;

	public required string TitleName { get; set; }

	public required string MotherName { get; set; }

	public required int SexType { get; set; }

	public DateTime DateOfBirth { get; set; }

	public required string Email { get; set; }

	public required string PhoneNumber { get; set; }

	public required string HomeAddress { get; set; }

}