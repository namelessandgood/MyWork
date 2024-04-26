using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class TeacherController : ControllerBase
{
	private readonly IMapper _mapper;
	private readonly ITeacherService _teachingService;

	public TeacherController(IMapper mapper, ITeacherService teacherService)
	{
		_mapper = mapper;
		_teachingService = teacherService;
	}

	[HttpGet]
	[Route("GetAll")]
	public async Task<IActionResult> GetAll()
	{
		try
		{
			var result = await _teachingService.GetAll();
			var mappedResult = _mapper.Map<IEnumerable<SelectTeacherDto>>(result);
			return Ok(mappedResult);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet]
	[Route("Get/{id:int}")]
	public async Task<IActionResult> GetById([FromRoute] int id)
	{
		try
		{
			var result = await _teachingService.GetTeacher(id);
			var mappedResult = _mapper.Map<SelectTeacherDto>(result);
			return Ok(mappedResult);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPost]
	[Route("Save")]
	public async Task<IActionResult> Save([FromBody] AddTeacherDto teacher)
	{
		try
		{
			var mappedTeacher = _mapper.Map<TeacherModel>(teacher);
			var result = await _teachingService.Save(mappedTeacher);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpDelete]
	[Route("Delete/{id:int}")]
	public async Task<IActionResult> Delete([FromRoute] int id)
	{
		try
		{
			var result = await _teachingService.Delete(id);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPut]
	[Route("update/{id:int}")]
	public async Task<IActionResult> Update([FromRoute] int teacherId, [FromBody] UpdateTeacherDto teacher)
	{
		try
		{
			var mappedTeacher = _mapper.Map<TeacherModel>(teacher);
			mappedTeacher.TeacherId = teacherId;
			var result = await _teachingService.Save(mappedTeacher);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}