﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using DB;
using System.Web.UI;
using System.Threading;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace videolounge
{
    public partial class EditCompany : System.Web.UI.Page
    {
        private static string produce_in_sa, likelihood;
        private static int counter;
        private string companyName;
        private int countryID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadLocationsForAppointments();
                loadEmployeesForAppointments();
                //loadCompaniesForAppointments();
                loadCountriesForAppointments();
                //loadCompanies();
                loadCountries();
                loadAgencies();
                loadIndustries();
                //loadWorkTypes();
                //loadAgencyClients();
                counter = 0;
                divAddAppointments.Visible = false;
                divEditAppointments.Visible = false;
                divViewAppointments.Visible = false;
                divAddJobsInPipeline.Visible = false;
                divEditJobsInPipeline.Visible = false;
                divQuotes.Visible = false;
                divDebt.Visible = false;
                companyName = string.Empty; likelihood = string.Empty;
                btnEdit.Enabled = false;
                countryID = 0;

                try
                {
                    companyName = Session["CompanyName"].ToString();
                    lstCompanies.SelectedValue = companyName;
                    lstCompanies_SelectedIndexChanged(null, null);
                }
                catch (Exception ex) { }
            }
        }

        private void loadCompanyDetails(string company_name)
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
                    string sqlQuery = "SELECT * FROM Contacts WHERE Company_Name = '" + company_name + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultCompanyName = datatb.Rows[i]["Company_Name"].ToString();
                        string resultMarketer = datatb.Rows[i]["Marketer"].ToString();
                        string resultHowLeadSourced = datatb.Rows[i]["How_Lead_Sourced"].ToString();
                        string resultAffiliatedTo = datatb.Rows[i]["Affiliated_To"].ToString();
                        string resultLandline = datatb.Rows[i]["Landline"].ToString();
                        string resultWebsite = datatb.Rows[i]["Website"].ToString();
                        string resultPhysicalAddress = datatb.Rows[i]["Physical_Address"].ToString();
                        string resultPostalAddress = datatb.Rows[i]["Postal_Address"].ToString();
                        string resultAdAgency = datatb.Rows[i]["Ad_Agency"].ToString();
                        string resultChannel = datatb.Rows[i]["Channel"].ToString();
                        string resultIndustry = datatb.Rows[i]["Industry"].ToString();
                        string resultWorkTypes = datatb.Rows[i]["Work_Types"].ToString();
                        string resultProducersLocal = datatb.Rows[i]["Producers_Local"].ToString();
                        string resultProducersInternational = datatb.Rows[i]["Producers_International"].ToString();
                        string resultDirectorsLocal = datatb.Rows[i]["Directors_Local"].ToString();
                        string resultDirectorsInternational = datatb.Rows[i]["Directors_International"].ToString();
                        string resultProduceInSA = datatb.Rows[i]["Produce_In_SA"].ToString();
                        string resultProduceInCountries = datatb.Rows[i]["Produce_In_Countries"].ToString();
                        string resultAgenciesClients = datatb.Rows[i]["Agencies_Clients"].ToString();

                        txtMarketer.Text = resultMarketer;
                        txtLeadSourced.Text = resultHowLeadSourced;
                        txtCompany.Text = resultCompanyName;
                        txtAffiliatedTo.Text = resultAffiliatedTo;
                        txtLandline.Text = resultLandline;
                        txtWebsite.Text = resultWebsite;
                        txtPhysicalAddress.Text = resultPhysicalAddress;
                        txtPostalAddress.Text = resultPostalAddress;
                        txtProducersLocal.Text = resultProducersLocal;
                        txtProducersInternational.Text = resultProducersInternational;
                        txtDirectorsLocal.Text = resultDirectorsLocal;
                        txtDirectorsInternational.Text = resultDirectorsInternational;
                        txtTypeOfWork.Text = resultWorkTypes;

                        if (resultChannel.Equals("Ad Agency"))
                        {
                            radioAdAgency.Checked = true;
                            radioCorporate.Checked = false;
                            lblAdAgency.Text = "Clients";
                            txtAdAgency.Visible = true;
                            txtClients.Visible = false;
                            txtAdAgency.Text = resultAdAgency;
                        }
                        else if (resultChannel.Equals("Corporate"))
                        {
                            radioCorporate.Checked = true;
                            radioAdAgency.Checked = false;
                            lblAdAgency.Text = "Agency";
                            txtClients.Visible = true;
                            txtAdAgency.Visible = false;
                            txtClients.Text = resultAdAgency;
                        }

                        //for (int j = 0; j < ddlAgency.Items.Count; j++)
                        //{
                        //    if (resultAdAgency.Equals(ddlAgency.Items[j].Value))
                        //    {
                        //        ddlAgency.SelectedValue = resultAdAgency;
                        //        break;
                        //    }
                        //}

                        //--------------------------------------------------------------
                        for (int j = 0; j < ddlIndustry.Items.Count; j++)
                        {
                            if (resultIndustry.Equals(ddlIndustry.Items[j].Value))
                            {
                                ddlIndustry.SelectedValue = resultIndustry;
                                break;
                            }
                        }

                        if (resultProduceInSA.Equals("Yes"))
                        {
                            radioProdSAYes.Checked = true;
                            radioProdSANo.Checked = false;
                        }
                        else if (resultProduceInSA.Equals("No"))
                        {
                            radioProdSAYes.Checked = false;
                            radioProdSANo.Checked = true;
                        }
                        else
                        {
                            radioProdSAYes.Checked = false;
                            radioProdSANo.Checked = false;
                        }

                        //--------------------------------------------------------------

                        if (resultProduceInCountries.Equals("") || resultProduceInCountries == null)
                        {
                        }
                        else
                        {
                            lstCountriesAdded.Items.Clear();
                            string[] countries = resultProduceInCountries.Split(',');

                            foreach (string current_countries in countries)
                            {
                                lstCountriesAdded.Items.Add(current_countries);

                                //to remove selected countries from countries list
                                //for (int k = 0; k < lstCountriesAdded.Items.Count; k++)
                                //{
                                //    if (current_countries.Equals(lstCountries.Items[k].Value));
                                //        lstCountries.Items.Remove(lstCountries.Items[k].Value);
                                //}
                                //Response.Write(current_countries);
                            }
                        }

                        //--------------------------------------------------------------

                        txtAgencyClients.Text = resultAgenciesClients;

                        //if (resultAgenciesClients.Equals("") || resultAgenciesClients == null)
                        //{
                        //}
                        //else
                        //{
                        //    lstAgencyClientsAdded.Items.Clear();
                        //    string[] agency_clients = resultAgenciesClients.Split(',');

                        //    foreach (string current_agency_clients in agency_clients)
                        //    {
                        //        lstAgencyClientsAdded.Items.Add(current_agency_clients);
                        //    }
                        //}

                        //--------------------------------------------------------------

                        //if (resultWorkTypes.Equals("") || resultWorkTypes == null)
                        //{
                        //}
                        //else
                        //{
                        //    lstWorkTypesAdded.Items.Clear();
                        //    string[] workTypes = resultWorkTypes.Split(',');

                        //    foreach (string current_workTypes in workTypes)
                        //    {
                        //        lstWorkTypesAdded.Items.Add(current_workTypes);
                        //    }
                        //}

                        //--------------------------------------------------------------
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        //private void loadWorkTypes()
        //{
        //    SqlCommand cmdMyQuery = new SqlCommand("SELECT Work_Type_Description FROM Work_Types ORDER BY Work_Type_Description ASC");
        //    DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
        //    lstWorkType.DataSource = dtResults;
        //    lstWorkType.DataTextField = "Work_Type_Description";
        //    lstWorkType.DataValueField = "Work_Type_Description";
        //    lstWorkType.DataBind();
        //}

        private void loadLocationsForAppointments()
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
                        ddlAppointmentLocation.Items.Add(resultLocations);
                        ddlLocation.Items.Add(resultLocations);
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

        private void add_appointment()
        {
            SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Appointments (Appointment_Date, Appointment_Time, Appointment_Description, Appointment_Country, Appointment_Location, Employee, Company_Name) VALUES (@Appointment_Date, @Appointment_Time, @Appointment_Description, @Appointment_Country, @Appointment_Location, @Employee, @Company_Name)");

            if (txtAppointmentDate.Text.Equals("") && txtAppointmentTime.Text.Equals("") && txtAppointmentDescription.Text.Equals("") && ddlLocation.SelectedValue.ToString().Equals("--Please Select--") && ddlCountry.SelectedValue.ToString().Equals("--Please Select--") && ddlEmployee.SelectedValue.ToString().Equals("--Please Select--"))
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

                cmdMyQuery.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());

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

        protected void lstAppointments_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadAppointmentDetails(Convert.ToInt32(lstAppointments.SelectedValue.ToString()));
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
                    string sqlQuery = "SELECT * FROM Appointments WHERE Appointment_ID = '" + appointment_id + "' AND Company_Name = '" + Session["CompanyName"].ToString() + "' ORDER BY Appointment_Date DESC";
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
                        string resultAppointmentCountry = datatb.Rows[i]["Appointment_Country"].ToString();
                        string resultAppointmentLocation = datatb.Rows[i]["Appointment_Location"].ToString();
                        string resultAppointmentEmployee = datatb.Rows[i]["Employee"].ToString();
                        string resultAppointmentCompany = datatb.Rows[i]["Company_Name"].ToString();

                        txtEditAppointmentDate.Text = resultAppointmentDate;
                        txtEditAppointmentTime.Text = resultAppointmentTime;
                        txtEditAppointmentDescription.Text = resultAppointmentDescription;

                        for (int j = 0; j < ddlAppointmentLocation.Items.Count; j++)
                        {
                            if (resultAppointmentLocation.Equals(ddlAppointmentLocation.Items[j].Value))
                            {
                                ddlAppointmentLocation.SelectedValue = resultAppointmentLocation;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlAppointmentCountry.Items.Count; j++)
                        {
                            if (resultAppointmentCountry.Equals(ddlAppointmentCountry.Items[j].Value))
                            {
                                ddlAppointmentCountry.SelectedValue = resultAppointmentCountry;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlAppointmentCompany.Items.Count; j++)
                        {
                            if (resultAppointmentCompany.Equals(ddlAppointmentCompany.Items[j].Value))
                            {
                                ddlAppointmentCompany.SelectedValue = resultAppointmentCompany;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlAppointmentEmployee.Items.Count; j++)
                        {
                            if (resultAppointmentEmployee.Equals(ddlAppointmentEmployee.Items[j].Value))
                            {
                                ddlAppointmentEmployee.SelectedValue = resultAppointmentEmployee;
                                break;
                            }
                        }
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception exc) { Response.Write(exc.Message); }
        }

        private void loadEmployeesForAppointments()
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
                        ddlAppointmentEmployee.Items.Add(resultUsers);
                        ddlEmployee.Items.Add(resultUsers);
                        ddlPipelineEmployee.Items.Add(resultUsers);
                        ddlEditPipelineEmployee.Items.Add(resultUsers);
                        ddlQuotesEmployee.Items.Add(resultUsers);
                        ddlDebtEmployee.Items.Add(resultUsers);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void clearControls()
        {
            txtCompany.Text = ""; txtAffiliatedTo.Text = ""; txtLandline.Text = ""; txtWebsite.Text = ""; txtPhysicalAddress.Text = ""; txtPostalAddress.Text = "";
            txtMarketer.Text = ""; txtLeadSourced.Text = ""; txtProducersLocal.Text = ""; txtProducersInternational.Text = "";
            txtDirectorsLocal.Text = ""; txtDirectorsInternational.Text = "";
            txtClients.Text = ""; txtAdAgency.Text = ""; ddlIndustry.SelectedIndex = 0; radioProdSAYes.Checked = false; radioProdSANo.Checked = false;
            lblMessageHeader.Text = ""; txtTypeOfWork.Text = ""; txtAgencyClients.Text = "";
            lstCountriesAdded.Items.Clear(); lstCountries.SelectedIndex = -1;
            radioAdAgency.Checked = false; radioCorporate.Checked = false;
            //lstAgencyClientsAdded.Items.Clear(); lstAgencyClients.SelectedIndex = -1;
            //lstWorkTypesAdded.Items.Clear(); lstWorkType.SelectedIndex = -1;
        }

        //private void loadAgencyClients()
        //{
        //    SqlCommand cmdMyQuery = new SqlCommand("SELECT Agency_Clients_Name FROM Agency_Clients ORDER BY Agency_Clients_Name ASC");
        //    DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
        //    lstAgencyClients.DataSource = dtResults;
        //    lstAgencyClients.DataTextField = "Agency_Clients_Name";
        //    lstAgencyClients.DataValueField = "Agency_Clients_Name";
        //    lstAgencyClients.DataBind();
        //}

        protected void lstCompanies_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnEdit.Enabled = true;
            counter++;
            clearControls();
            loadCompanyDetails(lstCompanies.SelectedValue.ToString());
            Session["CompanyName"] = txtCompany.Text;
        }

        private void loadCompaniesForAppointments()
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
                        ddlAppointmentCompany.Items.Add(resultCompanies);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        protected void radioCompanyTypeCorporate_CheckedChanged(object sender, EventArgs e)
        {
            lstCompanies.Items.Clear();
            ddlAppointmentCompany.Items.Clear();
            clearControls();

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
                    string sqlQuery = "SELECT Company_Name FROM Contacts WHERE Channel = 'Corporate' ORDER BY Company_Name ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultCompanies = datatb.Rows[i]["Company_Name"].ToString();
                        lstCompanies.Items.Add(resultCompanies);
                        ddlAppointmentCompany.Items.Add(resultCompanies);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception ex) { Response.Write(ex.Message); }
        }

        protected void radioCompanyTypeAll_CheckedChanged(object sender, EventArgs e)
        {
            lstCompanies.Items.Clear();
            ddlAppointmentCompany.Items.Clear();
            clearControls();

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
                        lstCompanies.Items.Add(resultCompanies);
                        ddlAppointmentCompany.Items.Add(resultCompanies);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception ex) { Response.Write(ex.Message); }
        }

        protected void radioCompanyTypeAdAgency_CheckedChanged(object sender, EventArgs e)
        {
            lstCompanies.Items.Clear();
            ddlAppointmentCompany.Items.Clear();
            clearControls();

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
                    string sqlQuery = "SELECT Company_Name FROM Contacts WHERE Channel = 'Ad Agency' ORDER BY Company_Name ASC";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultCompanies = datatb.Rows[i]["Company_Name"].ToString();
                        lstCompanies.Items.Add(resultCompanies);
                        ddlAppointmentCompany.Items.Add(resultCompanies);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception ex) { Response.Write(ex.Message); }
        }

        private void loadCountriesForAppointments()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Country_Name FROM Countries ORDER BY Country_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlAppointmentCountry.DataSource = dtResults;
            ddlAppointmentCountry.DataTextField = "Country_Name";
            ddlAppointmentCountry.DataValueField = "Country_Name";
            ddlAppointmentCountry.DataBind();

            ddlCountry.DataSource = dtResults;
            ddlCountry.DataTextField = "Country_Name";
            ddlCountry.DataValueField = "Country_Name";
            ddlCountry.DataBind();

            ddlPipelineCountry.DataSource = dtResults;
            ddlPipelineCountry.DataTextField = "Country_Name";
            ddlPipelineCountry.DataValueField = "Country_Name";
            ddlPipelineCountry.DataBind();

            ddlEditPipelineCountry.DataSource = dtResults;
            ddlEditPipelineCountry.DataTextField = "Country_Name";
            ddlEditPipelineCountry.DataValueField = "Country_Name";
            ddlEditPipelineCountry.DataBind();

            ddlQuotesCountry.DataSource = dtResults;
            ddlQuotesCountry.DataTextField = "Country_Name";
            ddlQuotesCountry.DataValueField = "Country_Name";
            ddlQuotesCountry.DataBind();

            ddlDebtCountry.DataSource = dtResults;
            ddlDebtCountry.DataTextField = "Country_Name";
            ddlDebtCountry.DataValueField = "Country_Name";
            ddlDebtCountry.DataBind();
        }

        private void loadCountries()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Country_Name FROM Countries ORDER BY Country_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstCountries.DataSource = dtResults;
            lstCountries.DataTextField = "Country_Name";
            lstCountries.DataValueField = "Country_Name";
            lstCountries.DataBind();
        }

        private void loadAgencies()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Agency_Clients_Name FROM Agency_Clients ORDER BY Agency_Clients_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            //ddlAgency.DataSource = dtResults;
            //ddlAgency.DataTextField = "Agency_Clients_Name";
            //ddlAgency.DataValueField = "Agency_Clients_Name";
            //ddlAgency.DataBind();

            ddlPipelineAgency.DataSource = dtResults;
            ddlPipelineAgency.DataTextField = "Agency_Clients_Name";
            ddlPipelineAgency.DataValueField = "Agency_Clients_Name";
            ddlPipelineAgency.DataBind();

            ddlEditPipelineAgency.DataSource = dtResults;
            ddlEditPipelineAgency.DataTextField = "Agency_Clients_Name";
            ddlEditPipelineAgency.DataValueField = "Agency_Clients_Name";
            ddlEditPipelineAgency.DataBind();

            ddlQuotesAgency.DataSource = dtResults;
            ddlQuotesAgency.DataTextField = "Agency_Clients_Name";
            ddlQuotesAgency.DataValueField = "Agency_Clients_Name";
            ddlQuotesAgency.DataBind();

            ddlDebtAgency.DataSource = dtResults;
            ddlDebtAgency.DataTextField = "Agency_Clients_Name";
            ddlDebtAgency.DataValueField = "Agency_Clients_Name";
            ddlDebtAgency.DataBind();
        }

        private void loadCompanies()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Company_Name FROM Contacts ORDER BY Company_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstCompanies.DataSource = dtResults;
            lstCompanies.DataTextField = "Company_Name";
            lstCompanies.DataValueField = "Company_Name";
            lstCompanies.DataBind();
        }

        private void loadIndustries()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Job_Industry_Description FROM Job_Industry ORDER BY Job_Industry_Description ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlIndustry.DataSource = dtResults;
            ddlIndustry.DataTextField = "Job_Industry_Description";
            ddlIndustry.DataValueField = "Job_Industry_Description";
            ddlIndustry.DataBind();

            ddlPipelineIndustry.DataSource = dtResults;
            ddlPipelineIndustry.DataTextField = "Job_Industry_Description";
            ddlPipelineIndustry.DataValueField = "Job_Industry_Description";
            ddlPipelineIndustry.DataBind();

            ddlEditPipelineIndustry.DataSource = dtResults;
            ddlEditPipelineIndustry.DataTextField = "Job_Industry_Description";
            ddlEditPipelineIndustry.DataValueField = "Job_Industry_Description";
            ddlEditPipelineIndustry.DataBind();

            ddlQuotesIndustry.DataSource = dtResults;
            ddlQuotesIndustry.DataTextField = "Job_Industry_Description";
            ddlQuotesIndustry.DataValueField = "Job_Industry_Description";
            ddlQuotesIndustry.DataBind();

            ddlDebtIndustry.DataSource = dtResults;
            ddlDebtIndustry.DataTextField = "Job_Industry_Description";
            ddlDebtIndustry.DataValueField = "Job_Industry_Description";
            ddlDebtIndustry.DataBind();
        }

        protected void btnAddtoPIC_Click(object sender, EventArgs e)
        {
            lstCountriesAdded.Items.Add(lstCountries.SelectedValue.ToString());
        }

        protected void btnRemoveFromPIC_Click(object sender, EventArgs e)
        {
            lstCountriesAdded.Items.Remove(lstCountriesAdded.SelectedValue.ToString());
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            produce_in_sa = "";

            if (radioProdSAYes.Checked == true)
            {
                produce_in_sa = "Yes";
            }
            else if (radioProdSANo.Checked == true)
            {
                produce_in_sa = "No";
            }
            else if (radioProdSAYes.Checked == false && radioProdSANo.Checked == false)
            {
                produce_in_sa = "Not Specified";
            }

            //---------------------------------------------------------------------------------

            string countries = "";

            for (int i = 0; i < lstCountriesAdded.Items.Count; i++)
            {
                countries += lstCountriesAdded.Items[i].Value.Trim() + ",";
            }

            var pos = countries.LastIndexOf(',');
            if (pos >= 0)
                countries = countries.Substring(0, pos);

            if (countries.Equals(","))
            {
                countries = "";
            }

            if (lstCountriesAdded.Items.Count == 0)
            {
                countries = "";
            }

            //---------------------------------------------------------------------------------

            //string workTypes = "";

            //for (int i = 0; i < lstWorkTypesAdded.Items.Count; i++)
            //{
            //    workTypes += lstWorkTypesAdded.Items[i].Value.Trim() + ",";
            //}

            //var pos2 = workTypes.LastIndexOf(',');
            //if (pos2 >= 0)
            //    workTypes = workTypes.Substring(0, pos2);

            //if (workTypes.Equals(","))
            //{
            //    workTypes = "";
            //}

            //if (lstWorkTypesAdded.Items.Count == 0)
            //{
            //    workTypes = "";
            //}

            //---------------------------------------------------------------------------------

            //string agencyClients = "";

            //for (int i = 0; i < lstAgencyClientsAdded.Items.Count; i++)
            //{
            //    agencyClients += lstAgencyClientsAdded.Items[i].Value.Trim() + ",";
            //}

            //var pos3 = agencyClients.LastIndexOf(',');
            //if (pos3 >= 0)
            //    agencyClients = agencyClients.Substring(0, pos3);

            //if (agencyClients.Equals(","))
            //{
            //    agencyClients = "";
            //}

            //if (lstAgencyClientsAdded.Items.Count == 0)
            //{
            //    agencyClients = "";
            //}

            //---------------------------------------------------------------------------------

            string channel = "";

            if (radioAdAgency.Checked == true && radioCorporate.Checked == false)
            {
                channel = "Ad Agency";
            }
            else if (radioAdAgency.Checked == false && radioCorporate.Checked == true)
            {
                channel = "Corporate";
            }

            //---------------------------------------------------------------------------------



            SqlCommand cmdMyQuery0 = new SqlCommand("UPDATE Contacts SET Marketer = @Marketer, How_Lead_Sourced = @How_Lead_Sourced, " +
                                                    "Company_Name = @Company_Name, Affiliated_To = @Affiliated_To, Channel = @Channel, Industry = @Industry, " +
                                                    "Work_Types = @Work_Types, Landline = @Landline, Website = @Website, Physical_Address = @Physical_Address, " +
                                                    "Postal_Address = @Postal_Address, Ad_Agency = @Ad_Agency, Producers_Local = @Producers_Local, " +
                                                    "Producers_International = @Producers_International, Directors_Local = @Directors_Local, " +
                                                    "Directors_International = @Directors_International, " +
                                                    "Produce_In_SA = @Produce_In_SA, Produce_In_Countries = @Produce_In_Countries, " +
                                                    "Agencies_Clients = @Agencies_Clients " +
                                                    "WHERE Company_Name = '" + lstCompanies.SelectedValue.ToString() + "'");
            cmdMyQuery0.Parameters.Add("@Marketer", System.Data.SqlDbType.VarChar).Value = txtMarketer.Text;
            cmdMyQuery0.Parameters.Add("@How_Lead_Sourced", System.Data.SqlDbType.VarChar).Value = txtLeadSourced.Text;
            cmdMyQuery0.Parameters.Add("@Company_Name", System.Data.SqlDbType.VarChar).Value = txtCompany.Text;
            cmdMyQuery0.Parameters.Add("@Affiliated_To", System.Data.SqlDbType.VarChar).Value = txtAffiliatedTo.Text;
            cmdMyQuery0.Parameters.Add("@Channel", System.Data.SqlDbType.VarChar).Value = channel;
            cmdMyQuery0.Parameters.Add("@Industry", System.Data.SqlDbType.VarChar).Value = ddlIndustry.SelectedValue.ToString();
            cmdMyQuery0.Parameters.Add("@Work_Types", System.Data.SqlDbType.VarChar).Value = txtTypeOfWork.Text;
            cmdMyQuery0.Parameters.Add("@Landline", System.Data.SqlDbType.VarChar).Value = txtLandline.Text;
            cmdMyQuery0.Parameters.Add("@Website", System.Data.SqlDbType.VarChar).Value = txtWebsite.Text;
            cmdMyQuery0.Parameters.Add("@Physical_Address", System.Data.SqlDbType.VarChar).Value = txtPhysicalAddress.Text;
            cmdMyQuery0.Parameters.Add("@Postal_Address", System.Data.SqlDbType.VarChar).Value = txtPostalAddress.Text;
            
            //cmdMyQuery0.Parameters.Add("@Ad_Agency", System.Data.SqlDbType.VarChar).Value = ddlAgency.SelectedValue.ToString();
            if (radioAdAgency.Checked == true && radioCorporate.Checked == false)
            {
                cmdMyQuery0.Parameters.Add("@Ad_Agency", System.Data.SqlDbType.VarChar).Value = txtAdAgency.Text;
            }
            else if (radioCorporate.Checked == true && radioAdAgency.Checked == false)
            {
                cmdMyQuery0.Parameters.Add("@Ad_Agency", System.Data.SqlDbType.VarChar).Value = txtClients.Text;
            }
            
            cmdMyQuery0.Parameters.Add("@Producers_Local", System.Data.SqlDbType.VarChar).Value = txtProducersLocal.Text;
            cmdMyQuery0.Parameters.Add("@Producers_International", System.Data.SqlDbType.VarChar).Value = txtProducersInternational.Text;
            cmdMyQuery0.Parameters.Add("@Directors_Local", System.Data.SqlDbType.VarChar).Value = txtDirectorsLocal.Text;
            cmdMyQuery0.Parameters.Add("@Directors_International", System.Data.SqlDbType.VarChar).Value = txtDirectorsInternational.Text;
            cmdMyQuery0.Parameters.Add("@Produce_In_SA", System.Data.SqlDbType.VarChar).Value = produce_in_sa;
            cmdMyQuery0.Parameters.Add("@Produce_In_Countries", System.Data.SqlDbType.VarChar).Value = countries;
            cmdMyQuery0.Parameters.Add("@Agencies_Clients", System.Data.SqlDbType.VarChar).Value = txtAgencyClients.Text;
            int sql0 = DBUtils.ExecuteSQLCommand(cmdMyQuery0);
            lblMessageHeader.Text = "Successfully updated!";
        }

        private void loadAppointments(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Appointment_ID, Appointment_Location FROM Appointments WHERE Company_Name = '" + company + "' ORDER BY Appointment_Date ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstAppointments.DataSource = dtResults;
            lstAppointments.DataTextField = "Appointment_Location";
            lstAppointments.DataValueField = "Appointment_ID";
            lstAppointments.DataBind();
        }

        protected void radioAddAppointment_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                divAddAppointments.Visible = true;
                divEditAppointments.Visible = false;
                radioEditAppointment.Checked = false;
                divViewAppointments.Visible = false;
                radioViewAppointment.Checked = false;
                txtAppointmentDate.Text = ""; txtAppointmentTime.Text = ""; txtAppointmentDescription.Text = ""; ddlLocation.SelectedIndex = 0;
                ddlCountry.SelectedIndex = 0; ddlEmployee.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                radioAddAppointment.Checked = false;
                divAddAppointments.Visible = false;
                divEditAppointments.Visible = false;
                radioEditAppointment.Checked = false;
                divViewAppointments.Visible = false;
                radioViewAppointment.Checked = false;
                lblMessageHeader.Text = "You did not select a company to add an appointment to!";
                //Response.Write("<script type='text/javascript'>alert('You did not select a company to add an appointment to.');</script>");           
                tabPanelDefaultView.Focus();
            }
        }

        protected void radioEditAppointment_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                divAddAppointments.Visible = false;
                radioAddAppointment.Checked = false;
                divEditAppointments.Visible = true;
                divViewAppointments.Visible = false;
                radioViewAppointment.Checked = false;
                lstAppointments.Items.Clear(); txtEditAppointmentDate.Text = ""; txtEditAppointmentDescription.Text = ""; txtEditAppointmentTime.Text = "";
                ddlAppointmentLocation.SelectedIndex = 0; ddlAppointmentCountry.SelectedIndex = 0; ddlAppointmentCompany.SelectedIndex = 0; ddlAppointmentEmployee.SelectedIndex = 0;
                loadAppointments(lstCompanies.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                radioAddAppointment.Checked = false;
                divAddAppointments.Visible = false;
                radioEditAppointment.Checked = false;
                divEditAppointments.Visible = false;
                radioViewAppointment.Checked = false;
                divViewAppointments.Visible = false;
                lblMessageHeader.Text = "You did not select a company to edit its appointment!";
                tabPanelDefaultView.Focus();
            }
        }

        protected void radioViewAppointment_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                radioAddAppointment.Checked = false;
                divAddAppointments.Visible = false;
                radioEditAppointment.Checked = false;
                divEditAppointments.Visible = false;
                divViewAppointments.Visible = true;
            }
            catch (Exception ex)
            {
                radioAddAppointment.Checked = false;
                divAddAppointments.Visible = false;
                divEditAppointments.Visible = false;
                radioEditAppointment.Checked = false;
                divViewAppointments.Visible = false;
                radioViewAppointment.Checked = false;
                lblMessageHeader.Text = "You did not select a company!";
            }
        }

        protected void radioViewAppointmentReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                printAppointmentReport();
            }
            catch (Exception exce)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioViewAppointmentReport.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        private void printAppointmentReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", companyName);

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
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioViewAppointmentReportAll_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = "%";
                printAppointmentReport();
            }
            catch (Exception excep)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioViewAppointmentReportAll.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            string appointment_date = null, RmDesc = null, RmLocation = null, RmEmployee = null,
                    RmTime = null, linkStr = null, tooltip = null, RmCountry = null, RmCompany = null;

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
                    SQLcmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
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

        private void edit_appointment(int appointment_num)
        {
            SqlCommand cmdMyQuery = new SqlCommand("UPDATE Appointments SET Appointment_Date = '" + txtEditAppointmentDate.Text + "', Appointment_Time = '" + txtEditAppointmentTime.Text + "', Appointment_Description = '" + txtEditAppointmentDescription.Text + "', Appointment_Location = '" + ddlAppointmentLocation.SelectedValue.ToString() + "', Appointment_Country = '" + ddlAppointmentCountry.SelectedValue.ToString() + "' WHERE Appointment_ID = '" + appointment_num + "'");
            int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
            lblMessageHeader.Text = "Successfully updated!";
        }

        protected void btnEditAppointment_Click(object sender, EventArgs e)
        {
            edit_appointment(Convert.ToInt32(lstAppointments.SelectedValue.ToString()));
        }

        protected void btnDeleteAppointment_Click(object sender, EventArgs e)
        {
            SqlCommand cmdMyQuery = new SqlCommand("DELETE FROM Appointments WHERE Appointment_ID = '" + Convert.ToInt32(lstAppointments.SelectedValue.ToString()) + "'");
            int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
            lblMessageHeader.Text = "Successfully deleted!";
            Thread.Sleep(500);
            radioAddAppointment_CheckedChanged(null, null);
            radioAddAppointment.Checked = true;
        }

        protected void radioAddJobInPipeline_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                clearPipelineControls();
                companyName = Session["CompanyName"].ToString();
                divAddJobsInPipeline.Visible = true;
                divEditJobsInPipeline.Visible = false;
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company to add a job to the pipeline to!";
                radioAddJobInPipeline.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        protected void radioEditJobInPipeline_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                clearPipelineControls();
                companyName = Session["CompanyName"].ToString();
                divAddJobsInPipeline.Visible = false;
                divEditJobsInPipeline.Visible = true;
                loadJobsInPipeline(Session["CompanyName"].ToString());
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioEditJobInPipeline.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        protected void radioEditActiveJobInPipelineReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                printActiveJobsInPipelineReport();
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioEditActiveJobInPipelineReport.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        private void printActiveJobsInPipelineReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Job_Active", "Yes");

            cmd.CommandText = "sp_JobsInPipeline";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_JobsInPipeline");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewJobsInPipeline.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewJobsInPipelineReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioEditInactiveJobInPipeline_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                clearPipelineControls();
                companyName = Session["CompanyName"].ToString();
                divAddJobsInPipeline.Visible = false;
                divEditJobsInPipeline.Visible = true;
                loadInactiveJobsInPipeline(Session["CompanyName"].ToString());
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioEditInactiveJobInPipeline.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        protected void radioPrintPipelineReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                printJobsInPipelineReport();
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioPrintPipelineReport.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        protected void btnAddJobToPipeline_Click(object sender, EventArgs e)
        {
            getCountryID(ddlCountry.SelectedValue.ToString());
            addToPipeline(Session["CompanyName"].ToString());
        }

        private void getCountryID(string country)
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
                    string sqlQuery = "SELECT Country_ID FROM Countries WHERE Country_Name = '" + country + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        countryID = Convert.ToInt32(datatb.Rows[i]["Country_ID"].ToString());
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void addToPipeline(string companyName)
        {
            string value;

            value = txtPipelineValue.Text.Trim();
            double num = 0;

            if (double.TryParse(txtPipelineValue.Text, out num))
            {
                SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Opportunities (Employee, Agency, Opportunity_Name, Opportunity_Date, Date_Last_Contact, Date_Next_Contact, Outcome_Last_Contact, Next_Action_Required, Opportunity_Value, Company_Name, Opportunity_Stage, Country, Country_ID, Job_Industry, Rand_Amount, Naira_Amount) VALUES (@Employee, @Agency, @Opportunity_Name, @Opportunity_Date, @Date_Last_Contact, @Date_Next_Contact, @Outcome_Last_Contact, @Next_Action_Required, @Opportunity_Value, @Company_Name, @Opportunity_Stage, @Country, @Country_ID, @Job_Industry, @Rand_Amount, @Naira_Amount)");
                cmdMyQuery.Parameters.AddWithValue("@Employee", ddlPipelineEmployee.SelectedValue.ToString());
                cmdMyQuery.Parameters.AddWithValue("@Agency", ddlPipelineAgency.SelectedValue.ToString());
                cmdMyQuery.Parameters.AddWithValue("@Opportunity_Name", txtPipelineJobName.Text);
                cmdMyQuery.Parameters.AddWithValue("@Opportunity_Date", txtPipelineCalendarDate.Text);
                cmdMyQuery.Parameters.AddWithValue("@Date_Last_Contact", txtPipelineDateLastContact.Text);
                cmdMyQuery.Parameters.AddWithValue("@Date_Next_Contact", txtPipelineDateNextContact.Text);
                cmdMyQuery.Parameters.AddWithValue("@Outcome_Last_Contact", txtPipelineOutcomeLastContact.Text);
                cmdMyQuery.Parameters.AddWithValue("@Next_Action_Required", txtPipelineNextActionRequired.Text);
                cmdMyQuery.Parameters.AddWithValue("@Opportunity_Value", txtPipelineValue.Text);
                cmdMyQuery.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
                cmdMyQuery.Parameters.AddWithValue("@Opportunity_Stage", "Pipeline");
                cmdMyQuery.Parameters.AddWithValue("@Country", ddlPipelineCountry.SelectedValue.ToString());
                cmdMyQuery.Parameters.AddWithValue("@Country_ID", countryID);
                cmdMyQuery.Parameters.AddWithValue("@Job_Industry", ddlPipelineIndustry.SelectedValue.ToString());
                cmdMyQuery.Parameters.AddWithValue("@Rand_Amount", 0);
                cmdMyQuery.Parameters.AddWithValue("@Naira_Amount", 0);
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully Added!";
            }
            else
            {
                lblMessageHeader.Text = "Please enter a number for the value!";
                txtPipelineValue.Text = "";
                txtPipelineValue.Focus();
            }
        }

        private void loadInactiveJobsInPipeline(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + company + "' AND Opportunity_Stage = 'Pipeline' AND Job_Active IS NULL ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstPipelineOpportunities.DataSource = dtResults;
            lstPipelineOpportunities.DataTextField = "Opportunity_Name";
            lstPipelineOpportunities.DataValueField = "Opportunities_ID";
            lstPipelineOpportunities.DataBind();
        }

        private void loadJobsInPipeline(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + company + "' AND Opportunity_Stage = 'Pipeline' AND Job_Active = 'Yes' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstPipelineOpportunities.DataSource = dtResults;
            lstPipelineOpportunities.DataTextField = "Opportunity_Name";
            lstPipelineOpportunities.DataValueField = "Opportunities_ID";
            lstPipelineOpportunities.DataBind();
        }

        protected void lstPipelineOpportunities_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadPipelineDetails(Convert.ToInt32(lstPipelineOpportunities.SelectedValue.ToString()));
        }

        private void loadPipelineDetails(int opportunity_id)
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
                        string jobSuccessful = datatb.Rows[i]["Successful"].ToString();

                        //if (jobSuccessful.Equals("Yes"))
                        //{
                        //    radioJobSuccessfulYes.Checked = true;
                        //    radioJobSuccessfulNo.Checked = false;
                        //}
                        //else if (jobSuccessful.Equals("No"))
                        //{
                        //    radioJobSuccessfulNo.Checked = true;
                        //    radioJobSuccessfulYes.Checked = false;
                        //}
                        //else
                        //{
                        //    radioJobSuccessfulYes.Checked = false;
                        //    radioJobSuccessfulNo.Checked = false;
                        //}

                        if (jobActive.Equals("Yes"))
                        {
                            radioJobActiveYes.Checked = true;
                            radioJobActiveNo.Checked = false;
                            radioJobActiveNotSet.Checked = false;
                        }
                        else if (jobActive.Equals("No"))
                        {
                            radioJobActiveNo.Checked = true;
                            radioJobActiveYes.Checked = false;
                            radioJobActiveNotSet.Checked = false;
                        }
                        else if (jobActive == DBNull.Value.ToString())
                        {
                            radioJobActiveNotSet.Checked = true;
                            radioJobActiveYes.Checked = false;
                            radioJobActiveNo.Checked = false;
                        }

                        for (int j = 0; j < ddlEditPipelineEmployee.Items.Count; j++)
                        {
                            if (employee.Equals(ddlEditPipelineEmployee.Items[j].Value))
                            {
                                ddlEditPipelineEmployee.SelectedValue = employee;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlEditPipelineAgency.Items.Count; j++)
                        {
                            if (agency.Equals(ddlEditPipelineAgency.Items[j].Value))
                            {
                                ddlEditPipelineAgency.SelectedValue = agency;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlEditPipelineCountry.Items.Count; j++)
                        {
                            if (country.Equals(ddlEditPipelineCountry.Items[j].Value))
                            {
                                ddlEditPipelineCountry.SelectedValue = country;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlEditPipelineIndustry.Items.Count; j++)
                        {
                            if (jobIndustry.Equals(ddlEditPipelineIndustry.Items[j].Value))
                            {
                                ddlEditPipelineIndustry.SelectedValue = jobIndustry;
                                break;
                            }
                        }

                        txtEditPipelineJobName.Text = opportunityName;
                        txtEditPipelineCalendarDate.Text = opportunityDate;
                        txtEditPipelineDateLastContact.Text = dateLastContact;
                        txtEditPipelineDateNextContact.Text = dateNextContact;
                        txtEditPipelineOutcomeLastContact.Text = outcomeLastContact;
                        txtEditPipelineNextActionRequired.Text = nextActionRequired;
                        txtEditPipelineValue.Text = "" + value;
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception exc) { Response.Write(exc.Message); }
        }

        private void printJobsInPipelineReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());

            cmd.CommandText = "sp_JobsInPipelineAll";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_JobsInPipelineAll");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewAllJobsInPipeline.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewAllJobsInPipelineReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioMoveToQuoteYes_CheckedChanged(object sender, EventArgs e)
        {
            radioJobActiveYes.Checked = true;
            radioJobActiveNo.Checked = false;
        }

        protected void radioMoveToQuoteNo_CheckedChanged(object sender, EventArgs e)
        {
            radioJobActiveNo.Checked = true;
            radioJobActiveYes.Checked = false;
            radioJobActiveNotSet.Checked = false;
        }

        protected void btnEditPipeline_Click(object sender, EventArgs e)
        {
            getCountryID(ddlEditPipelineCountry.SelectedValue.ToString());

            string jobActive = "";

            if (radioJobActiveYes.Checked == true && radioJobActiveNo.Checked == false && radioJobActiveNotSet.Checked == false)
            {
                jobActive = "Yes";
            }
            else if (radioJobActiveNo.Checked == true && radioJobActiveYes.Checked == false && radioJobActiveNotSet.Checked == false)
            {
                jobActive = "No";
            }
            else if(radioJobActiveYes.Checked==false && radioJobActiveNo.Checked==false && radioJobActiveNotSet.Checked==true)
            {
                jobActive = DBNull.Value.ToString();
            }

            //---------------------------------------------------------------------------------

            //string successful = "";

            //if (radioJobSuccessfulYes.Checked == true && radioJobSuccessfulNo.Checked == false)
            //{
            //    successful = "Yes";
            //}
            //else if(radioJobSuccessfulNo.Checked == true && radioJobSuccessfulYes.Checked == false)
            //{
            //    successful = "No";
            //}

            //if (jobActive.Equals("No"))
            //{
            //    successful = "No";
            //}
            //else if (jobActive.Equals("Yes"))
            //{
            //    successful = "Yes";
            //}
            //else
            //{
            //    successful = DBNull.Value.ToString();
            //}

            //---------------------------------------------------------------------------------

            string value;
            value = txtEditPipelineValue.Text.Trim();
            double num = 0;

            if (double.TryParse(txtEditPipelineValue.Text, out num))
            {
                if (radioMoveToQuoteYes.Checked == true && radioMoveToQuoteNo.Checked == false)
                {
                    if (jobActive.Equals("Yes"))
                    {
                        SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Last_Updated_By = @Last_Updated_By, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Opportunity_Value = @Opportunity_Value, Opportunity_Stage = @Opportunity_Stage, Country = @Country, Country_ID = @Country_ID, Job_Industry = @Job_Industry, Job_Active = @Job_Active WHERE Opportunities_ID = '" + Convert.ToInt32(lstPipelineOpportunities.SelectedValue.ToString()) + "'");
                        cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                        cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineEmployee.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineAgency.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtEditPipelineJobName.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtEditPipelineCalendarDate.Text;
                        cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateNextContact.Text;
                        cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineOutcomeLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtEditPipelineNextActionRequired.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Value", System.Data.SqlDbType.VarChar).Value = Convert.ToDouble(txtEditPipelineValue.Text);
                        cmdMyQuery.Parameters.Add("@Opportunity_Stage", System.Data.SqlDbType.VarChar).Value = "Quote";
                        cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineCountry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Country_ID", System.Data.SqlDbType.VarChar).Value = countryID;
                        cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineIndustry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "Yes";
                        //cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = null;
                        int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                        lblMessageHeader.Text = "Successfully updated and moved to Quote!";
                    }
                    else if (jobActive == DBNull.Value.ToString())
                    {
                        SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Last_Updated_By = @Last_Updated_By, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Opportunity_Value = @Opportunity_Value, Opportunity_Stage = @Opportunity_Stage, Country = @Country, Country_ID = @Country_ID, Job_Industry = @Job_Industry, Job_Active = @Job_Active WHERE Opportunities_ID = '" + Convert.ToInt32(lstPipelineOpportunities.SelectedValue.ToString()) + "'");
                        cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                        cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineEmployee.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineAgency.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtEditPipelineJobName.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtEditPipelineCalendarDate.Text;
                        cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateNextContact.Text;
                        cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineOutcomeLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtEditPipelineNextActionRequired.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Value", System.Data.SqlDbType.VarChar).Value = Convert.ToDouble(txtEditPipelineValue.Text);
                        cmdMyQuery.Parameters.Add("@Opportunity_Stage", System.Data.SqlDbType.VarChar).Value = "Quote";
                        cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineCountry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Country_ID", System.Data.SqlDbType.VarChar).Value = countryID;
                        cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineIndustry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "Yes";
                        //cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = null;
                        int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                        lblMessageHeader.Text = "Successfully updated and moved to Quote!";
                    }
                }
                else if (radioMoveToQuoteNo.Checked == true && radioMoveToQuoteYes.Checked == false)
                {
                    if (jobActive.Equals("No"))
                    {
                        SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Last_Updated_By = @Last_Updated_By, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Opportunity_Value = @Opportunity_Value, Country = @Country, Country_ID = @Country_ID, Job_Industry = @Job_Industry, Job_Active = @Job_Active, Successful = @Successful WHERE Opportunities_ID = '" + Convert.ToInt32(lstPipelineOpportunities.SelectedValue.ToString()) + "'");
                        cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                        cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineEmployee.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineAgency.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtEditPipelineJobName.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtEditPipelineCalendarDate.Text;
                        cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateNextContact.Text;
                        cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineOutcomeLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtEditPipelineNextActionRequired.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Value", System.Data.SqlDbType.VarChar).Value = Convert.ToDouble(txtEditPipelineValue.Text);
                        cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineCountry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Country_ID", System.Data.SqlDbType.VarChar).Value = countryID;
                        cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineIndustry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "No";
                        cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = "No";
                        int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                        lblMessageHeader.Text = "Successfully updated!";
                    }
                    if (jobActive == DBNull.Value.ToString())
                    {
                        SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Last_Updated_By = @Last_Updated_By, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Opportunity_Value = @Opportunity_Value, Country = @Country, Country_ID = @Country_ID, Job_Industry = @Job_Industry, Job_Active = @Job_Active, Successful = @Successful WHERE Opportunities_ID = '" + Convert.ToInt32(lstPipelineOpportunities.SelectedValue.ToString()) + "'");
                        cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                        cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineEmployee.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineAgency.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtEditPipelineJobName.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtEditPipelineCalendarDate.Text;
                        cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateNextContact.Text;
                        cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineOutcomeLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtEditPipelineNextActionRequired.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Value", System.Data.SqlDbType.VarChar).Value = Convert.ToDouble(txtEditPipelineValue.Text);
                        cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineCountry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Country_ID", System.Data.SqlDbType.VarChar).Value = countryID;
                        cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineIndustry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "No";
                        cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = "No";
                        int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                        lblMessageHeader.Text = "Successfully updated!";
                    }
                }
                else if (radioMoveToQuoteNo.Checked == false && radioMoveToQuoteYes.Checked == false)
                {
                    if (jobActive.Equals("Yes"))
                    {
                        SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Last_Updated_By = @Last_Updated_By, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Opportunity_Value = @Opportunity_Value, Country = @Country, Country_ID = @Country_ID, Job_Industry = @Job_Industry, Job_Active = @Job_Active, Successful = @Successful WHERE Opportunities_ID = '" + Convert.ToInt32(lstPipelineOpportunities.SelectedValue.ToString()) + "'");
                        cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                        cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineEmployee.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineAgency.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtEditPipelineJobName.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtEditPipelineCalendarDate.Text;
                        cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateNextContact.Text;
                        cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineOutcomeLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtEditPipelineNextActionRequired.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Value", System.Data.SqlDbType.VarChar).Value = Convert.ToDouble(txtEditPipelineValue.Text);
                        //cmdMyQuery.Parameters.Add("@Opportunity_Stage", System.Data.SqlDbType.VarChar).Value = "Quote";
                        cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineCountry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Country_ID", System.Data.SqlDbType.VarChar).Value = countryID;
                        cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineIndustry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "Yes";
                        cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = DBNull.Value;
                        int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                        lblMessageHeader.Text = "Successfully updated!";
                    }
                    else if (jobActive.Equals("No"))
                    {
                        SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Last_Updated_By = @Last_Updated_By, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Opportunity_Value = @Opportunity_Value, Country = @Country, Country_ID = @Country_ID, Job_Industry = @Job_Industry, Job_Active = @Job_Active, Successful = @Successful WHERE Opportunities_ID = '" + Convert.ToInt32(lstPipelineOpportunities.SelectedValue.ToString()) + "'");
                        cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                        cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineEmployee.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineAgency.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtEditPipelineJobName.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtEditPipelineCalendarDate.Text;
                        cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateNextContact.Text;
                        cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineOutcomeLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtEditPipelineNextActionRequired.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Value", System.Data.SqlDbType.VarChar).Value = Convert.ToDouble(txtEditPipelineValue.Text);
                        cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineCountry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Country_ID", System.Data.SqlDbType.VarChar).Value = countryID;
                        cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineIndustry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "No";
                        cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = "No";
                        int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                        lblMessageHeader.Text = "Successfully updated!";
                    }
                    else if (jobActive == DBNull.Value.ToString())
                    {
                        SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Last_Updated_By = @Last_Updated_By, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Opportunity_Value = @Opportunity_Value, Country = @Country, Country_ID = @Country_ID, Job_Industry = @Job_Industry WHERE Opportunities_ID = '" + Convert.ToInt32(lstPipelineOpportunities.SelectedValue.ToString()) + "'");
                        cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                        cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineEmployee.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineAgency.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtEditPipelineJobName.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtEditPipelineCalendarDate.Text;
                        cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineDateNextContact.Text;
                        cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtEditPipelineOutcomeLastContact.Text;
                        cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtEditPipelineNextActionRequired.Text;
                        cmdMyQuery.Parameters.Add("@Opportunity_Value", System.Data.SqlDbType.VarChar).Value = Convert.ToDouble(txtEditPipelineValue.Text);
                        cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineCountry.SelectedValue.ToString();
                        cmdMyQuery.Parameters.Add("@Country_ID", System.Data.SqlDbType.VarChar).Value = countryID;
                        cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlEditPipelineIndustry.SelectedValue.ToString();
                        //cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "No";
                        //cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = "No";
                        int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                        lblMessageHeader.Text = "Successfully updated!";
                    }
                }
            }
            else
            {
                lblMessageHeader.Text = "Please enter a number for the value!";
                txtEditPipelineValue.Focus();
            }
        }

        private void loadQuotes(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + company + "' AND Opportunity_Stage = 'Quote' AND Job_Active = 'Yes' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstQuotes.DataSource = dtResults;
            lstQuotes.DataTextField = "Opportunity_Name";
            lstQuotes.DataValueField = "Opportunities_ID";
            lstQuotes.DataBind();
        }

        protected void radioQuotesView_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                clearQuoteControls();
                divQuotes.Visible = true;
                loadQuotes(Session["CompanyName"].ToString());
            }
            catch (Exception exc)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioQuotesView.Checked = false;
            }
        }

        protected void radioQuotesViewInactive_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                clearQuoteControls();
                divQuotes.Visible = true;
                loadInactiveQuotes(Session["CompanyName"].ToString());
            }
            catch (Exception exc)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioQuotesViewInactive.Checked = false;
            }
        }

        private void loadInactiveQuotes(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + company + "' AND Opportunity_Stage = 'Quote' AND Job_Active = 'No' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstQuotes.DataSource = dtResults;
            lstQuotes.DataTextField = "Opportunity_Name";
            lstQuotes.DataValueField = "Opportunities_ID";
            lstQuotes.DataBind();
        }

        protected void radioQuotesViewReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                printQuoteReport();
            }
            catch (Exception exception)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioQuotesViewReport.Checked = false;
            }
        }

        private void printQuoteReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Job_Active", "Yes");

            cmd.CommandText = "sp_Quotes";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_Quotes");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewQuotes.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewQuotesReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioQuotesViewInactiveReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                printInactiveQuoteReport();
            }
            catch (Exception exception)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioQuotesViewReport.Checked = false;
            }
        }

        private void printInactiveQuoteReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Job_Active", "No");

            cmd.CommandText = "sp_Quotes";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_Quotes");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewInactiveQuotes.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewInactiveQuotesReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioMoveToDebtYes_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void radioMoveToDebtNo_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void radioHighlyLikely_CheckedChanged(object sender, EventArgs e)
        {
            likelihood = "highlylikely";
        }

        protected void radioLikely_CheckedChanged(object sender, EventArgs e)
        {
            likelihood = "likely";
        }

        protected void radioLessLikely_CheckedChanged(object sender, EventArgs e)
        {
            likelihood = "lesslikely";
        }

        protected void radioInThePipeline_CheckedChanged(object sender, EventArgs e)
        {
            likelihood = "inthepipeline";
        }

        protected void lstQuotes_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadQuoteDetails(Convert.ToInt32(lstQuotes.SelectedValue.ToString()));
        }

        private void clearQuoteControls()
        {
            ddlQuotesEmployee.SelectedIndex = 0; ddlQuotesAgency.SelectedIndex = 0; txtQuotesCalendarDate.Text = ""; txtQuotesCampaign.Text = "";
            txtQuotesDateLastContact.Text = ""; txtQuotesDateNextContact.Text = ""; txtQuotesJobName.Text = ""; txtQuotesNextActionRequired.Text = "";
            txtQuotesOutcomeLastContact.Text = ""; txtQuotesStatus.Text = ""; txtQuotesValue.Text = ""; radioHighlyLikely.Checked = false; radioInThePipeline.Checked = false;
            radioLessLikely.Checked = false; radioLikely.Checked = false;
        }

        private void loadQuoteDetails(int opportunity_id)
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
                        string quoteStatus = datatb.Rows[i]["Quote_Status"].ToString();
                        string quotesCampaign = datatb.Rows[i]["Quote_Campaign"].ToString();
                        string quotesLikelihood = datatb.Rows[i]["Quote_Likelihood"].ToString();
                        double value = Convert.ToDouble(datatb.Rows[i]["Opportunity_Value"].ToString());
                        string country = datatb.Rows[i]["Country"].ToString();
                        string job_industry = datatb.Rows[i]["Job_Industry"].ToString();

                        for (int j = 0; j < ddlQuotesEmployee.Items.Count; j++)
                        {
                            if (employee.Equals(ddlQuotesEmployee.Items[j].Value))
                            {
                                ddlQuotesEmployee.SelectedValue = employee;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlQuotesAgency.Items.Count; j++)
                        {
                            if (agency.Equals(ddlQuotesAgency.Items[j].Value))
                            {
                                ddlQuotesAgency.SelectedValue = agency;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlQuotesCountry.Items.Count; j++)
                        {
                            if (country.Equals(ddlQuotesCountry.Items[j].Value))
                            {
                                ddlQuotesCountry.SelectedValue = country;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlQuotesIndustry.Items.Count; j++)
                        {
                            if (job_industry.Equals(ddlQuotesIndustry.Items[j].Value))
                            {
                                ddlQuotesIndustry.SelectedValue = job_industry;
                                break;
                            }
                        }

                        txtQuotesJobName.Text = opportunityName;
                        txtQuotesCalendarDate.Text = opportunityDate;
                        txtQuotesDateLastContact.Text = dateLastContact;
                        txtQuotesDateNextContact.Text = dateNextContact;
                        txtQuotesOutcomeLastContact.Text = outcomeLastContact;
                        txtQuotesNextActionRequired.Text = nextActionRequired;
                        txtQuotesValue.Text = "" + value;
                        txtQuotesCampaign.Text = quotesCampaign;
                        txtQuotesStatus.Text = quoteStatus;

                        if (quotesLikelihood.Equals("highlylikely"))
                        {
                            radioHighlyLikely.Checked = true;
                            radioLikely.Checked = false;
                            radioLessLikely.Checked = false;
                            radioInThePipeline.Checked = false;
                        }
                        else if (quotesLikelihood.Equals("likely"))
                        {
                            radioHighlyLikely.Checked = false;
                            radioLikely.Checked = true;
                            radioLessLikely.Checked = false;
                            radioInThePipeline.Checked = false;
                        }
                        else if (quotesLikelihood.Equals("lesslikely"))
                        {
                            radioHighlyLikely.Checked = false;
                            radioLikely.Checked = false;
                            radioLessLikely.Checked = true;
                            radioInThePipeline.Checked = false;
                        }
                        else if (quotesLikelihood.Equals("inthepipeline"))
                        {
                            radioHighlyLikely.Checked = false;
                            radioLikely.Checked = false;
                            radioLessLikely.Checked = false;
                            radioInThePipeline.Checked = true;
                        }
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception exc) { Response.Write(exc.Message); }
        }

        protected void btnEditQuotes_Click(object sender, EventArgs e)
        {
            saveQuote(Convert.ToInt32(lstQuotes.SelectedValue.ToString()));
        }

        private void saveQuote(int opportunity_id)
        {
            if (radioHighlyLikely.Checked == true)
            {
                likelihood = "highlylikely";
            }
            if (radioInThePipeline.Checked == true)
            {
                likelihood = "inthepipeline";
            }
            if (radioLessLikely.Checked == true)
            {
                likelihood = "lesslikely";
            }
            if (radioLikely.Checked == true)
            {
                likelihood = "likely";
            }

            if (radioMoveToDebtYes.Checked == true && radioMoveToDebtNo.Checked == false)
            {
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Opportunity_Stage = @Opportunity_Stage, Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Quote_Campaign = @Quote_Campaign, Quote_Status = @Quote_Status, Quote_Likelihood = @Quote_Likelihood, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Last_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Last_Updated_By = @Last_Updated_By, Country = @Country, Job_Industry = @Job_Industry, Job_Active = @Job_Active, Successful = @Successful WHERE Opportunities_ID = '" + Convert.ToInt32(lstQuotes.SelectedValue.ToString()) + "'");
                cmdMyQuery.Parameters.Add("@Opportunity_Stage", System.Data.SqlDbType.VarChar).Value = "Debt";
                cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlQuotesEmployee.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlQuotesAgency.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtQuotesJobName.Text;
                cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtQuotesCalendarDate.Text;
                cmdMyQuery.Parameters.Add("@Quote_Campaign", System.Data.SqlDbType.VarChar).Value = txtQuotesCampaign.Text;
                cmdMyQuery.Parameters.Add("@Quote_Status", System.Data.SqlDbType.VarChar).Value = txtQuotesStatus.Text;
                cmdMyQuery.Parameters.Add("@Quote_Likelihood", System.Data.SqlDbType.VarChar).Value = likelihood;
                cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesDateLastContact.Text;
                cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesDateNextContact.Text;
                cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesOutcomeLastContact.Text;
                cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtQuotesNextActionRequired.Text;
                cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlQuotesCountry.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlQuotesIndustry.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "Yes";
                cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = DBNull.Value;
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated and moved to Debt Collection!";
            }
            else if (radioMoveToDebtNo.Checked == true && radioMoveToDebtYes.Checked == false)
            {
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Quote_Campaign = @Quote_Campaign, Quote_Status = @Quote_Status, Quote_Likelihood = @Quote_Likelihood, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Last_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Last_Updated_By = @Last_Updated_By, Country = @Country, Job_Industry = @Job_Industry, Job_Active = @Job_Active, Successful = @Successful WHERE Opportunities_ID = '" + Convert.ToInt32(lstQuotes.SelectedValue.ToString()) + "'");
                cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlQuotesEmployee.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlQuotesAgency.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtQuotesJobName.Text;
                cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtQuotesCalendarDate.Text;
                cmdMyQuery.Parameters.Add("@Quote_Campaign", System.Data.SqlDbType.VarChar).Value = txtQuotesCampaign.Text;
                cmdMyQuery.Parameters.Add("@Quote_Status", System.Data.SqlDbType.VarChar).Value = txtQuotesStatus.Text;
                cmdMyQuery.Parameters.Add("@Quote_Likelihood", System.Data.SqlDbType.VarChar).Value = likelihood;
                cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesDateLastContact.Text;
                cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesDateNextContact.Text;
                cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesOutcomeLastContact.Text;
                cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtQuotesNextActionRequired.Text;
                cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlQuotesCountry.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlQuotesIndustry.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "No";
                cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = "No";
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated!";
            }
            else if (radioMoveToDebtYes.Checked == false && radioMoveToDebtNo.Checked == false)
            {
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Quote_Campaign = @Quote_Campaign, Quote_Status = @Quote_Status, Quote_Likelihood = @Quote_Likelihood, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Last_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Last_Updated_By = @Last_Updated_By, Country = @Country, Job_Industry = @Job_Industry WHERE Opportunities_ID = '" + Convert.ToInt32(lstQuotes.SelectedValue.ToString()) + "'");
                cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlQuotesEmployee.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlQuotesAgency.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtQuotesJobName.Text;
                cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtQuotesCalendarDate.Text;
                cmdMyQuery.Parameters.Add("@Quote_Campaign", System.Data.SqlDbType.VarChar).Value = txtQuotesCampaign.Text;
                cmdMyQuery.Parameters.Add("@Quote_Status", System.Data.SqlDbType.VarChar).Value = txtQuotesStatus.Text;
                cmdMyQuery.Parameters.Add("@Quote_Likelihood", System.Data.SqlDbType.VarChar).Value = likelihood;
                cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesDateLastContact.Text;
                cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesDateNextContact.Text;
                cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtQuotesOutcomeLastContact.Text;
                cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtQuotesNextActionRequired.Text;
                cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
                cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlQuotesCountry.SelectedValue.ToString();
                cmdMyQuery.Parameters.Add("@Job_Industry", System.Data.SqlDbType.VarChar).Value = ddlQuotesIndustry.SelectedValue.ToString();
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated!";
            }
        }

        private void clearDebtControls()
        {
            ddlDebtEmployee.SelectedIndex = 0; ddlDebtAgency.SelectedIndex = 0; ddlDebtCountry.SelectedIndex = 0; ddlDebtIndustry.SelectedIndex = 0;
            txtDebtCalendarDate.Text = ""; txtDebtCampaign.Text = ""; txtDebtJobName.Text = ""; txtDebtCalendarDate.Text = ""; txtDebtCampaign.Text = "";
            txtDebtStatus.Text = ""; txtDebtRandAmount.Text = ""; txtDebtNairaAmount.Text = ""; txtDebtValue.Text = ""; radioDebtPaidNo.Checked = false;
            radioDebtPaidYes.Checked = false; txtDebtComments.Text = "";
            //radioDebtJobActiveNo.Checked = false; radioDebtJobActiveYes.Checked = false;
        }

        protected void radioDebtView_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                divDebt.Visible = true;
                btnSaveDebt.Visible = true;
                clearDebtControls();
                loadDebt(Session["CompanyName"].ToString());
            }
            catch (Exception exception)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtView.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        private void loadDebt(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + company + "' AND Opportunity_Stage = 'Debt' AND Job_Active = 'Yes' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstDebt.DataSource = dtResults;
            lstDebt.DataTextField = "Opportunity_Name";
            lstDebt.DataValueField = "Opportunities_ID";
            lstDebt.DataBind();
        }

        private void loadDebtPaidYes(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + company + "' AND Opportunity_Stage = 'Debt' AND Paid = 'Yes' AND Job_Active = 'Yes' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstDebt.DataSource = dtResults;
            lstDebt.DataTextField = "Opportunity_Name";
            lstDebt.DataValueField = "Opportunities_ID";
            lstDebt.DataBind();
        }

        private void loadDebtPaidNo(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + company + "' AND Job_Active = 'Yes' AND Paid = 'No' OR Paid IS NULL AND Opportunity_Stage = 'Debt' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstDebt.DataSource = dtResults;
            lstDebt.DataTextField = "Opportunity_Name";
            lstDebt.DataValueField = "Opportunities_ID";
            lstDebt.DataBind();
        }

        private void loadDebtDetails(int opportunity_id)
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
                        string quoteStatus = datatb.Rows[i]["Quote_Status"].ToString();
                        string quotesCampaign = datatb.Rows[i]["Quote_Campaign"].ToString();
                        double value = Convert.ToDouble(datatb.Rows[i]["Opportunity_Value"].ToString());
                        string country = datatb.Rows[i]["Country"].ToString();
                        string job_industry = datatb.Rows[i]["Job_Industry"].ToString();
                        Int64 randAmount = Convert.ToInt64(datatb.Rows[i]["Rand_Amount"].ToString());
                        Int64 nairaAmount = Convert.ToInt64(datatb.Rows[i]["Naira_Amount"].ToString());
                        string paid = datatb.Rows[i]["Paid"].ToString();
                        string debtComments = datatb.Rows[i]["Quote_Comments"].ToString();
                        string jobACtive = datatb.Rows[i]["Job_Active"].ToString();

                        //if (jobACtive.Equals("Yes"))
                        //{
                        //    radioDebtJobActiveYes.Checked = true;
                        //    radioDebtJobActiveNo.Checked = false;
                        //}
                        //else
                        //{
                        //    radioDebtJobActiveYes.Checked = false;
                        //    radioDebtJobActiveNo.Checked = true;
                        //}

                        if (paid.Equals("Yes"))
                        {
                            radioDebtPaidYes.Checked = true;
                            radioDebtPaidNo.Checked = false;
                        }
                        else
                        {
                            radioDebtPaidNo.Checked = true;
                            radioDebtPaidYes.Checked = false;
                        }

                        for (int j = 0; j < ddlDebtEmployee.Items.Count; j++)
                        {
                            if (employee.Equals(ddlDebtEmployee.Items[j].Value))
                            {
                                ddlDebtEmployee.SelectedValue = employee;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlDebtAgency.Items.Count; j++)
                        {
                            if (agency.Equals(ddlDebtAgency.Items[j].Value))
                            {
                                ddlDebtAgency.SelectedValue = agency;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlDebtCountry.Items.Count; j++)
                        {
                            if (country.Equals(ddlDebtCountry.Items[j].Value))
                            {
                                ddlDebtCountry.SelectedValue = country;
                                break;
                            }
                        }

                        for (int j = 0; j < ddlDebtIndustry.Items.Count; j++)
                        {
                            if (job_industry.Equals(ddlDebtIndustry.Items[j].Value))
                            {
                                ddlDebtIndustry.SelectedValue = job_industry;
                                break;
                            }
                        }

                        txtDebtComments.Text = debtComments;
                        txtDebtJobName.Text = opportunityName;
                        txtDebtCalendarDate.Text = opportunityDate;
                        txtDebtValue.Text = "" + value;
                        txtDebtCampaign.Text = quotesCampaign;
                        txtDebtStatus.Text = quoteStatus;
                        txtDebtRandAmount.Text = "" + randAmount;
                        txtDebtNairaAmount.Text = "" + nairaAmount;
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception exc) { Response.Write(exc.Message); }
        }

        private void loadDebtCompleted(string companyName)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + companyName + "' AND Opportunity_Stage = 'Debt' AND Successful = 'Yes' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstDebt.DataSource = dtResults;
            lstDebt.DataTextField = "Opportunity_Name";
            lstDebt.DataValueField = "Opportunities_ID";
            lstDebt.DataBind();
        }

        protected void radioDebtViewPaid_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                divDebt.Visible = true;
                btnSaveDebt.Visible = true;
                clearDebtControls();
                loadDebtPaidYes(Session["CompanyName"].ToString());
            }
            catch (Exception exception)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtView.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        protected void radioDebtViewUnpaid_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                divDebt.Visible = true;
                btnSaveDebt.Visible = true;
                clearDebtControls();
                loadDebtPaidNo(Session["CompanyName"].ToString());
            }
            catch (Exception exception)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtView.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        protected void radioDebtViewCompleted_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                divDebt.Visible = true;
                clearDebtControls();
                loadDebtCompleted(Session["CompanyName"].ToString());
                btnSaveDebt.Visible = false;
            }
            catch (Exception except)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtViewCompleted.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        protected void radioDebtViewReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                btnSaveDebt.Visible = true;
                companyName = Session["CompanyName"].ToString();
                printDebtReport();
            }
            catch (Exception exception)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtViewReport.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        //protected void radioDebtViewInactiveReport_CheckedChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        btnSaveDebt.Visible = true;
        //        companyName = Session["CompanyName"].ToString();
        //        printInactiveDebtReport();
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMessageHeader.Text = "You did not select a company!";
        //        radioDebtViewInactiveReport.Checked = false;
        //        btnSaveDebt.Visible = true;
        //    }
        //}

        private void printDebtReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Job_Active", "Yes");

            cmd.CommandText = "sp_Debt";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_Debt");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewDebt.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewDebtReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        private void printInactiveDebtReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Job_Active", "No");

            cmd.CommandText = "sp_Debt";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_Debt");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewDebt.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewDebtReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void lstDebt_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadDebtDetails(Convert.ToInt32(lstDebt.SelectedValue.ToString()));
        }

        protected void btnSaveDebt_Click(object sender, EventArgs e)
        {
            saveDebt();
        }

        private void saveDebt()
        {
            string paid = "";
            string jobSuccessful = "";

            if (radioDebtPaidYes.Checked == true && radioDebtPaidNo.Checked == false)
            {
                paid = "Yes";
            }
            else
            {
                paid = "No";
            }

            if (radioDebtJobSuccessfulYes.Checked == true && radioDebtJobSuccessfulNo.Checked == false)
            {
                jobSuccessful = "Yes";
            }
            else if (radioDebtJobSuccessfulYes.Checked == false && radioDebtJobSuccessfulNo.Checked == true)
            {
                jobSuccessful = "No";
            }
            else if (radioDebtJobSuccessfulYes.Checked == false && radioDebtJobSuccessfulNo.Checked == false)
            {
                jobSuccessful = null;
            }

            //if (radioDebtJobActiveYes.Checked == true && radioDebtJobActiveNo.Checked == false)
            //{
            //    job_active = "Yes";
            //}
            //else
            //{
            //    job_active = "No";
            //}

            //if (radioDebtJobActiveYes.Checked == true && radioDebtJobActiveNo.Checked == false)
            //{
            //    jobSuccessful = "Yes";
            //}
            //else if (radioDebtJobActiveNo.Checked == true && radioDebtJobActiveYes.Checked == false)
            //{
            //    jobSuccessful = "No";
            //}
            //else
            //{
            //    jobSuccessful = null;
            //}

            SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Employee = @Employee, Agency = @Agency, Opportunity_Name = @Opportunity_Name, Opportunity_Date = @Opportunity_Date, Quote_Campaign = @Quote_Campaign, Quote_Status = @Quote_Status, Last_Updated_By = @Last_Updated_By, Country = @Country, Job_Industry = @Job_Industry, Rand_Amount = @Rand_Amount, Naira_Amount = @Naira_Amount, Paid = @Paid, Quote_Comments = @Quote_Comments, Job_Active = @Job_Active, Successful = @Successful WHERE Opportunities_ID = '" + Convert.ToInt32(lstDebt.SelectedValue.ToString()) + "'");
            cmdMyQuery.Parameters.Add("@Employee", System.Data.SqlDbType.VarChar).Value = ddlDebtEmployee.SelectedValue.ToString();
            cmdMyQuery.Parameters.Add("@Agency", System.Data.SqlDbType.VarChar).Value = ddlDebtAgency.SelectedValue.ToString();
            cmdMyQuery.Parameters.Add("@Opportunity_Name", System.Data.SqlDbType.VarChar).Value = txtDebtJobName.Text;
            cmdMyQuery.Parameters.Add("@Opportunity_Date", System.Data.SqlDbType.VarChar).Value = txtDebtCalendarDate.Text;
            cmdMyQuery.Parameters.Add("@Quote_Campaign", System.Data.SqlDbType.VarChar).Value = txtDebtCampaign.Text;
            cmdMyQuery.Parameters.Add("@Quote_Status", System.Data.SqlDbType.VarChar).Value = txtDebtStatus.Text;
            cmdMyQuery.Parameters.Add("@Last_Updated_By", System.Data.SqlDbType.VarChar).Value = Session["currentUser"].ToString();
            cmdMyQuery.Parameters.Add("@Country", System.Data.SqlDbType.VarChar).Value = ddlDebtCountry.SelectedValue.ToString();
            cmdMyQuery.Parameters.Add("@Job_industry", System.Data.SqlDbType.VarChar).Value = ddlDebtIndustry.SelectedValue.ToString();
            cmdMyQuery.Parameters.Add("@Rand_Amount", System.Data.SqlDbType.BigInt).Value = Convert.ToInt64(txtDebtRandAmount.Text);
            cmdMyQuery.Parameters.Add("@Naira_Amount", System.Data.SqlDbType.BigInt).Value = Convert.ToInt64(txtDebtNairaAmount.Text);
            cmdMyQuery.Parameters.Add("@Paid", System.Data.SqlDbType.VarChar).Value = paid;
            cmdMyQuery.Parameters.Add("@Quote_Comments", System.Data.SqlDbType.VarChar).Value = txtDebtComments.Text;

            if (jobSuccessful.Equals("Yes") || jobSuccessful.Equals("No"))
            {
                cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = "No";
            }
            else
            {
                cmdMyQuery.Parameters.Add("@Job_Active", System.Data.SqlDbType.VarChar).Value = null;
            }

            cmdMyQuery.Parameters.Add("@Successful", System.Data.SqlDbType.VarChar).Value = jobSuccessful;
            int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
            lblMessageHeader.Text = "Successfully updated!";
        }

        protected void radioJobActiveNo_CheckedChanged(object sender, EventArgs e)
        {
            radioMoveToQuoteNo.Checked = false;
            radioMoveToQuoteYes.Checked = false;
        }

        protected void radioJobActiveYes_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void radioViewLeadsReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                printLeadsReport();
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioViewLeadsReport.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        private void printLeadsReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());

            cmd.CommandText = "sp_Leads";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_Leads");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewLeads.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewLeadsReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        private void clearPipelineControls()
        {
            ddlPipelineEmployee.SelectedIndex = 0; ddlPipelineAgency.SelectedIndex = 0; ddlPipelineCountry.SelectedIndex = 0;
            ddlPipelineIndustry.SelectedIndex = 0; txtPipelineJobName.Text = ""; txtPipelineCalendarDate.Text = ""; txtPipelineDateLastContact.Text = "";
            txtPipelineDateNextContact.Text = ""; txtPipelineOutcomeLastContact.Text = ""; txtPipelineNextActionRequired.Text = ""; txtPipelineValue.Text = "";
            ddlEditPipelineEmployee.SelectedIndex = 0; ddlEditPipelineAgency.SelectedIndex = 0; ddlEditPipelineCountry.SelectedIndex = 0; ddlEditPipelineIndustry.SelectedIndex = 0;
            txtEditPipelineJobName.Text = ""; txtEditPipelineCalendarDate.Text = ""; txtEditPipelineDateLastContact.Text = ""; txtEditPipelineDateNextContact.Text = "";
            txtEditPipelineOutcomeLastContact.Text = ""; txtEditPipelineNextActionRequired.Text = ""; txtEditPipelineValue.Text = "";
            radioJobActiveYes.Checked = false; radioJobActiveNo.Checked = false; radioMoveToQuoteYes.Checked = false; radioMoveToQuoteNo.Checked = false;
            radioJobActiveNotSet.Checked = false;
            //radioJobSuccessfulYes.Checked = false; radioJobSuccessfulNo.Checked = false;
        }

        protected void radioViewInactiveLeads_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                clearPipelineControls();
                companyName = Session["CompanyName"].ToString();
                divAddJobsInPipeline.Visible = false;
                divEditJobsInPipeline.Visible = true;
                loadInactiveLeads(Session["CompanyName"].ToString());
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioViewInactiveLeads.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        protected void radioViewInactiveLeadsReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
                printInactiveLeadsReport();
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioViewInactiveLeadsReport.Checked = false;
                tabPanelDefaultView.Focus();
            }
        }

        private void printInactiveLeadsReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Job_Active", "No");

            cmd.CommandText = "sp_InactiveLeads";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_InactiveLeads");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewInactiveLeads.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewInactiveLeadsReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        private void loadInactiveLeads(string company)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + company + "' AND Opportunity_Stage = 'Pipeline' AND Job_Active = 'No' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstPipelineOpportunities.DataSource = dtResults;
            lstPipelineOpportunities.DataTextField = "Opportunity_Name";
            lstPipelineOpportunities.DataValueField = "Opportunities_ID";
            lstPipelineOpportunities.DataBind();
        }

        protected void radioDebtViewPaidReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                btnSaveDebt.Visible = true;
                companyName = Session["CompanyName"].ToString();
                printDebtPaidReport();
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtViewPaidReport.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        private void printDebtPaidReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Job_Active", "Yes");
            cmd.Parameters.AddWithValue("@Paid", "Yes");


            cmd.CommandText = "sp_DebtPaidUnpaid";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_DebtPaidUnpaid");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewDebtPaid.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewDebtPaidReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioDebtViewUnpaidReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                btnSaveDebt.Visible = true;
                companyName = Session["CompanyName"].ToString();
                printDebtUnpaidReport();
            }
            catch (Exception ex)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtViewPaidReport.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        private void printDebtUnpaidReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Job_Active", "Yes");
            cmd.Parameters.AddWithValue("@Paid", "No");


            cmd.CommandText = "sp_DebtPaidUnpaid";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_DebtPaidUnpaid");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewDebtUnpaid.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewDebtUnpaidReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioDebtViewCompletedReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                btnSaveDebt.Visible = true;
                companyName = Session["CompanyName"].ToString();
                loadDebtCompletedReport();
            }
            catch (Exception except)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtViewCompletedReport.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        private void loadDebtCompletedReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Successful", "Yes");


            cmd.CommandText = "sp_DebtCompleted";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_DebtCompleted");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewDebtCompleted.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewDebtCompletedReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioDebtViewIncomplete_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                divDebt.Visible = true;
                clearDebtControls();
                loadDebtUnsuccessful(Session["CompanyName"].ToString());
                btnSaveDebt.Visible = false;
            }
            catch (Exception except)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtViewIncomplete.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        private void loadDebtUnsuccessful(string companyName)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID, Opportunity_Name FROM Opportunities WHERE Company_Name = '" + companyName + "' AND Opportunity_Stage = 'Debt' AND Successful = 'No' ORDER BY Opportunity_Date DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstDebt.DataSource = dtResults;
            lstDebt.DataTextField = "Opportunity_Name";
            lstDebt.DataValueField = "Opportunities_ID";
            lstDebt.DataBind();
        }

        protected void radioDebtViewIncompleteReport_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                btnSaveDebt.Visible = true;
                companyName = Session["CompanyName"].ToString();
                loadDebtUnsuccessfulReport();
            }
            catch (Exception except)
            {
                lblMessageHeader.Text = "You did not select a company!";
                radioDebtViewIncompleteReport.Checked = false;
                btnSaveDebt.Visible = true;
            }
        }

        private void loadDebtUnsuccessfulReport()
        {
            ReportDocument rpt = new ReportDocument();
            SqlConnection sqlCon = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter daMYDA = new SqlDataAdapter();
            DataSet dsMYDS = new DataSet();

            string conn = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            sqlCon.ConnectionString = conn;

            cmd.Parameters.AddWithValue("@Company_Name", Session["CompanyName"].ToString());
            cmd.Parameters.AddWithValue("@Successful", "No");


            cmd.CommandText = "sp_DebtCompleted";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = sqlCon;
            daMYDA.SelectCommand = cmd;
            daMYDA.Fill(dsMYDS, "sp_DebtCompleted");
            sqlCon.Open();
            cmd.ExecuteNonQuery();

            string reportPath = Server.MapPath("rptViewDebtUnsuccessful.rpt");

            Session["theReportDocument"] = rpt;
            Session["theReportPath"] = reportPath;
            Session["dataset"] = dsMYDS;

            Response.Write("<script type='text/javascript'>window.open('ViewDebtUnsuccessfulReport.aspx');</script>");
            Response.Write("<script type='text/javascript'>window.location.href = 'ViewCompany.aspx';</script>");
        }

        protected void radioAdAgency_CheckedChanged(object sender, EventArgs e)
        {
            lblAdAgency.Text = "Clients";
            txtClients.Visible = true;
            txtAdAgency.Visible = false;
        }

        protected void radioCorporate_CheckedChanged(object sender, EventArgs e)
        {
            lblAdAgency.Text = "Agency";
            txtClients.Visible = false;
            txtAdAgency.Visible = true;
        }
    }
}