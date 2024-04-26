namespace StudentSystemAPI.Services.Entity;

public class CollegeService : ICollegeService
{
	private readonly IDataConnections _dataConnections;

	public CollegeService(IDataConnections dataConnections)
	{
		_dataConnections = dataConnections;
	}

	public async Task<int> Save(CollegeModel collageModel)
	{
		try
		{
			var parameters = collageModel.ConvertToDynamicParameters();
			return await _dataConnections.ExecuteCommand("TB_College_Save", parameters);
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
			var parameter = new { CollegeId = id };
			return await _dataConnections.ExecuteCommand("TB_College_Delete",
				parameter.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<IEnumerable<CollegeModel>> GetAll()
	{
		try
		{
			return await _dataConnections.GetData<CollegeModel>("TB_College_GetAll", default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<CollegeModel> GetCollege(int id)
	{
		try
		{
			var parameter = new { CollegeId = id };
			return await _dataConnections.GetItem<CollegeModel>("TB_College_GetById",
				parameter.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}