namespace StudentSystemAPI.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class StudentServiyController : ControllerBase
	{
		private readonly IStudentSurveyService _surveyService;
		private readonly IMapper _mapper;

		public StudentServiyController(IStudentSurveyService surveyService, IMapper mapper)
		{
			_surveyService = surveyService;
			_mapper = mapper;
		}

		// GET: api/<StudentServiyController>
		[HttpGet]
		public async Task<IActionResult> Get()
		{
			try
			{
				var result = await _surveyService.GetStudentSurveys();
				var mapper = _mapper.Map<IEnumerable<StudentSurveyModels>>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// GET api/<StudentServiyController>/5
		[HttpGet("{id}")]
		public async Task<IActionResult> Get(int id)
		{
			try
			{
				var result = await _surveyService.GetStudentSurvey(id);
				var mapper = _mapper.Map<StudentSurveyModels>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}
		// POST api/<StudentServiyController>
		[HttpPost]
		public async Task<IActionResult> Post([FromBody] AddStudentSurveyDto studentSurvey)
		{
			try
			{
				var mapper = _mapper.Map<StudentSurveyModels>(studentSurvey);
				await _surveyService.SaveStudentSurvey(mapper);
				return Ok("Student Survey Added Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// PUT api/<StudentServiyController>/5
		[HttpPut("{id}")]
		public async Task<IActionResult> Put([FromRoute] int id, [FromBody] UpdateStudentSurveyDto studentSurvey)
		{
			try
			{
				var mapper = _mapper.Map<StudentSurveyModels>(studentSurvey);
				mapper.SurveyId = id;
				var res = await _surveyService.SaveStudentSurvey(mapper);
				return Ok(res);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}
		// DELETE api/<StudentServiyController>/5
		[HttpDelete("{id}")]
		public async Task<IActionResult> Delete(int id)
		{
			try
			{
				var res = await _surveyService.DeleteStudentSurvey(id);
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
