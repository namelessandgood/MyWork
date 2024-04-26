namespace StudentSystemAPI.Services.Entity;

public class JobStudentService : IJobStudentService
{
	private readonly IDataConnections _connections;

	public JobStudentService(IDataConnections connections)
	{
		_connections = connections;
	}


	public async Task<IEnumerable<JobStudentModel>> GetJobStudent()
	{
		try
		{
			return await _connections.GetData<JobStudentModel>("TB_JobStudentInfo_GetAll",
				default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<JobStudentModel> GetJobStudentById(int id)
	{
		try
		{
			var parameter = new { JobStudenId = id }.ConvertToDynamicParameters();
			return await _connections.GetItem<JobStudentModel>("TB_JobStudentInfo_GetById",
				parameter);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<int> SaveJobStudent(JobStudentModel jobStudent)
	{
		try
		{
			var parameter = jobStudent.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_JobStudentInfo_Save", parameter);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<int> DeleteJobStudent(int id)
	{
		try
		{
			var parameter = new { JobStudenId = id }.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_JobStudentInfo_Delete", parameter);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}