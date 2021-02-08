using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Models
{
    public class Report
    {
        [JsonProperty("id")]
        public int ID { get; set; }

        [JsonProperty("id_customer")]
        public int ID_CUSTOMER { get; set; }

        [JsonProperty("id_user_admin")]
        public int ID_USER_ADMIN { get; set; }

        [JsonProperty("id_user_worker")]
        public int ID_USER_WORKER { get; set; }

        [JsonProperty("id_company")]
        public int ID_COMPANY { get; set; }

        [JsonProperty("dt_register")]
        public DateTime DT_REGISTER { get; set; }

        [JsonProperty("deal")]
        public bool DEAL { get; set; }

        [JsonProperty("r_read")]
        public bool R_READ { get; set; }

        [JsonProperty("title")]
        public string TITLE { get; set; }

        [JsonProperty("description")]
        public string DESCRIPTION { get; set; }

        [JsonProperty("r_key")]
        public string R_KEY { get; set; }

        [JsonProperty("r1_pic1")]
        public int R1_PIC1 { get; set; }

        [JsonProperty("r1_pic2")]
        public int R1_PIC2 { get; set; }

        [JsonProperty("r2_pic1")]
        public int R2_PIC1 { get; set; }

        [JsonProperty("r2_pic2")]
        public int R2_PIC2 { get; set; }

        [JsonProperty("r3_pic1")]
        public int R3_PIC1 { get; set; }

        [JsonProperty("r3_pic2")]
        public int R3_PIC2 { get; set; }

        [JsonProperty("r4_pic1")]
        public int R4_PIC1 { get; set; }

        [JsonProperty("r4_pic2")]
        public int R4_PIC2 { get; set; }

        [JsonProperty("r5_pic1")]
        public int R5_PIC1 { get; set; }

        [JsonProperty("r5_pic2")]
        public int R5_PIC2 { get; set; }

        [JsonProperty("r6_pic1")]
        public int R6_PIC1 { get; set; }

        [JsonProperty("r6_pic2")]
        public int R6_PIC2 { get; set; }

        [JsonProperty("r7_pic1")]
        public int R7_PIC1 { get; set; }

        [JsonProperty("r7_pic2")]
        public int R7_PIC2 { get; set; }

        [JsonProperty("r8_pic1")]
        public int R8_PIC1 { get; set; }

        [JsonProperty("r8_pic2")]
        public int R8_PIC2 { get; set; }
    }
}
