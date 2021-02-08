using Choice21.API.Rest.Models;
using Choice21.API.Rest.Services;
using Microsoft.AspNetCore.Http;
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
    public class CustomerController : Controller
    {
        private IConfiguration config;
        public CustomerController(IConfiguration _config)
        {
            config = _config;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Customer>> GetCustomers(int id_admin, int id_customer)
        {
            try
            {
                var svc = new CustomerService(config);
                var result = svc.GetCustomers(id_admin, id_customer);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("room")]
        public ActionResult<IEnumerable<RoomType>> GetRoom()
        {
            try
            {
                var svc = new CustomerService(config);
                var result = svc.GetRoom();

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
        
        [HttpGet]
        [Route("company")]
        public ActionResult<IEnumerable<Company>> GetCompany()
        {
            try
            {
                var svc = new CustomerService(config);
                var result = svc.GetCompanies();

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        public IActionResult PostCustomer(Customer model)
        {
            try
            {
                var svc = new CustomerService(config);
                var result = svc.PostCustomer(model);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut]
        public IActionResult PutCustomer(Customer model)
        {
            try
            {
                var svc = new CustomerService(config);
                var result = svc.PostCustomer(model);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

    }
}
