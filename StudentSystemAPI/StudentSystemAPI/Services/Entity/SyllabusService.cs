namespace StudentSystemAPI.Services.Entity;

public class SyllabusService : ISyllabusService
{
	private readonly IDataConnections _connections;

	public SyllabusService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<SyllabusModel> GetById(int id)
	{
		try
		{
			var sender = new { SyllabusId = id };
			return await _connections.GetItem<SyllabusModel>("TB_Syllabus_GetById",
				sender.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<IEnumerable<SyllabusModel>> GetAll()
	{
		try
		{
			return await _connections.GetData<SyllabusModel>("TB_Syllabus_GetAll",
				default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> Save(SyllabusModel model)
	{
		try
		{
			var parameters = model.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_Syllabus_Save", parameters);
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
			var sender = new { SyllabusId = id };
			return await _connections.ExecuteCommand("TB_Syllabus_Delete",
				sender.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}