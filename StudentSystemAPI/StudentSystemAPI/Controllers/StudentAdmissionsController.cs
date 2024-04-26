namespace StudentSystemAPI.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class StudentAdmissionsController : ControllerBase
	{
		private readonly IStudentAdmissionsService _admissionsService;
		private readonly IMapper _mapper;

		public StudentAdmissionsController(IStudentAdmissionsService admissionsService, IMapper mapper)
		{
			_admissionsService = admissionsService;
			_mapper = mapper;
		}

		// GET: api/<StudentAdmissionsController>
		[HttpGet("getall")]
		public async Task<IActionResult> GetAll()
		{
			try
			{
				var result = await _admissionsService.GetStudentAdmissions();
				var mapper = _mapper.Map<IEnumerable<SelectStudentAdmissionsDto>>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		[HttpGet("get/{id}")]
		public async Task<IActionResult> Get(int id)
		{
			try
			{
				var result = await _admissionsService.GetStudentAdmission(id);
				var mapper = _mapper.Map<IEnumerable<SelectStudentAdmissionsDto>>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// post api/<StudentAdmissionsController>
		[HttpPost("save")]
		public async Task<IActionResult> Post([FromBody] AddStudentAdmissionsDto studentAdmissions)
		{
			try
			{
				var mapper = _mapper.Map<StudentAdmissionsModel>(studentAdmissions);
				await _admissionsService.SaveStudentAdmission(mapper);
				return Ok("Student Admissions Added Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		[HttpPut("update/{id}")]
		public async Task<IActionResult> Update(int id, [FromBody] AddStudentAdmissionsDto studentAdmissions)
		{
			try
			{
				var mapper = _mapper.Map<StudentAdmissionsModel>(studentAdmissions);
				mapper.ChannelId = id;
				var res = await _admissionsService.SaveStudentAdmission(mapper);
				return Ok("Student Admissions Updated Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// DELETE api/<StudentAdmissionsController>/5
		[HttpDelete("delete/{id}")]
		public async Task<IActionResult> Delete([FromRoute] int id)
		{
			try
			{
				var res = await _admissionsService.DeleteStudentAdmission(id);
				return Ok(res);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

	}
}
