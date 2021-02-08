using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Models
{
    public class ArcProfile
    {
        [JsonProperty("id")]
        public int ID { get; set; }

        [JsonProperty("name")]
        public string NAME { get; set; }

        [JsonProperty("description")]
        public string DESCRIPTION { get; set; }
    }
}
