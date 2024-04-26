namespace StudentSystemAPI.Services.Interfaces;

public interface IUserService
{
	Task<int> Save(UserModel user);
	Task<int> Delete(int id);
	Task<UserModel> GetById(int id);
	Task<IEnumerable<UserModel>> GetAll();
}