namespace StudentSystemAPI.Services.Entity;

public class CollegeDepartmentService : ICollegeDepartmentService
{
	private readonly IDataConnections _dataConnections;

	public CollegeDepartmentService(IDataConnections dataConnections)
	{
		_dataConnections = dataConnections;
	}

	public async Task<int> SaveCollageDepartment(CollegeDepartmentModel collageDepartmentDto)
	{
		try
		{
			var parameters = collageDepartmentDto.ConvertToDynamicParameters();
			return await _dataConnections.ExecuteCommand("TB_CollegeDepartment_Save", parameters);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<int> DeleteCollageDepartment(int collageDepartmentId)
	{
		try
		{
			var parameter = new { CollegeDepartmentId = collageDepartmentId };
			return await _dataConnections.ExecuteCommand("TB_CollegeDepartment_Delete",
				parameter.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<CollegeDepartmentModel> GetCollageDepartmentById(int collageDepartmentId)
	{
		try
		{
			var parameter = new { CollegeDepartmentId = collageDepartmentId };
			return await _dataConnections.GetItem<CollegeDepartmentModel>("TB_CollegeDepartment_GetById",
				parameter.ConvertToDynamicParameters());
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<IEnumerable<CollegeDepartmentModel>> GetAllCollageDepartments()
	{
		try
		{
			return await _dataConnections.GetData<CollegeDepartmentModel>("TB_CollegeDepartment_GetAll",
				default!);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}