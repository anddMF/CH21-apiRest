using Choice21.API.Rest.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Services
{
    public class CustomerService
    {
        private IConfiguration config;
        private BaseService baseSvc;

        public CustomerService(IConfiguration _config)
        {
            config = _config;
            baseSvc = new BaseService(config);
        }

        public IEnumerable<Company> GetCompanies()
        {
            var result = baseSvc.ExecuteProcGet<Company>("STP_CHO2021_COMPANY_GET", null);

            return result;
        }
        
        public IEnumerable<RoomType> GetRoom()
        {
            var result = baseSvc.ExecuteProcGet<RoomType>("STP_CHO2021_ROOMTYPE_GET", null);

            return result;
        }

        public IEnumerable<Customer> GetCustomers(int id_admin, int id_customer = 0)
        {
            var param = PrepParamGet(id_admin, id_customer);
            var result = baseSvc.ExecuteProcGet<Customer>("STP_CHO2021_CUSTOMER_GET", param);

            return result;
        }

        public IEnumerable<Customer> PostCustomer(Customer model)
        {
            var param = PrepParamPost(model);

            var res = baseSvc.ExecuteProc("STP_CHO2021_CUSTOMER_INSERT", param);

            if (model.ID > 0)
                return GetCustomers(model.ID_USER_ADMIN, model.ID);
            else
                return GetCustomers(model.ID_USER_ADMIN);
        }

        public Dictionary<string, object> PrepParamGet(int id_admin, int id_customer = 0)
        {
            var param = new Dictionary<string, object>
            {
                { "Pid_admin", id_admin },
                { "Pid_customer", id_customer }
            };

            return param;
        }

        private Dictionary<string, object> PrepParamPost(Customer model)
        {
            var param = new Dictionary<string, object>
            {
                { "Pid", model.ID },
                { "Pid_admin", model.ID_USER_ADMIN },
                { "Pname", model.NAME},
                { "Pemail", model.EMAIL },
                { "Pdt_birth", model.DT_BIRTH },
                { "Pdt_register", model.ID == 0 ? DateTime.Now : model.DT_REGISTER },
                { "Pdeal", model.DEAL }
            };

            return param;
        }
    }
}
