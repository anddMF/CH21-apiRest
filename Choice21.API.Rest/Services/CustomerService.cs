using Choice21.API.Rest.Models;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            //var result = baseSvc.ExecuteProcGet<Company>("STP_CHO2021_COMPANY_GET", null);
            var result = baseSvc.GetStuff<Company>("select * from cho2021_company");

            return result;
        }

        public IEnumerable<RoomType> GetRoom()
        {
            //var result = baseSvc.ExecuteProcGet<RoomType>("STP_CHO2021_ROOMTYPE_GET", null);
            var result = baseSvc.GetStuff<RoomType>("select * from cho2021_room_type");

            return result;
        }

        public IEnumerable<Customer> GetCustomers(int id_admin, int id_customer = 0)
        {
            //var param = PrepParamGet(id_admin, id_customer);
            //var result = baseSvc.ExecuteProcGet<Customer>("STP_CHO2021_CUSTOMER_GET", param);

            string query = $"SELECT cu.ID, cu.ID_USER_ADMIN, us.NAME as 'USER_NAME', us.EMAIL AS 'USER_EMAIL', cu.ID_USER_WORKER, cu.NAME, cu.EMAIL, cu.DT_BIRTH, cu.DT_REGISTER, cu.CHILDREN, cu.KID, cu.DEAL FROM cho2021_customer cu LEFT JOIN cho2021_user us on cu.ID_USER_ADMIN = us.ID WHERE ID_USER_ADMIN = {id_admin};";
            var result = baseSvc.GetStuff<Customer>(query);

            return result;
        }

        public IEnumerable<Customer> PostCustomer(Customer model)
        {
            //var param = PrepParamPost(model);
            //var res = baseSvc.ExecuteProc("STP_CHO2021_CUSTOMER_INSERT", param);
            //if (model.ID > 0)
            //    return GetCustomers(model.ID_USER_ADMIN, model.ID);
            //else
            //    return GetCustomers(model.ID_USER_ADMIN);

            string query = "";
            var param = PrepParamPost(model);

            if (model.ID > 0)
                query = $"UPDATE develop2020.cho2021_customer SET ID_USER_ADMIN = @IdAdmin, NAME = @Name, EMAIL = @Email, DT_BIRTH = @DtBirth, DT_REGISTER = @DtRegister, DEAL = @Deal WHERE ID = @Id;";
            else
                query = $"INSERT INTO develop2020.cho2021_customer (ID_USER_ADMIN, NAME, EMAIL, DT_BIRTH, DT_REGISTER, DEAL) VALUES (@IdAdmin, @Name, @Email, @DtBirth, @DtRegister, @Deal);";

            var res = baseSvc.InsertStuff(query, param);
            return GetCustomers(model.ID_USER_ADMIN, model.ID);
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
                { "@IdAdmin", model.ID_USER_ADMIN },
                { "@Name", model.NAME},
                { "@Email", model.EMAIL },
                { "@DtBirth", model.DT_BIRTH },
                { "@DtRegister", model.ID == 0 ? DateTime.Now : model.DT_REGISTER },
                { "@Deal", model.DEAL }
            };

            if (model.ID > 0)
                param.Add("@Id", model.ID);

            return param;
        }
    }
}
