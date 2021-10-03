using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Models
{
    public class ImageData
    {
        [JsonProperty("id")]
        public int ID { get; set; }

        [JsonProperty("id_arc_profile")]
        public int ID_ARC_PROFILE { get; set; }

        [JsonProperty("id_room_type")]
        public int ID_ROOM_TYPE { get; set; }

        [JsonProperty("base_image")]
        public string BASE_IMAGE { get; set; }

        [JsonProperty("name")]
        public string NAME { get; set; }

        [JsonProperty("color_1")]
        public string COLOR_1 { get; set; }

        [JsonProperty("color_2")]
        public string COLOR_2 { get; set; }

        [JsonProperty("dt_register")]
        public DateTime DT_REGISTER { get; set; }

        [JsonProperty("id_company")]
        public int ID_COMPANY { get; set; }
        

        [JsonProperty("profile_name")]
        public string PROFILE_NAME { get; set; }

        [JsonProperty("room_name")]
        public string ROOM_NAME { get; set; }

    }
}
