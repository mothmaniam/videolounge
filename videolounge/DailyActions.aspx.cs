using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace videolounge
{
    public partial class DailyActions : System.Web.UI.Page
    {
        private string industry, company, country;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCountry.Enabled = false; ddlIndustry.Enabled = false; ddlEntity.Enabled = false; ddlMonths.Enabled = false; btnOpenCalendar.Enabled = false; ddlAgency.Enabled = false;
                industry = ""; company = ""; country = "";
                ddlEmployees.Items.Add("--Please Select--");
                ddlEmployees.Items.Add("All Users");
                loadEmployees();
                ddlCountry.Items.Add("--Please Select--");
                loadCountries();
                ddlIndustry.Items.Add("--Please Select--");
                loadIndustries();
                ddlEntity.Items.Add("--Please Select--");
                loadEntities();
                loadMonths();
                ddlAgency.Items.Add("--Please Select--");
                loadAgencies();
            }
        }

        protected void ddlAgency_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlIndustry.SelectedIndex = 0; ddlEntity.SelectedIndex = 0; ddlMonths.SelectedIndex = 0; txtSearchDate.Text = "";

            if (ddlAgency.SelectedValue.ToString().Equals("--Please Select--"))
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByAgency("%", "%");
                }
                else if (!ddlEmployees.SelectedValue.ToString().Equals("All Users") && !ddlEmployees.SelectedValue.ToString().Equals("--Please Select--"))
                {
                    filterByAgency(ddlEmployees.SelectedValue.ToString(), "%");
                }
            }
            else
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByAgency("%", ddlAgency.SelectedValue.ToString());
                }
                else
                {
                    filterByAgency(ddlEmployees.SelectedValue.ToString(), ddlAgency.SelectedValue.ToString());
                }
            }
        }

        protected void ddlEmployees_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCountry.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlEntity.SelectedIndex = 0; ddlMonths.SelectedIndex = 0; txtSearchDate.Text = "";
            ddlAgency.SelectedIndex = 0;

            if (ddlEmployees.SelectedValue.ToString().Equals("--Please Select--"))
            {
                ddlCountry.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlEntity.SelectedIndex = 0; ddlMonths.SelectedIndex = 0; txtSearchDate.Text = "";
                ddlCountry.Enabled = false; ddlIndustry.Enabled = false; ddlEntity.Enabled = false; ddlMonths.Enabled = false; btnOpenCalendar.Enabled = false; ddlAgency.Enabled = true;
                gridOpportunities.DataSource = null;
                gridOpportunities.DataBind();
            }
            else if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
            {
                ddlCountry.Enabled = true; ddlIndustry.Enabled = true; ddlEntity.Enabled = true; ddlMonths.Enabled = true; btnOpenCalendar.Enabled = true; ddlAgency.Enabled = true;
                loadEmployeeDailyActions("%");
            }
            else
            {
                ddlCountry.Enabled = true; ddlIndustry.Enabled = true; ddlEntity.Enabled = true; ddlMonths.Enabled = true; btnOpenCalendar.Enabled = true; ddlAgency.Enabled = true;
                loadEmployeeDailyActions(ddlEmployees.SelectedValue.ToString());
            }
        }

        private void loadAgencies()
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
                    string sqlQuery = "SELECT Agency_Clients_Name FROM Agency_Clients ORDER BY Agency_Clients_Name ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string agency_name = datatb.Rows[i]["Agency_Clients_Name"].ToString();
                        ddlAgency.Items.Add(agency_name);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadEntities()
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
                        string company_name = datatb.Rows[i]["Company_Name"].ToString();
                        ddlEntity.Items.Add(company_name);
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
                        string job_industry = datatb.Rows[i]["Job_Industry_Description"].ToString();
                        ddlIndustry.Items.Add(job_industry);
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
                    string sqlQuery = "SELECT * FROM Countries ORDER BY Country_Name ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string countries = datatb.Rows[i]["Country_Name"].ToString();
                        ddlCountry.Items.Add(countries);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadEmployees()
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
                    string sqlQuery = "SELECT Username FROM Employees WHERE Status = 'active' ORDER BY Username ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string users = datatb.Rows[i]["Username"].ToString();
                        ddlEmployees.Items.Add(users);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadMonths()
        {
            ddlMonths.Items.Add("--Please Select--");

            string[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };

            foreach (string themonths in months)
            {
                ddlMonths.Items.Add(themonths);
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlIndustry.SelectedIndex = 0; ddlEntity.SelectedIndex = 0; ddlMonths.SelectedIndex = 0; txtSearchDate.Text = ""; ddlAgency.SelectedIndex = 0;

            if (ddlCountry.SelectedValue.ToString().Equals("--Please Select--"))
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByCountry("%", "%");
                }
                else if (!ddlEmployees.SelectedValue.ToString().Equals("All Users") && !ddlEmployees.SelectedValue.ToString().Equals("--Please Select--"))
                {
                    country = "%";
                    filterByCountry(ddlEmployees.SelectedValue.ToString(), country);
                }
            }
            else
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByCountry("%", ddlCountry.SelectedValue.ToString());
                }
                else
                {
                    filterByCountry(ddlEmployees.SelectedValue.ToString(), ddlCountry.SelectedValue.ToString());
                }
            }
        }

        protected void ddlIndustry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCountry.SelectedIndex = 0; ddlEntity.SelectedIndex = 0; ddlMonths.SelectedIndex = 0; txtSearchDate.Text = ""; ddlAgency.SelectedIndex = 0;

            if (ddlIndustry.SelectedValue.ToString().Equals("--Please Select--"))
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByIndustry("%", "%");
                }
                else if (!ddlEmployees.SelectedValue.ToString().Equals("All Users") && !ddlEmployees.SelectedValue.ToString().Equals("--Please Select--"))
                {
                    industry = "%";
                    filterByIndustry(ddlEmployees.SelectedValue.ToString(), industry);
                }
            }
            else
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByIndustry("%", ddlIndustry.SelectedValue.ToString());
                }
                else
                {
                    filterByIndustry(ddlEmployees.SelectedValue.ToString(), ddlIndustry.SelectedValue.ToString());
                }
            }
        }

        protected void ddlEntity_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCountry.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlMonths.SelectedIndex = 0; txtSearchDate.Text = ""; ddlAgency.SelectedIndex = 0;

            if (ddlEntity.SelectedValue.ToString().Equals("--Please Select--"))
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByCompany("%", "%");
                }
                else if (!ddlEmployees.SelectedValue.ToString().Equals("All Users") && !ddlEmployees.SelectedValue.ToString().Equals("--Please Select--"))
                {
                    company = "%";
                    filterByCompany(ddlEmployees.SelectedValue.ToString(), company);
                }
            }
            else
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByCompany("%", ddlEntity.SelectedValue.ToString());
                }
                else
                {
                    filterByCompany(ddlEmployees.SelectedValue.ToString(), ddlEntity.SelectedValue.ToString());
                }
            }
        }

        protected void ddlMonths_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCountry.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlEntity.SelectedIndex = 0; txtSearchDate.Text = ""; ddlAgency.SelectedIndex = 0;
            gridOpportunities.DataSource = null;
            gridOpportunities.DataBind();

            if (ddlMonths.SelectedValue.ToString().Equals("--Please Select--"))
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    loadEmployeeDailyActions("%");
                }
                else if (!ddlEmployees.SelectedValue.ToString().Equals("All Users") && !ddlEmployees.SelectedValue.ToString().Equals("--Please Select--"))
                {
                    loadEmployeeDailyActions(ddlEmployees.SelectedValue.ToString());
                }
            }
            else
            {
                if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
                {
                    filterByMonths("%", ddlMonths.SelectedValue.ToString());
                }
                else
                {
                    filterByMonths(ddlEmployees.SelectedValue.ToString(), ddlMonths.SelectedValue.ToString());
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ddlCountry.SelectedIndex = 0; ddlIndustry.SelectedIndex = 0; ddlEntity.SelectedIndex = 0; ddlMonths.SelectedIndex = 0; ddlAgency.SelectedIndex = 0;

            if (ddlEmployees.SelectedValue.ToString().Equals("All Users"))
            {
                filterByActualDate("%", txtSearchDate.Text);
            }
            else if (!ddlEmployees.SelectedValue.ToString().Equals("All Users") && !ddlEmployees.SelectedValue.ToString().Equals("--Please Select--"))
            {
                filterByActualDate(ddlEmployees.SelectedValue.ToString(), txtSearchDate.Text);
            }
        }

        private void filterByActualDate(string username, string date)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;

            string sqlQuery = "SELECT * FROM Opportunities WHERE Employee LIKE '" + username + "' AND Date_Next_Contact = '" + date + "'";
            mySQLCommand.CommandText = sqlQuery;
            datatb = new DataTable();
            da = new SqlDataAdapter(mySQLCommand);
            da.Fill(datatb);
            gridOpportunities.DataSource = datatb;
            gridOpportunities.DataBind();
        }

        private void filterByMonths(string username, string date)
        {
            date = ddlMonths.SelectedValue.ToString();
            int selectedMonthValue = 0;
            string monthValue = "";

            string[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };

            for (int i = 0; i < months.Length; i++)
            {
                if (date.Equals(months[i]))
                {
                    selectedMonthValue = i + 1;
                }
            }

            if (selectedMonthValue < 10)
            {
                monthValue = "0" + selectedMonthValue;
            }
            else
            {
                monthValue = "" + selectedMonthValue;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;
            int count = 0;
            string date_next_contact = ""; string resultDNC = ""; string sqlQuery, sqlQuery2 = "";

            try
            {
                using (conn)
                {
                    conn.Open();
                    sqlQuery = "SELECT Date_Next_Contact FROM Opportunities WHERE Employee LIKE '" + username + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);

                    count = mySQLCommand.ExecuteNonQuery();

                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        resultDNC = datatb.Rows[i]["Date_Next_Contact"].ToString();
                        date_next_contact = resultDNC.Substring(5, 2);

                        if (date_next_contact == monthValue)
                        {
                            sqlQuery2 = "SELECT * FROM Opportunities WHERE Employee LIKE '" + username + "' AND DatePart(mm, Date_Next_Contact) = '" + monthValue + "' AND DatePart(yyyy, Date_Next_Contact) = '" + DateTime.Today.Year + "'";
                            mySQLCommand.CommandText = sqlQuery2;
                            datatb = new DataTable();
                            da = new SqlDataAdapter(mySQLCommand);
                            da.Fill(datatb);
                            gridOpportunities.DataSource = datatb;
                            gridOpportunities.DataBind();
                        }
                    }
                    conn.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void filterByCompany(string username, string company)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT * FROM Opportunities WHERE Employee LIKE '" + username + "' AND Company_Name LIKE '" + company + "' AND '" + DateTime.Today.ToShortDateString() + "' = Date_Next_Contact";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    gridOpportunities.DataSource = datatb;
                    gridOpportunities.DataBind();
                    conn.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void filterByCountry(string username, string country)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT * FROM Opportunities WHERE Employee LIKE '" + username + "' AND Country LIKE '" + country + "' AND '" + DateTime.Today.ToShortDateString() + "' = Date_Next_Contact";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    gridOpportunities.DataSource = datatb;
                    gridOpportunities.DataBind();
                    conn.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void filterByIndustry(string username, string industry)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT * FROM Opportunities WHERE Employee LIKE '" + username + "' AND Job_Industry LIKE '" + industry + "' AND '" + DateTime.Today.ToShortDateString() + "' = Date_Next_Contact";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    gridOpportunities.DataSource = datatb;
                    gridOpportunities.DataBind();
                    conn.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void filterByAgency(string username, string agency)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT * FROM Opportunities WHERE Employee LIKE '" + username + "' AND Agency LIKE '" + agency + "' AND '" + DateTime.Today.ToShortDateString() + "' = Date_Next_Contact";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    gridOpportunities.DataSource = datatb;
                    gridOpportunities.DataBind();
                    conn.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadEmployeeDailyActions(string username)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = conn;

            try
            {
                using (conn)
                {
                    conn.Open();
                    string sqlQuery = "SELECT * FROM Opportunities WHERE Employee LIKE '" + username + "' AND '" + DateTime.Today.ToShortDateString() + "' = Date_Next_Contact";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    gridOpportunities.DataSource = datatb;
                    gridOpportunities.DataBind();
                    conn.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }
    }
}