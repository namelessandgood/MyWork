namespace StudentSystemAPI.Services.Interfaces;

public interface IJobStudentService
{
	Task<IEnumerable<JobStudentModel>> GetJobStudent();
	Task<JobStudentModel> GetJobStudentById(int id);
	Task<int> SaveJobStudent(JobStudentModel jobStudent);
	Task<int> DeleteJobStudent(int id);
}