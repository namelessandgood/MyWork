namespace StudentSystemAPI.Services.Entity;

public class StudentAdmissionsService : IStudentAdmissionsService
{
	private readonly IDataConnections _dataConnections;

	public StudentAdmissionsService(IDataConnections dataConnections)
	{
		_dataConnections = dataConnections;
	}

	public async Task<IEnumerable<StudentAdmissionsModel>> GetStudentAdmissions()
	{
		try
		{
			var studentAdmissions =
				await _dataConnections.GetData<StudentAdmissionsModel>("TB_StudentAdmissions_GetAll", default!);
			return studentAdmissions;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}

	}

	public async Task<StudentAdmissionsModel> GetStudentAdmission(int id)
	{
		try
		{
			var parameters = new { ChannelId = id }.ConvertToDynamicParameters();
			var res =
				await _dataConnections.GetItem<StudentAdmissionsModel>
					("TB_StudentAdmissions_GetById", parameters.ConvertToDynamicParameters());
			return res;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> SaveStudentAdmission(StudentAdmissionsModel studentAdmission)
	{
		try
		{
			var parameters = studentAdmission.ConvertToDynamicParameters();
			var res = await _dataConnections.ExecuteCommand("TB_StudentAdmissions_Save", parameters);
			return res;

		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> DeleteStudentAdmission(int id)
	{
		try
		{
			var parameters = new { ChannelId = id }.ConvertToDynamicParameters();
			var res = await _dataConnections.ExecuteCommand("TB_StudentAdmissions_Delete",
				parameters.ConvertToDynamicParameters());
			return res;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}