using Choice21.API.Rest.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Choice21.API.Rest.Services
{
    public class ReportService
    {
        private IConfiguration config;
        private BaseService baseSvc;

        public ReportService(IConfiguration _config)
        {
            config = _config;
            baseSvc = new BaseService(config);
        }

        public IEnumerable<Report> GetReports(int id_company, int id_report = 0)
        {
            var param = PrepParamGet(id_company, id_report);
            var result = baseSvc.ExecuteProcGet<Report>("STP_CHO2021_REPORT_GET", param);

            return result;
        }

        public void PostReport(Report model)
        {
            var param = PrepParamPost(model);

            var res = baseSvc.ExecuteProc("STP_CHO2021_REPORT_GET", param);

        }

        public Dictionary<string, object> PrepParamGet(int id_company, int id_report = 0)
        {
            var param = new Dictionary<string, object>
            {
                { "Pid_company", id_company },
                { "Pid_report", id_report }
            };

            return param;
        }

        private Dictionary<string, object> PrepParamPost(Report model)
        {
            var param = new Dictionary<string, object>
            {
                { "Pid", model.ID },
                { "Pid_customer", model.ID_CUSTOMER },
                { "Pid_admin", model.ID_USER_ADMIN},
                { "Pid_worker", model.ID_USER_WORKER},
                { "Pid_company", model.ID_COMPANY},
                { "Pdt_register", model.ID == 0 ? DateTime.Now : model.DT_REGISTER },
                { "Pdeal", model.DEAL },
                { "Pread", model.R_READ },
                { "Ptitle", model.TITLE },
                { "Pdescription", model.DESCRIPTION },
                { "Pkey", model.R_KEY },
                { "Pr1_pic1", model.R1_PIC1 },
                { "Pr1_pic2", model.R1_PIC2},
                { "Pr2_pic1", model.R2_PIC1 },
                { "Pr2_pic2", model.R2_PIC2},
                { "Pr3_pic1", model.R3_PIC1 },
                { "Pr3_pic2", model.R3_PIC2},
                { "Pr4_pic1", model.R4_PIC1 },
                { "Pr4_pic2", model.R4_PIC2},
                { "Pr5_pic1", model.R5_PIC1 },
                { "Pr5_pic2", model.R5_PIC2},
                { "Pr6_pic1", model.R6_PIC1 },
                { "Pr6_pic2", model.R6_PIC2},
                { "Pr7_pic1", model.R7_PIC1 },
                { "Pr7_pic2", model.R7_PIC2},
                { "Pr8_pic1", model.R8_PIC1 },
                { "Pr8_pic2", model.R8_PIC2}
            };

            return param;
        }
    }
}
