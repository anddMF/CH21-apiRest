using Choice21.API.Rest.Models;
using Choice21.API.Rest.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportController : Controller
    {
        private IConfiguration config;
        private ReportService svc;
        public ReportController(IConfiguration _config)
        {
            config = _config;
            svc = new ReportService(config);
        }

        [HttpGet]
        public ActionResult<IEnumerable<Report>> GetReports(int id_company, int id_report = 0)
        {
            try
            {
                var svc = new ReportService(config);
                var result = svc.GetReports(id_company, id_report);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        public IActionResult PostReport(Report model)
        {
            try
            {
                var svc = new ReportService(config);
                svc.PostReport(model);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut]
        public IActionResult PutReport(Report model)
        {
            try
            {
                svc.PostReport(model);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
