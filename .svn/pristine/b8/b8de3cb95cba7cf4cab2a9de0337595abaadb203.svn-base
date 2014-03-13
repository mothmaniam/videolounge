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
using System.Threading;

namespace videolounge
{
    public partial class EditCountry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadRegions();
                ddlCountry.Items.Add("--Please Select--");
                loadCountries();
            }
        }

        protected void btnEditCountry_Click(object sender, EventArgs e)
        {
            SqlCommand cmdMyQuery = new SqlCommand("UPDATE Countries SET Country_Region = @Country_Region WHERE Country_Name = '" + ddlCountry.SelectedValue.ToString() + "'");
            cmdMyQuery.Parameters.Add("@Country_Region", System.Data.SqlDbType.VarChar).Value = ddlRegions.SelectedValue.ToString();
            int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
            lblMessageHeader.Text = "Successfully updated Country!";
        }

        private void loadRegions()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Region_Name From Regions ORDER BY Region_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlRegions.DataSource = dtResults;
            ddlRegions.DataTextField = "Region_Name";
            ddlRegions.DataValueField = "Region_Name";
            ddlRegions.DataBind();
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
                        string country = datatb.Rows[i]["Country_Name"].ToString();
                        ddlCountry.Items.Add(country);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMessageHeader.Text = "";

            if (ddlCountry.SelectedValue.ToString().Equals("--Please Select--"))
            {
                txtCurrentRegion.Text = "";
                ddlRegions.SelectedIndex = 0;
            }

            loadCurrentRegion(ddlCountry.SelectedValue.ToString());
        }

        protected void ddlRegions_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMessageHeader.Text = "";
        }

        private void loadCurrentRegion(string country)
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
                    string sqlQuery = "SELECT Country_Region FROM Countries WHERE Country_Name = '" + country + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string region = datatb.Rows[i]["Country_Region"].ToString();
                        txtCurrentRegion.Text = region;
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e)
            { 
                Response.Write(e.Message);
            }
        }
    }
}