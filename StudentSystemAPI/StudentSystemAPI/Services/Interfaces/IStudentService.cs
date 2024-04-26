namespace StudentSystemAPI.Services.Interfaces;

public interface IStudentService
{
	Task<int> Save(StudentModel student);
	Task<StudentModel> GetById(int id);
	Task<IEnumerable<StudentModel>> GetAll();
	Task<int> Delete(int id);
}