namespace StudentSystemAPI.Services.Interfaces;

public interface IProgramService
{
	Task<int> SaveProgram(ProgramModel programModel);
	Task<int> DeleteProgram(int programId);
	Task<ProgramModel> GetProgramById(int programId);
	Task<IEnumerable<ProgramModel>> GetAllPrograms();
}