namespace StudentSystemAPI.Services.Interfaces;

public interface IProgramStudyService
{
	Task<int> SaveProgramStudy(ProgramStudyModel programStudy);
	Task<int> DeleteProgramStudy(int id);
	Task<ProgramStudyModel> GetProgramStudy(int id);
	Task<IEnumerable<ProgramStudyModel>> GetProgramStudies();
}