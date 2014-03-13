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

namespace videolounge
{
    public partial class Appointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlLocation.Items.Add("--Please Select--");
                loadLocations();
                ddlCountry.Items.Add("--Please Select--");
                loadCountries();
                ddlEmployee.Items.Add("--Please Select--");
                loadEmployees();
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

        protected void btnAddAppointment_Click(object sender, EventArgs e)
        {
            add_appointment();
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
                    string sqlQuery = "SELECT Username FROM Employees WHERE Status = 'active'";
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

        private void add_appointment()
        {
            SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Appointments (Appointment_Date, Appointment_Time, Appointment_Description, Appointment_Country, Appointment_Location, Employee, Company_Name) VALUES (@Appointment_Date, @Appointment_Time, @Appointment_Description, @Appointment_Country, @Appointment_Location, @Employee, @Company_Name)");

            if(txtAppointmentDate.Text.Equals("") && txtAppointmentTime.Text.Equals("") && txtAppointmentDescription.Text.Equals("") && ddlLocation.SelectedValue.ToString().Equals("--Please Select--") && ddlCountry.SelectedValue.ToString().Equals("--Please Select--") && ddlEmployee.SelectedValue.ToString().Equals("--Please Select--") && ddlCompany.SelectedValue.ToString().Equals("--Please Select--"))
            {
                lblMessageHeader.Text = "Please enter information into all fields!";
            }
            else
            {
                if (txtAppointmentDate.Text.Equals(""))
                {
                    lblMessageHeader.Text = "Please enter information into all fields!";
                }
                else
                {
                    cmdMyQuery.Parameters.AddWithValue("@Appointment_Date", txtAppointmentDate.Text);
                }

                if (txtAppointmentTime.Text.Equals(""))
                {
                    lblMessageHeader.Text = "Please enter information into all fields!";
                }
                else
                {
                    cmdMyQuery.Parameters.AddWithValue("@Appointment_Time", txtAppointmentTime.Text);
                }

                if (txtAppointmentDescription.Text.Equals(""))
                {
                    lblMessageHeader.Text = "Please enter information into all fields!";
                }
                else
                {
                    cmdMyQuery.Parameters.AddWithValue("@Appointment_Description", txtAppointmentDescription.Text);
                }

                if (ddlLocation.SelectedValue.ToString().Equals("--Please Select--") || ddlCountry.SelectedValue.ToString().Equals("--Please Select--"))
                {
                    lblMessageHeader.Text = "Please enter information into all fields!";
                }
                else
                {
                    cmdMyQuery.Parameters.AddWithValue("@Appointment_Country", ddlCountry.SelectedValue.ToString());
                    cmdMyQuery.Parameters.AddWithValue("@Appointment_Location", ddlLocation.SelectedValue.ToString());
                }
                //else if((ddlLocation.SelectedValue.ToString().Equals("--Please Select--") && !ddlCountry.SelectedValue.ToString().Equals("--Please Select--")))
                //{
                //    cmdMyQuery.Parameters.AddWithValue("@Appointment_Location", ddlCountry.SelectedValue.ToString());
                //}
                //else if((!ddlLocation.SelectedValue.ToString().Equals("--Please Select--") && ddlCountry.SelectedValue.ToString().Equals("--Please Select--")))
                //{
                //    cmdMyQuery.Parameters.AddWithValue("@Appointment_Location", ddlLocation.SelectedValue.ToString());
                //}

                if (ddlCompany.SelectedValue.ToString().Equals("--Please Select--"))
                {
                    lblMessageHeader.Text = "Please enter information into all fields!";
                }
                else
                {
                    cmdMyQuery.Parameters.AddWithValue("@Company_Name", ddlCompany.SelectedValue.ToString());
                }

                if (ddlEmployee.SelectedValue.ToString().Equals("--Please Select--"))
                {
                    lblMessageHeader.Text = "Please enter information into all fields!";
                }
                else
                {
                    cmdMyQuery.Parameters.AddWithValue("@Employee", ddlEmployee.SelectedValue.ToString());
                    int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                    lblMessageHeader.Text = "Successfully added Appointment!";
                }
            }
        }

        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (!ddlLocation.SelectedValue.ToString().Equals("--Please Select--"))
            //{
            //    ddlCountry.SelectedIndex = 0;
            //}
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (!ddlCountry.SelectedValue.ToString().Equals("--Please Select--"))
            //{
            //    ddlLocation.SelectedIndex = 0;
            //}
        }
    }
}