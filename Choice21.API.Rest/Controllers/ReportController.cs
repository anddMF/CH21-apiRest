﻿using Choice21.API.Rest.Models;
using Choice21.API.Rest.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Controllers
{
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
        [Authorize]
        [Route("guard/Report")]
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

        [HttpGet]
        [Route("api/[controller]/customer")]
        public ActionResult<IEnumerable<Report>> GetCustomerReport(int id_company, int id_customer)
        {
            try
            {
                var svc = new ReportService(config);
                var result = svc.GetReport(id_company, id_customer);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        [Route("api/[controller]")]
        public IActionResult PostReport(Report model)
        {
            try
            {
                var svc = new ReportService(config);
                var response = svc.PostReport(model);
                
                return response ? Ok(response) : StatusCode(500);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut]
        [Route("api/[controller]")]
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
