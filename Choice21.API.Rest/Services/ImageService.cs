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
            //var result = baseSvc.ExecuteProcGet<ImageData>("STP_CHO2021_IMAGE_GET", null);
            var result = baseSvc.GetStuff<ImageData>("select im.ID, im.ID_COMPANY, im.ID_ARC_PROFILE, im.ID_ROOM_TYPE, im.BASE_IMAGE, im.NAME, im.COLOR_1, im.COLOR_2, im.DT_REGISTER, pr.NAME AS 'PROFILE_NAME', ro.NAME AS 'ROOM_NAME' from cho2021_image im LEFT JOIN cho2021_arc_profile pr on im.ID_ARC_PROFILE = pr.ID LEFT JOIN cho2021_room_type ro on im.ID_ROOM_TYPE = ro.ID");

            return result;
        }

        public IEnumerable<ImageData> GetImagesById(string[] listIds){
            string inQuery = "";

            for (int i = 0; i < listIds.Length; i++)
            {
                if(i == 0)
                    inQuery = listIds[i];
                else
                    inQuery += ", "+ listIds[i];
            }

            var result = baseSvc.GetStuff<ImageData>("select im.ID, im.ID_COMPANY, im.ID_ARC_PROFILE, im.ID_ROOM_TYPE, im.BASE_IMAGE, im.NAME, im.COLOR_1, im.COLOR_2, im.DT_REGISTER, pr.NAME AS 'PROFILE_NAME', ro.NAME AS 'ROOM_NAME' from cho2021_image im LEFT JOIN cho2021_arc_profile pr on im.ID_ARC_PROFILE = pr.ID LEFT JOIN cho2021_room_type ro on im.ID_ROOM_TYPE = ro.ID where im.ID IN ("+ inQuery +")");

            return result;
        }   

        public IEnumerable<ArcProfile> GetArcProfiles()
        {
            //var result = baseSvc.ExecuteProcGet<ArcProfile>("STP_CHO2021_ARCPROFILE_GET", null);
            var result = baseSvc.GetStuff<ArcProfile>("select * from cho2021_arc_profile");

            return result;
        }

        public void PostImage(ImageData model)
        {
            var param = PrepParamPost(model);
            //var res = baseSvc.ExecuteProc("STP_CHO2021_IMAGE_INSERT", param);

            var query = $"INSERT INTO develop2020.cho2021_image (ID_ARC_PROFILE, ID_ROOM_TYPE, BASE_IMAGE, NAME, COLOR_1, COLOR_2, DT_REGISTER) VALUES (@ArcProfile, @RoomType, @BaseImg, @Name, @Color1, @Color2, @DtRegister);";

            var res = baseSvc.InsertStuff(query, param);
        }

        private Dictionary<string, object> PrepParamPost(ImageData model)
        {
            var param = new Dictionary<string, object>
            {
                { "@ArcProfile", model.ID_ARC_PROFILE },
                { "@RoomType", model.ID_ROOM_TYPE},
                { "@BaseImg", model.BASE_IMAGE},
                { "@Name", model.NAME},
                { "@Color1", model.COLOR_1 },
                { "@Color2", model.COLOR_2 },
                { "@DtRegister", model.ID == 0 ? DateTime.Now : model.DT_REGISTER }
            };

            return param;
        }
    }
}
