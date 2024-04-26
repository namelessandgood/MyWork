using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class SyllabusController : ControllerBase
{
	private readonly IMapper _mapper;
	private readonly ISyllabusService _syllabusService;

	public SyllabusController(ISyllabusService service, IMapper mapper)
	{
		_syllabusService = service;
		_mapper = mapper;
	}


	[HttpGet("getSyllabus/{id:int}")]
	public async Task<IActionResult> GetById([FromRoute] int id)
	{
		try
		{
			var result = await _syllabusService.GetById(id);
			var model = _mapper.Map<SelectSyllabusDto>(result);
			return Ok(model);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet("getall")]
	public async Task<IActionResult> GetAll()
	{
		try
		{
			var result = await _syllabusService.GetAll();
			var model = _mapper.Map<IEnumerable<SelectSyllabusDto>>(result);
			return Ok(model);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPost("add")]
	public async Task<IActionResult> Add([FromBody] AddSyllabusDto model)
	{
		try
		{
			var modelEntity = _mapper.Map<SyllabusModel>(model);
			var result = await _syllabusService.Save(modelEntity);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPut("update/{id:int}")]
	public async Task<IActionResult> Update([FromRoute] int syllabusId, [FromBody] UpdateSyllabusDto model)
	{
		try
		{
			var modelEntity = _mapper.Map<SyllabusModel>(model);
			modelEntity.SyllabusId = syllabusId;
			var result = await _syllabusService.Save(modelEntity);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpDelete("delete/{id:int}")]
	public async Task<IActionResult> Delete([FromRoute] int id)
	{
		try
		{
			var result = await _syllabusService.Delete(id);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}