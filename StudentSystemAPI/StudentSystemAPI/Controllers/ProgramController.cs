using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class ProgramController : ControllerBase
{
	private readonly IMapper _mapper;
	private readonly IProgramService _programService;

	public ProgramController(IProgramService programService, IMapper mapper)
	{
		_programService = programService;
		_mapper = mapper;
	}

	[HttpGet]
	public async Task<IActionResult> GetAllPrograms()
	{
		try
		{
			var result = await _programService.GetAllPrograms();
			var mappedResult = _mapper.Map<IEnumerable<SelectProgramDto>>(result);
			return Ok(mappedResult);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			return BadRequest(e.Message);
		}
	}

	[HttpGet("GetProgramById/{programId}")]
	public async Task<IActionResult> GetProgramById([FromRoute] int programId)
	{
		try
		{
			var result = await _programService.GetProgramById(programId);
			var mappedResult = _mapper.Map<SelectProgramDto>(result);
			return Ok(mappedResult);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			return BadRequest(e.Message);
		}
	}

	[HttpPost("SaveProgram")]
	public async Task<IActionResult> SaveProgram([FromBody] AddProgramDto programDto)
	{
		try
		{
			var mappedResult = _mapper.Map<ProgramModel>(programDto);
			var result = await _programService.SaveProgram(mappedResult);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			return BadRequest(e.Message);
		}
	}

	[HttpDelete("DeleteProgram/{programId}")]
	public async Task<IActionResult> DeleteProgram([FromRoute] int programId)
	{
		try
		{
			var result = await _programService.DeleteProgram(programId);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			return BadRequest(e.Message);
		}
	}

	[HttpPut("update/{programId:int}")]
	public async Task<IActionResult> UpdateProgram([FromRoute] int programId, [FromBody] UpdateProgramDto programDto)
	{
		try
		{
			var mappedResult = _mapper.Map<ProgramModel>(programDto);
			mappedResult.ProgramId = programId;
			var result = await _programService.SaveProgram(mappedResult);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			return BadRequest(e.Message);
		}
	}
}