namespace StudentSystemAPI.Services.Entity;

public class StudentSurveyService : IStudentSurveyService
{
	private readonly IDataConnections _connections;

	public StudentSurveyService(IDataConnections connections)
	{
		_connections = connections;
	}


	public async Task<int> SaveStudentSurvey(StudentSurveyModels studentSurvey)
	{
		try
		{
			var parameters = studentSurvey.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_StudentSurvey_Save", parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<int> DeleteStudentSurvey(int id)
	{
		try
		{
			var parameters = new { SurveyId = id }.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_StudentSurvey_Delete", parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<StudentSurveyModels> GetStudentSurvey(int id)
	{
		try
		{
			var parameters = new { SurveyId = id }.ConvertToDynamicParameters();
			return await _connections.GetItem<StudentSurveyModels>("TB_StudentSurvey_Get", parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<IEnumerable<StudentSurveyModels>> GetStudentSurveys()
	{
		try
		{
			return await _connections.GetData<StudentSurveyModels>("TB_StudentSurvey_GetAll", default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}