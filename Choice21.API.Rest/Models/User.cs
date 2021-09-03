using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Models
{
    public class User
    {
        [JsonProperty("id")]
        public int ID { get; set; }

        [JsonProperty("idUserType")]
        public int ID_USER_TYPE { get; set; }

        [JsonProperty("idCompany")]
        public int ID_COMPANY { get; set; }

        [JsonProperty("name")]
        public string NAME { get; set; }

        [JsonProperty("email")]
        public string EMAIL { get; set; }

        [JsonProperty("password")]
        public string PASSWORD { get; set; }

        [JsonProperty("dtRegister")]
        public DateTime DT_REGISTER { get; set; }

        [JsonProperty("dtBirth")]
        public DateTime DT_BIRTH { get; set; }

        [JsonProperty("avatar")]
        public byte[] AVATAR { get; set; }
        

        [JsonProperty("companyName")]
        public string COMPANY_NAME { get; set; }

        [JsonProperty("companyCnpj")]
        public string COMPANY_CNPJ { get; set; }
    }
}
