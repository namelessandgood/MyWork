namespace StudentSystemAPI.Services.Interfaces;

public interface ITeachingService
{
	Task<TeachingModel> GetById(int id);
	Task<IEnumerable<TeachingModel>> GetAll();
	Task<int> Save(TeachingModel model);

	Task<int> DeleteById(int id);
}