namespace StudentSystemAPI.Services.Interfaces;

public interface ITreatiseService
{
	Task<int> SaveTreatise(TreatiseModel treatise);
	Task<int> DeleteTreatise(int treatiseId);
	Task<TreatiseModel> GetTreatise(int treatiseId);
	Task<IEnumerable<TreatiseModel>> GetTreatises();
}