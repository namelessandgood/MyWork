namespace StudentSystemAPI.Services.Interfaces;

public interface ICollegeService
{
	Task<int> Save(CollegeModel collageModel);
	Task<int> Delete(int id);
	Task<IEnumerable<CollegeModel>> GetAll();
	Task<CollegeModel> GetCollege(int id);
}