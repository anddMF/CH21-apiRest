using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Models
{
    public class Customer
    {
        [JsonProperty("id")]
        public int ID { get; set; }

        [JsonProperty("id_user_admin")]
        public int ID_USER_ADMIN { get; set; }

        [JsonProperty("id_user_worker")]
        public int ID_USER_WORKER { get; set; }

        [JsonProperty("name")]
        public string NAME { get; set; }

        [JsonProperty("user_name")]
        public string USER_NAME { get; set; }

        [JsonProperty("email")]
        public string EMAIL { get; set; }

        [JsonProperty("user_email")]
        public string USER_EMAIL { get; set; }

        [JsonProperty("dt_birth")]
        public DateTime DT_BIRTH { get; set; }

        [JsonProperty("dt_register")]
        public DateTime DT_REGISTER { get; set; }

        [JsonProperty("children")]
        public int CHILDREN { get; set; }

        [JsonProperty("kid")]
        public bool KID { get; set; }

        [JsonProperty("deal")]
        public bool DEAL { get; set; }
    }
}
