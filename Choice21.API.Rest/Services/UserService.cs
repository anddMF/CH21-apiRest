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
            var param = PrepParamGet(id, id_company);
            var result = baseSvc.ExecuteProcGet<User>("STP_CHO2021_USER_GET", param);

            return result;
        }

        public IEnumerable<User> PostUser(User model)
        {
            var param = PrepParamPost(model);

            var res = baseSvc.ExecuteProc("STP_CHO2021_USER_INSERT", param);

            if (model.ID > 0)
                return GetUser(model.ID, model.ID_COMPANY);
            else
                return GetUser(model.ID);
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
                { "Pid", model.ID },
                { "Pid_company", model.ID_COMPANY },
                { "Pid_user_type", model.ID_USER_TYPE},
                { "Pname", model.NAME},
                { "Pemail", model.EMAIL },
                { "Ppassword", model.PASSWORD },
                { "Pdt_birth", model.DT_BIRTH },
                { "Pdt_register", model.ID == 0 ? DateTime.Now : model.DT_REGISTER },
                { "Pavatar", null }
            };

            return param;
        }
    }
}
