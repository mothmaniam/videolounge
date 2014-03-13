using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using CrystalDecisions.CrystalReports.Engine;

namespace videolounge
{
    public partial class Reports : System.Web.UI.Page
    {
        int regionID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                regionID = 0;
                ddlRegions.Items.Add("--Please Select--");
                loadRegions();
                ddlCountry.Items.Add("--Please Select--");
                loadCountries();
                ddlIndustry.Items.Add("--Please Select--");
                loadIndustries();
                ddlServices.Items.Add("--Please Select--");
                loadWorkTypes();
                ddlCompanies.Items.Add("--Please Select--");
                loadCompanies();
                btnGenerateReport.Enabled = false; btnGenerateReport.CssClass = "silverButtonDisabled";
            }
        }

        private void loadRegions()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;
            int count = 0;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT Region_Name From Regions ORDER BY Region_Name ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string regions = datatb.Rows[i]["Region_Name"].ToString();
                        ddlRegions.Items.Add(regions);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadCountries()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;
            int count = 0;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT Country_Name FROM Countries ORDER BY Country_Name ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string countryName = datatb.Rows[i]["Country_Name"].ToString();
                        ddlCountry.Items.Add(countryName);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadIndustries()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;
            int count = 0;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT Job_Industry_Description FROM Job_Industry ORDER BY Job_Industry_Description ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string industry = datatb.Rows[i]["Job_Industry_Description"].ToString();
                        ddlIndustry.Items.Add(industry);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadWorkTypes()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;
            int count = 0;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT Work_Type_Description FROM Work_Types ORDER BY Work_Type_Description ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string workType = datatb.Rows[i]["Work_Type_Description"].ToString();
                        ddlServices.Items.Add(workType);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadCompanies()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;
            int count = 0;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT Company_Name FROM Contacts ORDER BY Company_Name ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultCompanies = datatb.Rows[i]["Company_Name"].ToString();
                        ddlCompanies.Items.Add(resultCompanies);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void getRegionID(string region)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;
            int count = 0;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT Region_ID From Regions WHERE Region_Name = '" + region + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        regionID = Convert.ToInt32(datatb.Rows[i]["Region_ID"].ToString());
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        protected void ddlRegions_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCountry.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlServices.SelectedIndex = 0; ddlCompanies.SelectedIndex = 0;
            radioAdAgency.Checked = false; radioCorporate.Checked = false;

            if (ddlRegions.SelectedValue.ToString().Equals("--Please Select--") && ddlCountry.SelectedValue.ToString().Equals("--Please Select--") && radioAdAgency.Checked == false && radioCorporate.Checked == false && ddlIndustry.SelectedValue.ToString().Equals("--Please Select--") && ddlServices.SelectedValue.ToString().Equals("--Please Select--") && ddlCompanies.SelectedValue.ToString().Equals("--Please Select--"))
            {
                btnGenerateReport.Enabled = false; btnGenerateReport.CssClass = "silverButtonDisabled";
            }
            else
            {
                btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRegions.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlServices.SelectedIndex = 0; ddlCompanies.SelectedIndex = 0;
            radioAdAgency.Checked = false; radioCorporate.Checked = false; btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";

            if (ddlRegions.SelectedValue.ToString().Equals("--Please Select--") && ddlCountry.SelectedValue.ToString().Equals("--Please Select--") && radioAdAgency.Checked == false && radioCorporate.Checked == false && ddlIndustry.SelectedValue.ToString().Equals("--Please Select--") && ddlServices.SelectedValue.ToString().Equals("--Please Select--") && ddlCompanies.SelectedValue.ToString().Equals("--Please Select--"))
            {
                btnGenerateReport.Enabled = false; btnGenerateReport.CssClass = "silverButtonDisabled";
            }
            else
            {
                btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";
            }
        }

        protected void ddlIndustry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRegions.SelectedIndex = 0; ddlCountry.SelectedIndex = 0; ddlServices.SelectedIndex = 0; ddlCompanies.SelectedIndex = 0;
            radioAdAgency.Checked = false; radioCorporate.Checked = false; btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";

            if (ddlRegions.SelectedValue.ToString().Equals("--Please Select--") && ddlCountry.SelectedValue.ToString().Equals("--Please Select--") && radioAdAgency.Checked == false && radioCorporate.Checked == false && ddlIndustry.SelectedValue.ToString().Equals("--Please Select--") && ddlServices.SelectedValue.ToString().Equals("--Please Select--") && ddlCompanies.SelectedValue.ToString().Equals("--Please Select--"))
            {
                btnGenerateReport.Enabled = false; btnGenerateReport.CssClass = "silverButtonDisabled";
            }
            else
            {
                btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";
            }
        }

        protected void ddlServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRegions.SelectedIndex = 0; ddlCountry.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlCompanies.SelectedIndex = 0;
            radioAdAgency.Checked = false; radioCorporate.Checked = false; btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";

            if (ddlRegions.SelectedValue.ToString().Equals("--Please Select--") && ddlCountry.SelectedValue.ToString().Equals("--Please Select--") && radioAdAgency.Checked == false && radioCorporate.Checked == false && ddlIndustry.SelectedValue.ToString().Equals("--Please Select--") && ddlServices.SelectedValue.ToString().Equals("--Please Select--") && ddlCompanies.SelectedValue.ToString().Equals("--Please Select--"))
            {
                btnGenerateReport.Enabled = false; btnGenerateReport.CssClass = "silverButtonDisabled";
            }
            else
            {
                btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";
            }
        }

        protected void ddlCompanies_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRegions.SelectedIndex = 0; ddlCountry.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlServices.SelectedIndex = 0;
            radioAdAgency.Checked = false; radioCorporate.Checked = false; btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";

            if (ddlRegions.SelectedValue.ToString().Equals("--Please Select--") && ddlCountry.SelectedValue.ToString().Equals("--Please Select--") && radioAdAgency.Checked == false && radioCorporate.Checked == false && ddlIndustry.SelectedValue.ToString().Equals("--Please Select--") && ddlServices.SelectedValue.ToString().Equals("--Please Select--") && ddlCompanies.SelectedValue.ToString().Equals("--Please Select--"))
            {
                btnGenerateReport.Enabled = false; btnGenerateReport.CssClass = "silverButtonDisabled";
            }
            else
            {
                btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";
            }
        }

        protected void radioAdAgency_CheckedChanged(object sender, EventArgs e)
        {
            btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";
        }

        protected void radioCorporate_CheckedChanged(object sender, EventArgs e)
        {
            btnGenerateReport.Enabled = true; btnGenerateReport.CssClass = "silverButton";
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            if (!ddlRegions.SelectedValue.ToString().Equals("--Please Select--"))
            {
                getRegionID(ddlRegions.SelectedValue.ToString());
                generateRegionReport();
            }

            if (!ddlCountry.SelectedValue.ToString().Equals("--Please Select--"))
            {
                generateCountryReport();
            }

            if (radioAdAgency.Checked == true && radioCorporate.Checked == false)
            {
                generateAdAgencyReport();
            }

            if (radioCorporate.Checked == true && radioAdAgency.Checked == false)
            {
                generateCorporateReport();
            }

            if (!ddlIndustry.SelectedValue.ToString().Equals("--Please Select--"))
            {
                generateIndustryReport();
            }

            if (!ddlServices.SelectedValue.ToString().Equals("--Please Select--"))
            {
                generateServicesReport();
            }

            if (!ddlCompanies.SelectedValue.ToString().Equals("--Please Select--"))
            {
               generateCompaniesReport();
            }
        }

        private void generateRegionReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Region_ID", regionID);

            cmd.CommandText = "sp_sortByRegion";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_sortByRegion");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptSortByRegion.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('sortByRegion.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'Reports.aspx';</script>");
        }

        private void generateCountryReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Country_Name", ddlCountry.SelectedValue.ToString());

            cmd.CommandText = "sp_sortByCountry";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_sortByCountry");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptSortByCountry.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('sortByCountry.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'Reports.aspx';</script>");
        }

        private void generateAdAgencyReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            if (radioAdAgency.Checked == true && radioCorporate.Checked == false)
            {
                cmd.Parameters.AddWithValue("@Channel", "Ad Agency");
            }
            
            cmd.CommandText = "sp_sortByChannel";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_sortByChannel");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptSortByChannel.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('sortByChannel.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'Reports.aspx';</script>");
        }

        private void generateCorporateReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            if (radioAdAgency.Checked == false && radioCorporate.Checked == true)
            {
                cmd.Parameters.AddWithValue("@Channel", "Corporate");
            }

            cmd.CommandText = "sp_sortByChannel";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_sortByChannel");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptSortByChannel.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('sortByChannel.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'Reports.aspx';</script>");
        }

        private void generateIndustryReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;
            
            cmd.Parameters.AddWithValue("@Industry", ddlIndustry.SelectedValue.ToString());

            cmd.CommandText = "sp_sortByIndustry";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_sortByIndustry");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptSortByIndustry.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('sortByIndustry.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'Reports.aspx';</script>");
        }

        private void generateServicesReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Service", ddlServices.SelectedValue.ToString());

            cmd.CommandText = "sp_sortByService";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_sortByService");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptSortByService.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('sortByService.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'Reports.aspx';</script>");
        }

        private void generateCompaniesReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", ddlCompanies.SelectedValue.ToString());

            cmd.CommandText = "sp_sortByCompany";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_sortByCompany");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptSortByCompany.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('sortByCompany.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'Reports.aspx';</script>");
        }
    }
}