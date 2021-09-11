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
    public class UserController : Controller
    {
        private IConfiguration config;
        private UserService svc;
        public UserController(IConfiguration _config)
        {
            config = _config;
            svc = new UserService(config);
        }

        [HttpGet]
        public ActionResult<IEnumerable<User>> GetUser(int id, int id_company)
        {
            try
            {
                var svc = new UserService(config);
                var result = svc.GetUser(id, id_company);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        public IActionResult PostUser(User model)
        {
            try
            {
                var svc = new UserService(config);
                bool res = svc.PostUser(model);

                return Ok(res);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut]
        public IActionResult PutUser(User model)
        {
            try
            {
                var svc = new UserService(config);
                svc.PostUser(model);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
