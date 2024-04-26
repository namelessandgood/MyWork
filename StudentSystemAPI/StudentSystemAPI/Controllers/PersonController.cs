using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class PersonController : ControllerBase
{
	private readonly IPersonService _personService;
	private readonly IMapper _mapper;

	public PersonController(IPersonService personService, IMapper mapper)
	{
		_personService = personService;
		_mapper = mapper;
	}

	[HttpGet("GetAllPerson")]
	public async Task<IActionResult> GetAllPerson()
	{
		try
		{
			var result = await _personService.GetAllPerson();
			var mapper = _mapper.Map<IEnumerable<SelectPersonDto>>(result);
			return Ok(mapper);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet("person/{id:int}")]
	public async Task<IActionResult> GetPersonById([FromRoute] int id)
	{
		try
		{
			var result = await _personService.GetPersonById(id);
			var mapper = _mapper.Map<SelectPersonDto>(result);
			return Ok(mapper);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPost("addPerson")]
	public async Task<IActionResult> SavePerson([FromBody] AddPersonDto person)
	{
		try
		{
			var mapper = _mapper.Map<PersonModel>(person);
			var result = await _personService.SavePerson(mapper);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPut("updatePerson/{id:int}")]
	public async Task<IActionResult> UpdatePerson([FromRoute] int id, [FromBody] UpdatePersonDto person)
	{
		try
		{
			var mapper = _mapper.Map<PersonModel>(person);
			var result = await _personService.SavePerson(mapper);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpDelete("deletePerson/{id:int}")]
	public async Task<IActionResult> DeletePerson([FromRoute] int id)
	{
		try
		{
			var result = await _personService.DeletePerson(id);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

}

