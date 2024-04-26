namespace StudentSystemAPI.Services.Interfaces;

public interface IStudentAdmissionsService
{
	Task<IEnumerable<StudentAdmissionsModel>> GetStudentAdmissions();
	Task<StudentAdmissionsModel> GetStudentAdmission(int id);
	Task<int> SaveStudentAdmission(StudentAdmissionsModel studentAdmission);
	Task<int> DeleteStudentAdmission(int id);
}