namespace StudentSystemAPI.Services.Entity;

public class TeachingService : ITeachingService
{
	private readonly IDataConnections _connections;

	public TeachingService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<TeachingModel> GetById(int id)
	{
		try
		{
			var send = new { TeachingId = id };

			var result =
				await _connections.GetItem<TeachingModel>("TB_Teaching_GetById", send.ConvertToDynamicParameters());
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<IEnumerable<TeachingModel>> GetAll()
	{
		try
		{
			return await _connections.GetData<TeachingModel>("TB_Teaching_Get", default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<int> Save(TeachingModel model)
	{
		try
		{
			var result = await _connections.ExecuteCommand("TB_Teaching_Save",
				model.ConvertToDynamicParameters());
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<int> DeleteById(int id)
	{
		try
		{
			var send = new { TeachingId = id };
			var result = await _connections.ExecuteCommand("TB_Teaching_Delete",
				send.ConvertToDynamicParameters());
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}