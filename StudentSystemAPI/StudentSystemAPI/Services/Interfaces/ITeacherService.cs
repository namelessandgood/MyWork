namespace StudentSystemAPI.Services.Interfaces;

public interface ITeacherService
{
	Task<int> Save(TeacherModel teacher);
	Task<int> Delete(int teacherId);
	Task<IEnumerable<TeacherModel>> GetAll();
	Task<TeacherModel> GetTeacher(int teacherId);
}