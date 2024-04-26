namespace StudentSystemAPI.Services.Interfaces;

public interface ICollegeDepartmentService
{
	Task<int> SaveCollageDepartment(CollegeDepartmentModel collageDepartmentDto);
	Task<int> DeleteCollageDepartment(int collageDepartmentId);
	Task<CollegeDepartmentModel> GetCollageDepartmentById(int collageDepartmentId);
	Task<IEnumerable<CollegeDepartmentModel>> GetAllCollageDepartments();
}