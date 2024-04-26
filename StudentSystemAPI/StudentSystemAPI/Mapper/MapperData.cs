namespace StudentSystemAPI.Mapper;

public class MapperData : Profile
{
	public MapperData()
	{
		// student entity to student model information
		CreateMap<AddStudentDto, StudentModel>().ReverseMap();
		CreateMap<UpdateStudentDto, StudentModel>().ReverseMap();
		CreateMap<DeleteStudentDto, StudentModel>().ReverseMap();
		CreateMap<SelectStudentDto, StudentModel>().ReverseMap();

		// Collage entity to collage model information
		CreateMap<AddCollegeDto, CollegeModel>().ReverseMap();
		CreateMap<UpdateCollegeDto, CollegeModel>().ReverseMap();
		CreateMap<DeleteCollegeDto, CollegeModel>().ReverseMap();
		CreateMap<SelectCollegeDto, CollegeModel>().ReverseMap();

		// User entity to user model information
		CreateMap<AddUserDto, UserModel>().ReverseMap();
		CreateMap<UpdateUserDto, UserModel>().ReverseMap();
		CreateMap<DeleteUserDto, UserModel>().ReverseMap();
		CreateMap<SelectUserDto, UserModel>().ReverseMap();

		// Job Student entity to job Student model information
		CreateMap<AddJobStudentDto, JobStudentModel>().ReverseMap();
		CreateMap<UpdateJobStudentDto, JobStudentModel>().ReverseMap();
		CreateMap<DeleteJobStudentDto, JobStudentModel>().ReverseMap();
		CreateMap<SelectJobStudentDto, JobStudentModel>().ReverseMap();

		// Program entity to program model information
		CreateMap<AddProgramDto, ProgramModel>().ReverseMap();
		CreateMap<UpdateProgramDto, ProgramModel>().ReverseMap();
		CreateMap<DeleteProgramDto, ProgramModel>().ReverseMap();
		CreateMap<SelectProgramDto, ProgramModel>().ReverseMap();

		//Program Study entity to program study model information
		CreateMap<AddProgramStudyDto, ProgramStudyModel>().ReverseMap();
		CreateMap<UpdateProgramStudyDto, ProgramStudyModel>().ReverseMap();
		CreateMap<DeleteProgramStudyDto, ProgramStudyModel>().ReverseMap();
		CreateMap<SelectProgramStudyDto, ProgramStudyModel>().ReverseMap();

		// Teacher entity to teacher model information
		CreateMap<AddTeacherDto, TeacherModel>().ReverseMap();
		CreateMap<UpdateTeacherDto, TeacherModel>().ReverseMap();
		CreateMap<SelectTeacherDto, TeacherModel>().ReverseMap();

		// University entity to models 

		CreateMap<AddUniversityDto, UniversityModel>().ReverseMap();
		CreateMap<UpdateUniversityDto, UniversityModel>().ReverseMap();
		CreateMap<SelectUniversityDto, UniversityModel>().ReverseMap();

		// Syllabus entity to models

		CreateMap<AddSyllabusDto, SyllabusModel>().ReverseMap();
		CreateMap<UpdateSyllabusDto, SyllabusModel>().ReverseMap();
		CreateMap<SelectSyllabusDto, SyllabusModel>().ReverseMap();
		CreateMap<DeleteTeachingDto, TeachingModel>().ReverseMap();

		// teaching entity to models
		CreateMap<AddTeachingDto, TeachingModel>().ReverseMap();
		CreateMap<UpdateTeachingDto, TeachingModel>().ReverseMap();
		CreateMap<SelectTeachingDto, TeachingModel>().ReverseMap();
		CreateMap<DeleteTeachingDto, TeachingModel>().ReverseMap();

		// user entity to models
		CreateMap<AddUserDto, UserModel>().ReverseMap();
		CreateMap<UpdateUserDto, UserModel>().ReverseMap();
		CreateMap<SelectUserDto, UserModel>().ReverseMap();
		CreateMap<DeleteUserDto, UserModel>().ReverseMap();

		// collegeDepartment entity to models
		CreateMap<AddCollegeDepartmentDto, CollegeDepartmentModel>().ReverseMap();
		CreateMap<UpdateCollegeDepartmentDto, CollegeDepartmentModel>().ReverseMap();
		CreateMap<SelectCollegeDepartmentDto, CollegeDepartmentModel>().ReverseMap();
		CreateMap<DeleteCollegeDepartmentDto, CollegeDepartmentModel>().ReverseMap();

		// person entity to models
		CreateMap<AddPersonDto, PersonModel>().ReverseMap();
		CreateMap<UpdatePersonDto, PersonModel>().ReverseMap();
		CreateMap<SelectPersonDto, PersonModel>().ReverseMap();
		CreateMap<DeletePersonDto, PersonModel>().ReverseMap();

		// student admissions entity to models StudentAdmissions
		CreateMap<AddStudentAdmissionsDto, StudentAdmissionsModel>().ReverseMap();
		CreateMap<UpdateStudentAdmissionsDto, StudentAdmissionsModel>().ReverseMap();
		CreateMap<SelectStudentAdmissionsDto, StudentAdmissionsModel>().ReverseMap();
		CreateMap<DeleteStudentAdmissionsDto, StudentAdmissionsModel>().ReverseMap();


	}
}