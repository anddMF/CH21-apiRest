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
    public class ImageController : Controller
    {

        private IConfiguration config;
        private ImageService svc;
        public ImageController(IConfiguration _config)
        {
            config = _config;
            svc = new ImageService(config);
        }

        [HttpGet]
        public ActionResult<IEnumerable<ImageData>> GetImages()
        {
            try
            {
                var result = svc.GetImages();

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        // Método vai vazar quando eu colocar GraphQL
        [HttpGet]
        [Route("id")]
        public ActionResult<IEnumerable<ImageData>> GetImagesById(string[] list)
        {
            try
            {
                var result = svc.GetImagesById(list);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpGet]
        [Route("arcprofile")]
        public ActionResult<IEnumerable<ArcProfile>> GetArcProfiles()
        {
            try
            {
                var result = svc.GetArcProfiles();

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost]
        public IActionResult PostCustomer(ImageData model)
        {
            try
            {
                svc.PostImage(model);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPut]
        public IActionResult PutCustomer(ImageData model)
        {
            try
            {
                svc.PostImage(model);

                return Ok();
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
