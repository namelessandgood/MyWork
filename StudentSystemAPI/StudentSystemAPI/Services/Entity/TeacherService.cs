namespace StudentSystemAPI.Services.Entity;

public class TeacherService : ITeacherService
{
	private readonly IDataConnections _connections;

	public TeacherService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<int> Save(TeacherModel teacher)
	{
		try
		{
			var parameter = teacher.ConvertToDynamicParameters();
			var result = await _connections.ExecuteCommand("TB_Teacher_Save", parameter);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> Delete(int teacherId)
	{
		try
		{
			var teacher = new { TeacherId = teacherId };
			var res = await _connections.ExecuteCommand("TB_Teacher_Delete",
				teacher.ConvertToDynamicParameters());
			return res;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<IEnumerable<TeacherModel>> GetAll()
	{
		try
		{
			var res = await _connections.GetData<TeacherModel>("TB_Teacher_GetAll",
				default!);
			return res;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<TeacherModel> GetTeacher(int teacherId)
	{
		try
		{
			var teacher = new { TeacherId = teacherId };

			var res = await _connections.GetItem<TeacherModel>("TB_Teacher_GetById",
				teacher.ConvertToDynamicParameters());
			return res;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}