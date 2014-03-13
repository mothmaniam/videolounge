﻿using System;
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
    public partial class AddEntity : System.Web.UI.Page
    {
        static string countries_added;
        private static string produce_in_sa;
        private static int counter;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                produce_in_sa = ""; counter = 0;
                loadCountries();
                //loadAgencies();
                loadIndustries();               
                counter = 0;
            }
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

        //private void loadAgencies()
        //{
        //    SqlCommand cmdMyQuery = new SqlCommand("SELECT Agency_Clients_Name FROM Agency_Clients ORDER BY Agency_Clients_Name ASC");
        //    DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
        //    ddlAgency.DataSource = dtResults;
        //    ddlAgency.DataTextField = "Agency_Clients_Name";
        //    ddlAgency.DataValueField = "Agency_Clients_Name";
        //    ddlAgency.DataBind();
        //}

        private void loadIndustries()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Job_Industry_Description FROM Job_Industry ORDER BY Job_Industry_Description ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlIndustry.DataSource = dtResults;
            ddlIndustry.DataTextField = "Job_Industry_Description";
            ddlIndustry.DataValueField = "Job_Industry_Description";
            ddlIndustry.DataBind();
        }

        protected void btnAddCompany_Click(object sender, EventArgs e)
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


            string channel = "";

            if (radioAdAgency.Checked == true && radioCorporate.Checked == false)
            {
                channel = "Ad Agency";
            }
            else if (radioAdAgency.Checked == false && radioCorporate.Checked == true)
            {
                channel = "Corporate";
            }

            try
            {
                SqlCommand cmdMyQuery0 = new SqlCommand("INSERT INTO Contacts (Marketer, How_Lead_Sourced, " +
                                                        "Company_Name, Affiliated_To, Industry, " +
                                                        "Work_Types, Landline, Website, Channel, Physical_Address, " +
                                                        "Postal_Address, Ad_Agency, Producers_Local, " +
                                                        "Producers_International, Directors_Local, " +
                                                        "Directors_International, " +
                                                        "Produce_In_SA, Produce_In_Countries, " +
                                                        "Agencies_Clients) " +
                                                        "VALUES (@Marketer, @How_Lead_Sourced, @Company_Name, @Affiliated_To, @Industry, @Work_Types, @Landline, @Website, @Channel, @Physical_Address, @Postal_Address, @Ad_Agency, @Producers_Local, @Producers_International, @Directors_Local, @Directors_International, @Produce_In_SA, @Produce_In_Countries, @Agencies_Clients)");
                cmdMyQuery0.Parameters.Add("@Marketer", System.Data.SqlDbType.VarChar).Value = txtMarketer.Text;
                cmdMyQuery0.Parameters.Add("@How_Lead_Sourced", System.Data.SqlDbType.VarChar).Value = txtLeadSourced.Text;
                cmdMyQuery0.Parameters.Add("@Company_Name", System.Data.SqlDbType.VarChar).Value = txtCompany.Text;
                cmdMyQuery0.Parameters.Add("@Affiliated_To", System.Data.SqlDbType.VarChar).Value = txtAffiliatedTo.Text;
                cmdMyQuery0.Parameters.Add("@Industry", System.Data.SqlDbType.VarChar).Value = ddlIndustry.SelectedValue.ToString();
                cmdMyQuery0.Parameters.Add("@Work_Types", System.Data.SqlDbType.VarChar).Value = txtWorkTypes.Text;
                cmdMyQuery0.Parameters.Add("@Landline", System.Data.SqlDbType.VarChar).Value = txtLandline.Text;
                cmdMyQuery0.Parameters.Add("@Website", System.Data.SqlDbType.VarChar).Value = txtWebsite.Text;
                cmdMyQuery0.Parameters.Add("@Channel", System.Data.SqlDbType.VarChar).Value = channel;
                cmdMyQuery0.Parameters.Add("@Physical_Address", System.Data.SqlDbType.VarChar).Value = txtPhysicalAddress.Text;
                cmdMyQuery0.Parameters.Add("@Postal_Address", System.Data.SqlDbType.VarChar).Value = txtPostalAddress.Text;

                if (radioAdAgency.Checked == true && radioCorporate.Checked == false)
                {
                    cmdMyQuery0.Parameters.Add("@Ad_Agency", System.Data.SqlDbType.VarChar).Value = txtAdAgency.Text;
                }
                else if(radioCorporate.Checked == true && radioAdAgency.Checked == false)
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
                lblMessageHeader.Text = "Successfully added!";
                //add a dummy contact to the company
                SqlCommand cmdMyQuery2 = new SqlCommand("INSERT INTO Contact_Persons (Name, Position, Cell, Email, Company) VALUES (@Name, @Position, @Cell, @Email, @Company)");
                cmdMyQuery2.Parameters.Add("@Name", System.Data.SqlDbType.VarChar).Value = "John Doe";
                cmdMyQuery2.Parameters.Add("@Position", System.Data.SqlDbType.VarChar).Value = "Handyman";
                cmdMyQuery2.Parameters.Add("@Cell", System.Data.SqlDbType.VarChar).Value = "0821234567";
                cmdMyQuery2.Parameters.Add("@Email", System.Data.SqlDbType.VarChar).Value = "john.doe@gmail.com";
                cmdMyQuery2.Parameters.Add("@Company", System.Data.SqlDbType.VarChar).Value = txtCompany.Text;
                int sql2 = DBUtils.ExecuteSQLCommand(cmdMyQuery2);
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);
            }
        }

        protected void btnAddtoPIC_Click(object sender, EventArgs e)
        {
            lstCountriesAdded.Items.Add(lstCountries.SelectedValue.Trim());
        }

        protected void btnRemoveFromPIC_Click(object sender, EventArgs e)
        {
            lstCountries.Items.Add(lstCountriesAdded.SelectedValue.Trim());
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

        //protected void btnAddtoWorkTypes_Click(object sender, EventArgs e)
        //{
        //    lstWorkTypesAdded.Items.Add(lstWorkType.SelectedValue.ToString());
        //}

        //protected void btnRemoveFromWorkTypes_Click(object sender, EventArgs e)
        //{
        //    lstWorkTypesAdded.Items.Remove(lstWorkTypesAdded.SelectedValue.ToString());
        //}

        //protected void btnAddtoAgencyClients_Click(object sender, EventArgs e)
        //{
        //    lstAgencyClientsAdded.Items.Add(lstAgencyClients.SelectedValue.ToString());
        //}

        //protected void btnRemoveFromAgencyClients_Click(object sender, EventArgs e)
        //{
        //    lstAgencyClientsAdded.Items.Remove(lstAgencyClientsAdded.SelectedValue.ToString());
        //}
    }
}