// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace StudentSystemAPI.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class StudentController : ControllerBase
	{
		private readonly IStudentService _studentService;
		private readonly IMapper _mapper;

		public StudentController(IStudentService studentService, IMapper mapper)
		{
			_studentService = studentService;
			_mapper = mapper;
		}

		// GET: api/<StudentController>
		[HttpGet]
		public async Task<IActionResult> Get()
		{
			try
			{
				var result = await _studentService.GetAll();
				var mapper = _mapper.Map<IEnumerable<StudentModel>>(result);
				return Ok(mapper);

			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// GET api/<StudentController>/5
		[HttpGet("{id}")]
		public async Task<IActionResult> Get(int id)
		{
			try
			{
				var result = await _studentService.GetById(id);
				var mapper = _mapper.Map<StudentModel>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// POST api/<StudentController>
		[HttpPost]
		public async Task<IActionResult> Post([FromBody] AddStudentDto student)
		{
			try
			{
				var mapper = _mapper.Map<StudentModel>(student);
				await _studentService.Save(mapper);
				return Ok("Student Added Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}
		// PUT api/<StudentController>/5
		[HttpPut("{id}")]
		public async Task<IActionResult> Put([FromRoute] int id, [FromBody] UpdateStudentDto student)
		{
			try
			{
				var mapper = _mapper.Map<StudentModel>(student);
				mapper.StudentId = id;
				await _studentService.Save(mapper);
				return Ok("Student Updated Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}
		// DELETE api/<StudentController>/5
		[HttpDelete("{id}")]
		public async Task<IActionResult> Delete(int id)
		{
			try
			{
				var res = await _studentService.Delete(id);
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
