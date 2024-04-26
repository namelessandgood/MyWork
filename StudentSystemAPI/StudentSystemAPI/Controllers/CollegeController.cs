using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class CollegeController : ControllerBase
{
	private readonly ICollegeService _collegeService;
	private readonly IMapper _mapper;

	public CollegeController(ICollegeService collegeService, IMapper mapper)
	{
		_collegeService = collegeService;
		_mapper = mapper;
	}

	[HttpGet("getall")]
	public async Task<IActionResult> GetAll()
	{
		try
		{
			var colleges = await _collegeService.GetAll();
			var selectCollegeDto = _mapper.Map<List<SelectCollegeDto>>(colleges);
			return Ok(selectCollegeDto);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet("getbyid/{id}")]
	public async Task<IActionResult> GetById([FromRoute] int id)
	{
		try
		{
			var college = await _collegeService.GetCollege(id);
			var selectCollegeDto = _mapper.Map<SelectCollegeDto>(college);
			return Ok(selectCollegeDto);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPost("Save")]
	public async Task<IActionResult> Add([FromBody] AddCollegeDto addCollegeDto)
	{
		try
		{
			var college = _mapper.Map<CollegeModel>(addCollegeDto);
			var res = await _collegeService.Save(college);
			return Ok(res);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPut("Update")]
	public async Task<IActionResult> Update([FromRoute] int collegeId, [FromBody] UpdateCollegeDto updateCollegeDto)
	{
		try
		{
			var college = _mapper.Map<CollegeModel>(updateCollegeDto);
			college.CollegeId = collegeId;
			var res = await _collegeService.Save(college);
			return Ok(res);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpDelete("Delete/{id}")]
	public async Task<IActionResult> Delete([FromRoute] int id)
	{
		try
		{
			var res = await _collegeService.Delete(id);
			return Ok(res);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}