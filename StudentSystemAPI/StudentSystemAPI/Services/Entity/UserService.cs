namespace StudentSystemAPI.Services.Entity;

public class UserService : IUserService
{
	private readonly IDataConnections _connections;

	public UserService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<int> Save(UserModel user)
	{
		try
		{
			var parameters = user.ConvertToDynamicParameters();
			return await _connections.ExecuteCommand("TB_Users_Save", parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public Task<int> Delete(int id)
	{
		try
		{
			var parameters = new { UserId = id };
			return _connections.ExecuteCommand("TB_Users_Delete", parameters.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<UserModel> GetById(int id)
	{
		try
		{
			var parameters = new { UserId = id };
			return await _connections.GetItem<UserModel>("TB_Users_GetById",
				parameters.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<IEnumerable<UserModel>> GetAll()
	{
		try
		{
			return await _connections.GetData<UserModel>("TB_Users_Get", default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}