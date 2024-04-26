using AutoMapper;

namespace StudentSystemAPI.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class JobStudentController : ControllerBase
	{
		private readonly IJobStudentService _jobStudentService;
		private readonly IMapper _mapper;

		public JobStudentController(IJobStudentService jobStudentService, IMapper mapper)
		{
			_jobStudentService = jobStudentService;
			_mapper = mapper;
		}

		// GET: api/<JobStudentController>
		[HttpGet]
		public async Task<IActionResult> Get()
		{
			try
			{
				var result = await _jobStudentService.GetJobStudent();
				var mapper = _mapper.Map<IEnumerable<SelectJobStudentDto>>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// GET api/<JobStudentController>/5
		[HttpGet("{id}")]
		public async Task<IActionResult> Get(int id)
		{
			try
			{
				var result = await _jobStudentService.GetJobStudentById(id);
				var mapper = _mapper.Map<SelectJobStudentDto>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// POST api/<JobStudentController>
		[HttpPost]
		public async Task<IActionResult> Post([FromBody] AddJobStudentDto jobStudent)
		{
			try
			{
				var mapper = _mapper.Map<JobStudentModel>(jobStudent);
				await _jobStudentService.SaveJobStudent(mapper);
				return Ok("Job Student Added Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// PUT api/<JobStudentController>/5
		[HttpPut("{id}")]
		public async Task<IActionResult> Put([FromRoute] int id, [FromBody] UpdateJobStudentDto jobStudent)
		{
			try
			{
				var mapper = _mapper.Map<JobStudentModel>(jobStudent);
				mapper.JobId = id;

				var res = await _jobStudentService.SaveJobStudent(mapper);
				return Ok(res);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// DELETE api/<JobStudentController>/5
		[HttpDelete("{id}")]
		public async Task<IActionResult> Delete(int id)
		{
			try
			{
				var res = await _jobStudentService.DeleteJobStudent(id);
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
