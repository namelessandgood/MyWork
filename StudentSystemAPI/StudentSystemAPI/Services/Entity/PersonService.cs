namespace StudentSystemAPI.Services.Entity;

public class PersonService : IPersonService
{
	private readonly IDataConnections _connections;

	public PersonService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<IEnumerable<PersonModel>> GetAllPerson()
	{
		try
		{
			var result = await _connections.GetData<PersonModel>("TB_PersonalInfo_Get", default!);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<int> SavePerson(PersonModel person)
	{
		try
		{
			var parameters = person.ConvertToDynamicParameters();
			var result = await _connections.ExecuteCommand("TB_PersonalInfo_Save", parameters);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> DeletePerson(int id)
	{
		try
		{
			var parameters = new { PersonId = id }.ConvertToDynamicParameters();
			var result = await _connections.ExecuteCommand("TB_PersonalInfo_Delete", parameters);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<PersonModel> GetPersonById(int id)
	{
		try
		{
			var parameters = new { PersonId = id }.ConvertToDynamicParameters();
			var result = await _connections.GetItem<PersonModel>("TB_PersonalInfo_GetById", parameters);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}