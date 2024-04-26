namespace StudentSystemAPI.Services.Entity;

public class UniversityService : IUniversityService
{
	private readonly IDataConnections _connections;

	public UniversityService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<int> Save(UniversityModel universityModel)
	{
		try
		{
			var parameters = universityModel.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_University_Save", parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> Delete(int universityId)
	{
		try
		{
			var parameters = new { UniversityId = universityId }.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_University_Delete", parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<IEnumerable<UniversityModel>> GetAll()
	{
		try
		{
			return await _connections.GetData<UniversityModel>("TB_University_GetAll",
				default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<UniversityModel> GetById(int universityId)
	{
		try
		{
			var parameters = new { UniversityId = universityId }.ConvertToDynamicParameters();
			return await _connections.GetItem<UniversityModel>("TB_University_GetById",
				parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}