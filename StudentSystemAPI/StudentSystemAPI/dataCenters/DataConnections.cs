using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;

namespace StudentSystemAPI.DataConnections;

public class DataConnections : IDataConnections
{
	public async Task<int> ExecuteCommand(string commandText, DynamicParameters commandAction)
	{
		try
		{
			await using var connection = GetConnection().Result;
			connection.Open();
			return await connection.ExecuteAsync(commandText, commandAction, commandType: CommandType.StoredProcedure);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<IEnumerable<T>> GetData<T>(string commandText, DynamicParameters? commandAction)
	{
		try
		{
			await using var connection = GetConnection().Result;
			connection.Open();
			return await connection.QueryAsync<T>(commandText, commandAction!,
				commandType: CommandType.StoredProcedure);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	public async Task<T> GetItem<T>(string commandText, DynamicParameters? commandAction)
	{
		try
		{
			await using var connection = GetConnection().Result;
			connection.Open();
			return (await connection.QueryFirstOrDefaultAsync<T>(commandText, commandAction!,
				commandType: CommandType.StoredProcedure))!;
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}


	private async Task<SqlConnection> GetConnection()
	{
		try
		{

			var builder = new SqlConnectionStringBuilder
			{
				//DataSource = 'Server Connection ',
				//InitialCatalog = "table name",
				//IntegratedSecurity = true,
				//MultipleActiveResultSets = true,
				//TrustServerCertificate = true
			};

			return await Task.FromResult(new SqlConnection(builder.ConnectionString));
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}