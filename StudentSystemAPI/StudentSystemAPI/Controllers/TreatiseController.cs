using StudentSystemAPI.Dto.OperationEntity.TreatiseOperation;

namespace StudentSystemAPI.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class TreatiseController : ControllerBase
	{
		private readonly ITreatiseService _treatiseService;
		private readonly IMapper _mapper;

		public TreatiseController(ITreatiseService treatiseService, IMapper mapper)
		{
			_treatiseService = treatiseService;
			_mapper = mapper;
		}


		// GET: api/<TreatiseController>
		[HttpGet]
		public async Task<IActionResult> Get()
		{
			try
			{
				var result = await _treatiseService.GetTreatises();
				var mapper = _mapper.Map<IEnumerable<TreatiseModel>>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// GET api/<TreatiseController>/5
		[HttpGet("{id}")]
		public async Task<IActionResult> Get(int id)
		{
			try
			{
				var result = await _treatiseService.GetTreatise(id);
				var mapper = _mapper.Map<TreatiseModel>(result);
				return Ok(mapper);
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// POST api/<TreatiseController>
		[HttpPost]
		public async Task<IActionResult> Post([FromBody] AddTreatiseDto treatise)
		{
			try
			{
				var mapper = _mapper.Map<TreatiseModel>(treatise);
				await _treatiseService.SaveTreatise(mapper);
				return Ok("Treatise Added Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}
		// DELETE api/<TreatiseController>/5

		[HttpDelete("{id}")]
		public async Task<IActionResult> Delete(int id)
		{
			try
			{
				await _treatiseService.DeleteTreatise(id);
				return Ok("Treatise Deleted Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

		// PUT api/<TreatiseController>/5
		[HttpPut("{id}")]
		public async Task<IActionResult> Put([FromRoute] int id, [FromBody] UpdateTreatiseDto treatise)
		{
			try
			{
				var mapper = _mapper.Map<TreatiseModel>(treatise);
				mapper.TreatiseId = id;
				await _treatiseService.SaveTreatise(mapper);
				return Ok("Treatise Updated Successfully");
			}
			catch (Exception e)
			{
				Console.WriteLine(e);
				throw;
			}
		}

	}



}
