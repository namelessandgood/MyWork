namespace StudentSystemAPI.Services.Entity;

public class TreatiseService : ITreatiseService
{
	private readonly IDataConnections _dataConnections;

	public TreatiseService(IDataConnections dataConnections)
	{
		_dataConnections = dataConnections;
	}

	public async Task<int> SaveTreatise(TreatiseModel treatise)
	{
		try
		{
			var parameters = treatise.ConvertToDynamicParameters();
			return await _dataConnections.ExecuteCommand("TB_Treatise_Save", parameters);

		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> DeleteTreatise(int treatiseId)
	{
		try
		{
			var parameters = new { TreatiseId = treatiseId };
			return await _dataConnections.ExecuteCommand
				("TB_Treatise_Delete", parameters.ConvertToDynamicParameters());


		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<TreatiseModel> GetTreatise(int treatiseId)
	{
		try
		{
			var parameters = new { TreatiseId = treatiseId };
			var result = await _dataConnections.GetItem<TreatiseModel>("TB_Treatise_GetById",
				parameters.ConvertToDynamicParameters());
			return result;

		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<IEnumerable<TreatiseModel>> GetTreatises()
	{
		try
		{
			var res = await _dataConnections.GetData<TreatiseModel>
				("TB_Treatise_GetAll", default!);
			return res;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

}