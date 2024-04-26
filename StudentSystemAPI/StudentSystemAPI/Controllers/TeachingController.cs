using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class TeachingController : ControllerBase
{
	private readonly IMapper _mapper;
	private readonly ITeachingService _service;

	public TeachingController(ITeachingService service, IMapper mapper)
	{
		_service = service;
		_mapper = mapper;
	}

	[HttpGet("getteaching/{id}")]
	public async Task<IActionResult> GetById([FromRoute] int id)
	{
		try
		{
			var result = await _service.GetById(id);
			var model = _mapper.Map<SelectTeachingDto>(result);
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
			var result = await _service.GetAll();
			var model = _mapper.Map<IEnumerable<SelectTeachingDto>>(result);
			return Ok(model);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPost("add")]
	public async Task<IActionResult> Add([FromBody] AddTeachingDto model)
	{
		try
		{
			var modelEntity = _mapper.Map<TeachingModel>(model);
			var result = await _service.Save(modelEntity);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpDelete("delete/{id}")]
	public async Task<IActionResult> Delete([FromRoute] int id)
	{
		try
		{
			var result = await _service.DeleteById(id);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPut("update/{id:int}")]
	public async Task<IActionResult> Update([FromRoute] int id, [FromBody] UpdateTeachingDto model)
	{
		try
		{
			var modelEntity = _mapper.Map<TeachingModel>(model);
			modelEntity.TeacherId = id;
			var result = await _service.Save(modelEntity);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}