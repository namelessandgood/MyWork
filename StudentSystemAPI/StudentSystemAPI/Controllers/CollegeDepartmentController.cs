using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class CollegeDepartmentController : ControllerBase
{
	private readonly ICollegeDepartmentService _collegeDepartmentService;
	private readonly IMapper _mapper;

	public CollegeDepartmentController(ICollegeDepartmentService collegeDepartmentService, IMapper mapper)
	{
		_collegeDepartmentService = collegeDepartmentService;
		_mapper = mapper;
	}

	[HttpGet("GetCollegeDepartment/{id:int}")]
	public async Task<IActionResult> GetCollegeDepartmentById([FromRoute] int id)
	{
		try
		{
			var collegeDepartment = await _collegeDepartmentService.GetCollageDepartmentById(id);
			var collegeDepartmentDto = _mapper.Map<SelectCollegeDepartmentDto>(collegeDepartment);
			return Ok(collegeDepartmentDto);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet("GetAllCollegeDepartments")]
	public async Task<IActionResult> GetAllCollegeDepartments()
	{
		try
		{
			var collegeDepartments =
				await _collegeDepartmentService.GetAllCollageDepartments();
			var collegeDepartmentDto =
				_mapper.Map<IEnumerable<SelectCollegeDepartmentDto>>(collegeDepartments);
			return Ok(collegeDepartmentDto);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPost("AddCollegeDepartment")]
	public async Task<IActionResult> AddCollegeDepartment([FromBody] AddCollegeDepartmentDto collegeDepartmentDto)
	{
		try
		{
			var collegeDepartment = _mapper.Map<CollegeDepartmentModel>(collegeDepartmentDto);
			var res = await _collegeDepartmentService.SaveCollageDepartment(collegeDepartment);
			return Ok(res);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPut("UpdateCollegeDepartment/{collegeDepartmentId:int}")]
	public async Task<IActionResult> UpdateCollegeDepartment([FromRoute] int collegeDepartmentId,
		[FromBody] UpdateCollegeDepartmentDto collegeDepartmentDto)
	{
		try
		{
			var collegeDepartment = _mapper.Map<CollegeDepartmentModel>(collegeDepartmentDto);
			collegeDepartment.CollegeDepartmentId = collegeDepartmentId;
			var res = await _collegeDepartmentService.SaveCollageDepartment(collegeDepartment);
			return Ok(res);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpDelete("DeleteCollegeDepartment/{id:int}")]
	public async Task<IActionResult> DeleteCollegeDepartment([FromRoute] int id)
	{
		try
		{
			var res = await _collegeDepartmentService.DeleteCollageDepartment(id);
			return Ok(res);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}