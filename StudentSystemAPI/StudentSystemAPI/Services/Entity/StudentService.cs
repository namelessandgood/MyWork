namespace StudentSystemAPI.Services.Entity;

public class StudentService : IStudentService
{
	private readonly IDataConnections _connections;

	public StudentService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<int> Save(StudentModel student)
	{
		try
		{
			var parameters = student.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_Student_Save", parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<StudentModel> GetById(int id)
	{
		try
		{
			var parameter = new { StudentId = id };
			return await _connections.GetItem<StudentModel>("TB_Student_GetById",
				parameter.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<IEnumerable<StudentModel>> GetAll()
	{
		try
		{
			return await _connections.GetData<StudentModel>("TB_Student_GetAll", default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> Delete(int id)
	{
		try
		{
			var parameter = new { StudentId = id };
			return await _connections.ExecuteCommand("TB_Student_Delete",
								parameter.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}
