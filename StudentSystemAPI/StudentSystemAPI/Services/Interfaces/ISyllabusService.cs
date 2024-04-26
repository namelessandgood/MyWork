namespace StudentSystemAPI.Services.Interfaces;

public interface ISyllabusService
{
	Task<SyllabusModel> GetById(int id);
	Task<IEnumerable<SyllabusModel>> GetAll();
	Task<int> Save(SyllabusModel model);
	Task<int> Delete(int id);
}