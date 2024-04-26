namespace StudentSystemAPI.Services.Entity;

public class ProgramStudyService : IProgramStudyService
{
	private readonly IDataConnections _connections;

	public ProgramStudyService(IDataConnections connections)
	{
		_connections = connections;
	}

	public async Task<int> SaveProgramStudy(ProgramStudyModel programStudy)
	{
		try
		{
			var parameter = programStudy.ConvertToDynamicParameters();
			var result = await _connections.ExecuteCommand("TB_ProgramStudy_Save", parameter);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<int> DeleteProgramStudy(int id)
	{
		try
		{
			var parameter = new { ProgramStudyId = id }.ConvertToDynamicParameters();
			var result = await _connections.ExecuteCommand("TB_ProgramStudy_Delete", parameter);
			return result;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<ProgramStudyModel> GetProgramStudy(int id)
	{
		try
		{
			var parameter = new { ProgramStudyId = id }.ConvertToDynamicParameters();
			var res = await _connections.GetItem<ProgramStudyModel>("TB_ProgramStudy_GetById", parameter);
			return res;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	public async Task<IEnumerable<ProgramStudyModel>> GetProgramStudies()
	{
		try
		{
			var res =
				await _connections.GetData<ProgramStudyModel>("TB_ProgramStudy_GetAll", default!);
			return res;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}