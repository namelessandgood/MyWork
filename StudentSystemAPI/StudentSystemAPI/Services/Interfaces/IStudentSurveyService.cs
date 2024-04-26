namespace StudentSystemAPI.Services.Interfaces;

public interface IStudentSurveyService
{
	Task<int> SaveStudentSurvey(StudentSurveyModels studentSurvey);
	Task<int> DeleteStudentSurvey(int id);
	Task<StudentSurveyModels> GetStudentSurvey(int id);
	Task<IEnumerable<StudentSurveyModels>> GetStudentSurveys();
}