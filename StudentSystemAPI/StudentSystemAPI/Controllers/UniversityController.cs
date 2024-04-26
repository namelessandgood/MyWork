using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class UniversityController : ControllerBase
{
	private readonly IMapper _mapper;
	private readonly IUniversityService _universityService;

	public UniversityController(IUniversityService university, IMapper mapper)
	{
		_universityService = university;
		_mapper = mapper;
	}

	[HttpGet]
	[Route("Get")]
	public async Task<ActionResult<IEnumerable<SelectUniversityDto>>> GetAll()
	{
		try
		{
			var result = await _universityService.GetAll();
			var mappedResult = _mapper.Map<IEnumerable<SelectUniversityDto>>(result);
			return Ok(mappedResult);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet]
	[Route("getone{universityId:int}")]
	public async Task<IActionResult> GetById([FromRoute] int universityId)
	{
		try
		{
			var result = await _universityService.GetById(universityId!);
			var mappedResult = _mapper.Map<SelectUniversityDto>(result);
			return Ok(mappedResult);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPost]
	[Route("save")]
	public async Task<IActionResult> Save([FromBody] AddUniversityDto university)
	{
		try
		{
			var universityModel = _mapper.Map<UniversityModel>(university);
			var result = await _universityService.Save(universityModel);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpDelete]
	[Route("delete/{universityId:int}")]
	public async Task<IActionResult> Delete([FromRoute] int universityId)
	{
		try
		{
			var result = await _universityService.Delete(universityId!);
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
	public async Task<IActionResult> Update([FromRoute] int id, [FromBody] UpdateUniversityDto university)
	{
		try
		{
			var universityModel = _mapper.Map<UniversityModel>(university);
			universityModel.UniversityId = id;
			var result = await _universityService.Save(universityModel);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}