using Choice21.API.Rest.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Services
{
    public class ImageService
    {
        private IConfiguration config;
        private BaseService baseSvc;

        public ImageService(IConfiguration _config)
        {
            config = _config;
            baseSvc = new BaseService(config);
        }

        public IEnumerable<ImageData> GetImages()
        {
            var result = baseSvc.ExecuteProcGet<ImageData>("STP_CHO2021_IMAGE_GET", null);

            return result;
        }
        
        public IEnumerable<ArcProfile> GetArcProfiles()
        {
            var result = baseSvc.ExecuteProcGet<ArcProfile>("STP_CHO2021_ARCPROFILE_GET", null);

            return result;
        }

        public void PostImage(ImageData model)
        {
            var param = PrepParamPost(model);

            var res = baseSvc.ExecuteProc("STP_CHO2021_IMAGE_INSERT", param);
        }

        private Dictionary<string, object> PrepParamPost(ImageData model)
        {
            var param = new Dictionary<string, object>
            {
                { "Pid", model.ID },
                { "Pid_arcprofile", model.ID_ARC_PROFILE },
                { "Pid_roomtype", model.ID_ROOM_TYPE},
                { "Pbase_image", model.BASE_IMAGE},
                { "Pname", model.NAME},
                { "Pcolor1", model.COLOR_1 },
                { "Pcolor2", model.COLOR_2 },
                { "Pdt_register", model.ID == 0 ? DateTime.Now : model.DT_REGISTER }
            };

            return param;
        }
    }
}
