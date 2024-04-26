namespace StudentSystemAPI.Services.Interfaces;

public interface IPersonService
{
	Task<IEnumerable<PersonModel>> GetAllPerson();
	Task<int> SavePerson(PersonModel person);
	Task<int> DeletePerson(int id);
	Task<PersonModel> GetPersonById(int id);
}