namespace StudentSystemAPI.Services.Entity;

public class ProgramService : IProgramService
{
	private readonly IDataConnections _connections;

	public ProgramService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<int> SaveProgram(ProgramModel programModel)
	{
		try
		{
			var parameter = programModel.ConvertToDynamicParameters();
			var result = await _connections.ExecuteCommand("TB_Program_Save", parameter);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<int> DeleteProgram(int programId)
	{
		try
		{
			var parameter = new { ProgramId = programId }.ConvertToDynamicParameters();
			var result = await _connections.ExecuteCommand("TB_Program_Delete", parameter);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<ProgramModel> GetProgramById(int programId)
	{
		try
		{
			var parameter = new { ProgramId = programId }.ConvertToDynamicParameters();
			return await _connections.GetItem<ProgramModel>("TB_Program_GetById", parameter);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<IEnumerable<ProgramModel>> GetAllPrograms()
	{
		try
		{
			return await _connections.GetData<ProgramModel>("TB_Program_GetAll",
				default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}