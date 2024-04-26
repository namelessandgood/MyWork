using Dapper;
using StudentSystemAPI.Services.Entity;

namespace StudentSystemAPI.Exections;

public static class ServicesExtinctions
{
	public static DynamicParameters ConvertToDynamicParameters(this object obj)
	{
		var parameters = new DynamicParameters();
		var properties = obj.GetType().GetProperties();
		foreach (var property in properties)
		{
			var value = property.GetValue(obj);
			parameters.Add($"@{property.Name}", value);
		}

		//	parameters.Add("@returnflag", direction: ParameterDirection.ReturnValue);
		return parameters;
	}

	public static void ConfigureCors(this IServiceCollection services)
	{
		services.AddCors(options =>
		{
			options.AddPolicy("CorsPolicy", builder =>
				builder.AllowAnyOrigin()
					.AllowAnyMethod()
					.AllowAnyHeader());
		});
	}

	// configure DataConnections
	public static void ConfigureDataConnections(this IServiceCollection services)
	{
		services.AddScoped<IDataConnections, DataConnections.DataConnections>();
	}

	// configure TeacherService
	public static void ConfigureTeacher(this IServiceCollection service)
	{
		service.AddScoped<ITeacherService, TeacherService>();
	}

	// configure JobStudent
	public static void ConfigureJob(this IServiceCollection service)
	{
		service.AddScoped<IJobStudentService, JobStudentService>();
	}

	//configure CollegeService
	public static void ConfigureCollege(this IServiceCollection service)
	{
		service.AddScoped<ICollegeService, CollegeService>();
	}


	// configure UniversityService
	public static void ConfigureUniversity(this IServiceCollection service)
	{
		service.AddScoped<IUniversityService, UniversityService>();
	}

	// configure SyllabusService
	public static void ConfigureSyllabus(this IServiceCollection service)
	{
		service.AddScoped<ISyllabusService, SyllabusService>();
	}

	// configure TeachingService
	public static void ConfigureTeaching(this IServiceCollection service)
	{
		service.AddScoped<ITeachingService, TeachingService>();
	}

	// configure StudentService
	public static void ConfigureStudent(this IServiceCollection service)
	{
		//service.AddScoped<IStudentService, StudentService>();
	}

	// UserService : IUserService
	public static void ConfigureUserService(this IServiceCollection service)
	{
		service.AddScoped<IUserService, UserService>();
	}

	// CollegeDepartmentService : ICollegeDepartmentService
	public static void ConfigureCollegeDepartmentService(this IServiceCollection service)
	{
		service.AddScoped<ICollegeDepartmentService, CollegeDepartmentService>();
	}

	// ProgramService : IProgramService
	public static void ConfigureProgramService(this IServiceCollection service)
	{
		service.AddScoped<IProgramService, ProgramService>();
	}
	// programStudyService : IProgramStudyService
	public static void ConfigureProgramStudyService(this IServiceCollection service)
	{
		service.AddScoped<IProgramStudyService, ProgramStudyService>();
	}
	// PersonService : IPersonService
	public static void ConfigurePersonService(this IServiceCollection service)
	{
		service.AddScoped<IPersonService, PersonService>();
	}

	// configure StudentService
	public static void ConfigureStudentService(this IServiceCollection service)
	{
		service.AddScoped<IStudentAdmissionsService, StudentAdmissionsService>();
	}

	// configure TreatiseService
	public static void ConfigureTreatiseService(this IServiceCollection service)
	{
		service.AddScoped<ITreatiseService, TreatiseService>();
	}


}