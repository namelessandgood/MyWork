namespace StudentSystemAPI.Services.Interfaces;

public interface IUniversityService
{
	Task<int> Save(UniversityModel universityModel);
	Task<int> Delete(int universityId);
	Task<IEnumerable<UniversityModel>> GetAll();
	Task<UniversityModel> GetById(int universityId);
}