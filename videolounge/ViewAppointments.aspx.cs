using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;
using System.Data.SqlClient;
using System.Web.Configuration;
using CrystalDecisions.CrystalReports.Engine;

namespace videolounge
{
    public partial class ViewAppointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            string appointment_date = null, RmDesc = null, RmLocation = null, RmEmployee = null, RmTime = null, linkStr = null,
                tooltip = null, RmCountry=null, RmCompany = null;

            appointment_date = e.Day.Date.ToShortDateString();
            e.Cell.Enabled = false;
            e.Day.IsSelectable = false;

            e.Cell.HorizontalAlign = HorizontalAlign.Left;
            e.Cell.VerticalAlign = VerticalAlign.Top;

            using (SqlConnection SQLConn = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                using (SqlCommand SQLcmd = new SqlCommand(SqlDataSource1.SelectCommand, SQLConn))
                {
                    SQLcmd.Connection = SQLConn;
                    SQLcmd.CommandType = CommandType.Text;

                    SQLcmd.Parameters.Clear();
                    SQLcmd.Parameters.AddWithValue("@DateIn", appointment_date);
                    SQLConn.Open();
                    linkStr = "";

                    using (SqlDataReader reader = SQLcmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                RmDesc = reader["Appointment_Description"].ToString();
                                RmLocation = reader["Appointment_Location"].ToString();
                                RmEmployee = reader["Employee"].ToString();
                                RmTime = reader["Appointment_Time"].ToString();
                                RmCountry = reader["Appointment_Country"].ToString();
                                RmCompany = reader["Company_Name"].ToString();
                                linkStr = "<span style=\"font-size:7pt; font-Weight:bold; color:red\"><br />" + RmEmployee + "(travels to " + RmLocation + ")</a></span>";
                                e.Cell.Controls.Add(new LiteralControl(linkStr));
                                tooltip = "Employee: " + RmEmployee + System.Environment.NewLine + "Time: " + RmTime + System.Environment.NewLine + "Location: " + RmLocation + System.Environment.NewLine + "Country: " + RmCountry + System.Environment.NewLine + "Description: " + RmDesc + System.Environment.NewLine + "Company: " + RmCompany;
                                e.Cell.ToolTip = tooltip;
                            }
                        }
                        //reader.HasRows
                    }
                }
            }
        }

        protected void btnPrintAppointmentReport_Click(object sender, EventArgs e)
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", "%");

            cmd.CommandText = "sp_ViewAppointments";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_ViewAppointments");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewAppointments.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewAppointmentsReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewAppointments.aspx';</script>");
        }
    }
}