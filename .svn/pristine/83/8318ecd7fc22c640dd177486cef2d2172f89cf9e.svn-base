using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DB;
using CrystalDecisions.CrystalReports.Engine;

namespace videolounge
{
    public partial class LiveJobs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divLiveJobs.Visible = false;
                loadEmployees();
                loadAgencies();
                loadCountries();
                loadIndustries();
                loadCompanies();
            }
        }

        private void loadEmployees()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Username FROM Employees WHERE Username NOT LIKE 'debbie' AND Status = 'active'");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlLiveJobsEmployee.DataSource = dtResults;
            ddlLiveJobsEmployee.DataTextField = "Username";
            ddlLiveJobsEmployee.DataValueField = "Username";
            ddlLiveJobsEmployee.DataBind();
        }

        private void loadAgencies()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Agency_Clients_Name FROM Agency_Clients ORDER BY Agency_Clients_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlLiveJobsAgency.DataSource = dtResults;
            ddlLiveJobsAgency.DataTextField = "Agency_Clients_Name";
            ddlLiveJobsAgency.DataValueField = "Agency_Clients_Name";
            ddlLiveJobsAgency.DataBind();
        }

        private void loadCountries()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Country_Name FROM Countries ORDER BY Country_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlLiveJobsCountry.DataSource = dtResults;
            ddlLiveJobsCountry.DataTextField = "Country_Name";
            ddlLiveJobsCountry.DataValueField = "Country_Name";
            ddlLiveJobsCountry.DataBind();
        }

        private void loadIndustries()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Job_Industry_Description FROM Job_Industry ORDER BY Job_Industry_Description ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlLiveJobsIndustry.DataSource = dtResults;
            ddlLiveJobsIndustry.DataTextField = "Job_Industry_Description";
            ddlLiveJobsIndustry.DataValueField = "Job_Industry_Description";
            ddlLiveJobsIndustry.DataBind();
        }

        private void loadCompanies()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Company_Name FROM Contacts ORDER BY Company_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlLiveJobsCompany.DataSource = dtResults;
            ddlLiveJobsCompany.DataTextField = "Company_Name";
            ddlLiveJobsCompany.DataValueField = "Company_Name";
            ddlLiveJobsCompany.DataBind();
        }

        protected void radioViewLiveJobs_CheckedChanged(object sender, EventArgs e)
        {
            divLiveJobs.Visible = true;
            loadLiveJobs();
        }

        protected void radioViewLiveJobsReport_CheckedChanged(object sender, EventArgs e)
        {
            divLiveJobs.Visible = false;
            printReport(ddlLiveJobsCompany.SelectedValue.ToString());
        }

        private void printReport(string companyName)
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Job_Active", "Yes");

            cmd.CommandText = "sp_LiveJobs";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_LiveJobs");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewLiveJobs.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewLiveJobsReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'LiveJobs.aspx';</script>");
        }

        protected void lstLiveJobs_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadLiveJobDetails(Convert.ToInt32(lstLiveJobs.SelectedValue.ToString()));
        }

        protected void btnLiveJobs_Click(object sender, EventArgs e)
        {
            string value;
            value = txtLiveJobsValue.Text.Trim();
            double num = 0;

            if (double.TryParse(txtLiveJobsValue.Text, out num))
            {
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Last_Updated_By = @Last_Updated_By, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Opportunity_Value = @Opportunity_Value, Opportunity_Stage = @Opportunity_Stage, Country = @Country, Job_Industry = @Job_Industry, Job_Active = @Job_Active, Company_Name = @Company_Name WHERE Opportunities_ID = '" + Convert.ToInt32(lstLiveJobs.SelectedValue.ToString()) + "'");
                cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlLiveJobsEmployee.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlLiveJobsAgency.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtLiveJobsJobName.Text;
                cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtLiveJobsCalendarDate.Text;
                cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtLiveJobsDateLastContact.Text;
                cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtLiveJobsDateNextContact.Text;
                cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtLiveJobsOutcomeLastContact.Text;
                cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtLiveJobsNextActionRequired.Text;
                cmdMyQuery.Parameters.Add("@Opportunity_Value", System.Data.SqlDbType.VarChar).Value = Convert.ToDouble(txtLiveJobsValue.Text);
                cmdMyQuery.Parameters.Add("@Opportunity_Stage", System.Data.SqlDbType.VarChar).Value = "Quote";
                cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlLiveJobsCountry.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Job_industry", System.Data.SqlDbType.VarChar).Value = ddlLiveJobsIndustry.SelectedValue.ToString();

                if (radioJobActiveYes.Checked == true && radioJobActiveNo.Checked == false)
                {
                    cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "Yes";
                }
                else if(radioJobActiveNo.Checked == true && radioJobActiveYes.Checked == false)
                {
                    cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "No";
                }

                cmdMyQuery.Parameters.Add("@Company_Name", System.Data.SqlDbType.VarChar).Value = ddlLiveJobsCompany.SelectedValue.ToString();

                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated!";
            }
            else
            {
                lblMessageHeader.Text = "Please enter a number for the value!";
                txtLiveJobsValue.Focus();
            }
        }

        protected void radioJobActiveYes_CheckedChanged(object sender, EventArgs e)
        {
        }

        protected void radioJobActiveNo_CheckedChanged(object sender, EventArgs e)
        {
        }

        private void loadLiveJobs()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Job_Active = 'Yes' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstLiveJobs.DataSource = dtResults;
            lstLiveJobs.DataTextField = "Opportunity_Name";
            lstLiveJobs.DataValueField = "Opportunities_ID";
            lstLiveJobs.DataBind();
        }

        private void loadLiveJobDetails(int opportunity_id)
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
                    string sqlQuery = "SELECT * FROM Opportunities WHERE Opportunities_ID = '" + opportunity_id + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string employee = datatb.Rows[i]["Employee"].ToString();
                        string agency = datatb.Rows[i]["Agency"].ToString();
                        string opportunityName = datatb.Rows[i]["Opportunity_Name"].ToString();
                        string opportunityDate = datatb.Rows[i]["Opportunity_Date"].ToString();
                        string dateLastContact = datatb.Rows[i]["Date_Last_Contact"].ToString();
                        string dateNextContact = datatb.Rows[i]["Date_Next_Contact"].ToString();
                        string outcomeLastContact = datatb.Rows[i]["Outcome_Last_Contact"].ToString();
                        string nextActionRequired = datatb.Rows[i]["Next_Action_Required"].ToString();
                        double value = Convert.ToDouble(datatb.Rows[i]["Opportunity_Value"].ToString());
                        string country = datatb.Rows[i]["Country"].ToString();
                        string jobIndustry = datatb.Rows[i]["Job_Industry"].ToString();
                        string jobActive = datatb.Rows[i]["Job_Active"].ToString();
                        string companyName = datatb.Rows[i]["Company_Name"].ToString();
                        string stage = datatb.Rows[i]["Opportunity_Stage"].ToString();

                        if (jobActive.Equals("Yes"))
                        {
                            radioJobActiveYes.Checked = true;
                        }
                        else
                        {
                            radioJobActiveNo.Checked = true;
                        }

                        for (int j = 0; j < ddlLiveJobsEmployee.Items.Count; j++)
                        {
                            if (employee.Equals(ddlLiveJobsEmployee.Items[j].Value))
                            {
                                ddlLiveJobsEmployee.SelectedValue = employee;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlLiveJobsAgency.Items.Count; j++)
                        {
                            if (agency.Equals(ddlLiveJobsAgency.Items[j].Value))
                            {
                                ddlLiveJobsAgency.SelectedValue = agency;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlLiveJobsCountry.Items.Count; j++)
                        {
                            if (country.Equals(ddlLiveJobsCountry.Items[j].Value))
                            {
                                ddlLiveJobsCountry.SelectedValue = country;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlLiveJobsIndustry.Items.Count; j++)
                        {
                            if (jobIndustry.Equals(ddlLiveJobsIndustry.Items[j].Value))
                            {
                                ddlLiveJobsIndustry.SelectedValue = jobIndustry;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlLiveJobsCompany.Items.Count; j++)
                        {
                            if (companyName.Equals(ddlLiveJobsCompany.Items[j].Value))
                            {
                                ddlLiveJobsCompany.SelectedValue = companyName;
                                break;
                            }
                        }

                        txtLiveJobsJobName.Text = opportunityName;
                        txtLiveJobsCalendarDate.Text = opportunityDate;
                        txtLiveJobsDateLastContact.Text = dateLastContact;
                        txtLiveJobsDateNextContact.Text = dateNextContact;
                        txtLiveJobsOutcomeLastContact.Text = outcomeLastContact;
                        txtLiveJobsNextActionRequired.Text = nextActionRequired;
                        txtLiveJobsValue.Text = "" + value;
                        txtLiveJobsStage.Text = stage;
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception exc) { Response.Write(exc.Message); }
        }
    }
}