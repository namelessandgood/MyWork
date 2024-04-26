using Dapper;

namespace StudentSystemAPI.DataConnections;

public interface IDataConnections
{
	Task<int> ExecuteCommand(string commandText, DynamicParameters commandAction);
	Task<IEnumerable<T>> GetData<T>(string commandText, DynamicParameters commandAction);
	public Task<T> GetItem<T>(string commandText, DynamicParameters commandAction);
}