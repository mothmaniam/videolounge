using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;
using System.IO;

namespace videolounge
{
    public partial class sortByService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportDocument rpt2 = new ReportDocument();
                rpt2 = (ReportDocument)(Session["theReportDocument"]);
                string theReportPath = Convert.ToString(Session["theReportPath"]);
                DataSet dsTheDataSet = (DataSet)(Session["dataset"]);

                rpt2.Load(theReportPath);
                rpt2.SetDataSource(dsTheDataSet);
                CrystalReportViewer1.ReportSource = rpt2;

                //for pdf

                BinaryReader stream = new BinaryReader(rpt2.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat));
                Response.ClearContent();
                Response.ClearHeaders();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=" + "ServicesByCompany-" + DateTime.Now.ToShortDateString());
                Response.AddHeader("content-length", stream.BaseStream.Length.ToString());
                Response.BinaryWrite(stream.ReadBytes(Convert.ToInt32(stream.BaseStream.Length)));
                Response.Flush();
                Response.Close();
            }
        }
    }
}