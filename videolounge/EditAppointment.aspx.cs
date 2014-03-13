using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using DB;
using System.Threading;

namespace videolounge
{
    public partial class EditAppointment : System.Web.UI.Page
    {
        private static int emp_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                emp_id = 0;

                ddlEmployee.Items.Add("--Please Select--");

                loadEmployees();
                ddlLocation.Items.Add("--Please Select--");

                loadLocations();
                ddlCountry.Items.Add("--Please Select--");

                loadCountries();
                ddlCompany.Items.Add("--Please Select--");

                loadCompanies();
            }
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
                        ddlCompany.Items.Add(resultCompanies);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        protected void btnEditAppointment_Click(object sender, EventArgs e)
        {
            edit_appointment(Convert.ToInt32(lstAppointments.SelectedValue.ToString()));
        }

        private void edit_appointment(int appointment_num)
        {
            //string newDate = txtAppointmentDate.Text;
            //newDate = newDate.Replace(@"-", @"/");

            if (ddlLocation.SelectedValue.ToString().Equals("--Please Select--") || ddlCountry.SelectedValue.ToString().Equals("--Please Select--"))
            {
                lblMessageHeader.Text = "Please choose a location and region!";
            }
            else
            {
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE Appointments SET Appointment_Date = '" + txtAppointmentDate.Text + "', Appointment_Time = '" + txtAppointmentTime.Text + "', Appointment_Description = '" + txtAppointmentDescription.Text + "', Appointment_Location = '" + ddlLocation.SelectedValue.ToString() + "', Appointment_Country = '" + ddlCountry.SelectedValue.ToString() + "' WHERE Appointment_ID = '" + appointment_num + "'");
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated!";
            }
        }

        protected void btnDeleteAppointment_Click(object sender, EventArgs e)
        {
            SqlCommand cmdMyQuery = new SqlCommand("DELETE FROM Appointments WHERE Appointment_ID = '" + Convert.ToInt32(lstAppointments.SelectedValue.ToString()) + "'");
            int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
            lblMessageHeader.Text = "Successfully deleted!";
            //Thread.Sleep(500);
            //Response.Redirect("EditAppointment.aspx", true);
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
                        string resultCountries = datatb.Rows[i]["Country_Name"].ToString();
                        ddlCountry.Items.Add(resultCountries);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadLocations()
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
                    string sqlQuery = "SELECT Location_Name FROM Locations ORDER BY Location_Name ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultLocations = datatb.Rows[i]["Location_Name"].ToString();
                        ddlLocation.Items.Add(resultLocations);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadAppointmentDetails(int appointment_id)
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
                    string sqlQuery = "SELECT * FROM Appointments WHERE Appointment_ID = '" + appointment_id + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultAppointmentDate = datatb.Rows[i]["Appointment_Date"].ToString();
                        string resultAppointmentTime = datatb.Rows[i]["Appointment_Time"].ToString();
                        string resultAppointmentDescription = datatb.Rows[i]["Appointment_Description"].ToString();
                        string resultAppointmentLocation = datatb.Rows[i]["Appointment_Location"].ToString();
                        string resultAppointmentCountry = datatb.Rows[i]["Appointment_Country"].ToString();
                        string resultAppointmentCompany = datatb.Rows[i]["Company_Name"].ToString();

                        txtAppointmentDate.Text = resultAppointmentDate;
                        txtAppointmentTime.Text = resultAppointmentTime;
                        txtAppointmentDescription.Text = resultAppointmentDescription;

                        for(int j = 0; j < ddlLocation.Items.Count; j++)
                        {
                            if (resultAppointmentLocation.Equals(ddlLocation.Items[j].Value))
                            {
                                ddlLocation.SelectedValue = resultAppointmentLocation;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlCountry.Items.Count; j++)
                        {
                            if (resultAppointmentCountry.Equals(ddlCountry.Items[j].Value))
                            {
                                ddlCountry.SelectedValue = resultAppointmentCountry;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlCompany.Items.Count; j++)
                        {
                            if (resultAppointmentCompany.Equals(ddlCompany.Items[j].Value))
                            {
                                ddlCompany.SelectedValue = resultAppointmentCompany;
                                break;
                            }
                        }
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadAppointments(string username)
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
                    string sqlQuery = "SELECT Appointment_ID FROM Appointments WHERE Employee = '" + username + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultAppointments = datatb.Rows[i]["Appointment_ID"].ToString();
                        lstAppointments.Items.Add(resultAppointments);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void get_employee_id(string username)
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
                    string sqlQuery = "SELECT Employee_ID FROM Employees WHERE Username = '" + username + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        emp_id = Convert.ToInt32(datatb.Rows[i]["Employee_ID"]);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmployee.SelectedValue.ToString().Equals("--Please Select--"))
            {
                lblMessageHeader.Text = "Please select a user";
            }
            else
            {
                lstAppointments.Items.Clear();
                get_employee_id(ddlEmployee.SelectedValue.ToString());
                loadAppointments(ddlEmployee.SelectedValue.ToString());
            }
        }

        protected void lstAppointments_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtAppointmentDate.Text = ""; txtAppointmentDescription.Text = ""; txtAppointmentTime.Text = ""; ddlLocation.SelectedIndex = 0; ddlCountry.SelectedIndex = 0;
            loadAppointmentDetails(Convert.ToInt32(lstAppointments.SelectedValue.ToString()));
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
                    string sqlQuery = "SELECT Username, Employee_ID FROM Employees WHERE Status = 'active'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultUsers = datatb.Rows[i]["Username"].ToString();
                        ddlEmployee.Items.Add(resultUsers);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }
    }
}