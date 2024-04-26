using AutoMapper;

namespace StudentSystemAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class UsersController : ControllerBase
{
	private readonly IMapper _mapper;
	private readonly IUserService _userService;

	public UsersController(IUserService userService, IMapper mapper)
	{
		_userService = userService;
		_mapper = mapper;
	}

	[HttpGet("GetAll")]
	public async Task<IActionResult> GetAll()
	{
		try
		{
			var users = await _userService.GetAll();
			var usersDto = _mapper.Map<IEnumerable<SelectUserDto>>(users);
			return Ok(usersDto);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpGet("getuser/{id}")]
	public async Task<IActionResult> GetById([FromRoute] int id)
	{
		try
		{
			var user = await _userService.GetById(id);
			var usersDto = _mapper.Map<IEnumerable<SelectUserDto>>(user);
			return Ok(usersDto);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPost("Save")]
	public async Task<IActionResult> Save([FromBody] AddUserDto user)
	{
		try
		{
			var saveUser = _mapper.Map<UserModel>(user);
			var result = await _userService.Save(saveUser);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}

	[HttpPut("Update/{id:int}")]
	public async Task<IActionResult> Update([FromRoute] int id, [FromBody] UpdateUserDto user)
	{
		try
		{
			var updateUser = _mapper.Map<UserModel>(user);
			updateUser.UserId = id;
			var result = await _userService.Save(updateUser);
			return Ok(result);
		}
		catch (Exception e)
		{
			Console.WriteLine(e);
			throw;
		}
	}
}