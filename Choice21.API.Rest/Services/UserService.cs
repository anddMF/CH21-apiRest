using Choice21.API.Rest.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Services
{
    public class UserService
    {
        private IConfiguration config;
        private BaseService baseSvc;

        public UserService(IConfiguration _config)
        {
            config = _config;
            baseSvc = new BaseService(config);
        }

        public IEnumerable<User> GetUser(int id, int id_company = 0)
        {
            //var param = PrepParamGet(id, id_company);
            //var result = baseSvc.ExecuteProcGet<User>("STP_CHO2021_USER_GET", param);
            string query = $"SELECT us.ID, us.ID_COMPANY, us.ID_USER_TYPE, us.NAME, us.EMAIL, us.PASSWORD, us.DT_BIRTH, us.DT_REGISTER, us.AVATAR FROM develop2020.cho2021_user us LEFT JOIN develop2020.cho2021_company co on us.ID_COMPANY = co.ID WHERE us.ID_COMPANY = {id_company};";
            var result = baseSvc.GetStuff<User>(query);

            return result;
        }

        public void PostUser(User model)
        {
            //var param = PrepParamPost(model);
            //var res = baseSvc.ExecuteProc("STP_CHO2021_USER_INSERT", param);

            string query = "";
            var param = PrepParamPost(model);

            if (model.ID > 0)
                query = $"UPDATE develop2020.cho2021_user SET ID_COMPANY = @Pid_company, ID_USER_TYPE = @Pid_user_type, NAME = @Pname, EMAIL = @Pemail, PASSWORD = @Ppassword, DT_BIRTH = @Pdt_birth, DT_REGISTER = @Pdt_register, AVATAR = @Pavatar WHERE ID = @Pid;";
            else
                query = $"INSERT INTO develop2020.cho2021_user (ID_COMPANY, ID_USER_TYPE, NAME, EMAIL, PASSWORD, DT_BIRTH, DT_REGISTER, AVATAR) VALUES (@Pid_company, @Pid_user_type, @Pname, @Pemail, @Ppassword, @Pdt_birth, @Pdt_register, @Pavatar);";

            var res = baseSvc.InsertStuff(query, param);
        }

        public Dictionary<string, object> PrepParamGet(int id, int id_company)
        {
            var param = new Dictionary<string, object>
            {
                { "Pid", id },
                { "Pid_company", id_company }
            };

            return param;
        }

        private Dictionary<string, object> PrepParamPost(User model)
        {
            var param = new Dictionary<string, object>
            {
                { "@Pid_company", model.ID_COMPANY },
                { "@Pid_user_type", model.ID_USER_TYPE},
                { "@Pname", model.NAME},
                { "@Pemail", model.EMAIL },
                { "@Ppassword", model.PASSWORD },
                { "@Pdt_birth", model.DT_BIRTH },
                { "@Pdt_register", model.ID == 0 ? DateTime.Now : model.DT_REGISTER },
                { "@Pavatar", null }
            };

            if (model.ID > 0)
                param.Add("@Pid", model.ID);

            return param;
        }
    }
}
