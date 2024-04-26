using AutoMapper;

namespace StudentSystemAPI.Controllers;
[Route("api/[controller]")]
[ApiController]
public class ProgramStudyController : ControllerBase
{
	private readonly IProgramStudyService _programStudyService;
	private readonly IMapper _mapper;

	public ProgramStudyController(IProgramStudyService programStudyService, IMapper mapper)
	{
		_programStudyService = programStudyService;
		_mapper = mapper;
	}

	[HttpPost("add")]
	public async Task<IActionResult> SaveProgramStudy([FromBody] AddProgramStudyDto programStudyModel)
	{
		try
		{
			var programStudy = _mapper.Map<ProgramStudyModel>(programStudyModel);
			var result = await _programStudyService.SaveProgramStudy(programStudy);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpDelete("delete/{id}")]
	public async Task<IActionResult> DeleteProgramStudy([FromRoute] int id)
	{
		try
		{
			var result = await _programStudyService.DeleteProgramStudy(id);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet("get/{id}")]
	public async Task<IActionResult> GetProgramStudy([FromRoute] int id)
	{
		try
		{
			var result = await _programStudyService.GetProgramStudy(id);
			var mapper = _mapper.Map<SelectProgramStudyDto>(result);
			return Ok(mapper);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet("GetProgramStudies")]
	public async Task<IActionResult> GetProgramStudies()
	{
		try
		{
			var result = await _programStudyService.GetProgramStudies();
			var mapper = _mapper.Map<IEnumerable<SelectProgramStudyDto>>(result);
			return Ok(mapper);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPut("update/{id}")]
	public async Task<IActionResult> UpdateProgramStudy([FromRoute] int id,
		[FromBody] UpdateProgramStudyDto programStudyModel)
	{
		try
		{
			var programStudy = _mapper.Map<ProgramStudyModel>(programStudyModel);
			programStudy.ProgramStudyId = id;
			var result = await _programStudyService.SaveProgramStudy(programStudy);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

}
