using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB;
using System.Data.SqlClient;
using System.Data;

namespace videolounge
{
    public partial class AddCountry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadRegions();
            }
        }

        protected void btnAddCountry_Click(object sender, EventArgs e)
        {
            if (txtCountry.Text.Equals(""))
            {
                lblMessageHeader.Text = "Please enter a region!";
                txtCountry.Focus();
            }
            else
            {
                SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Countries (Country_Name, CountrY_Region) VALUES (@Country_Name, @Country_Region)");
                cmdMyQuery.Parameters.AddWithValue("@Country_Name", txtCountry.Text);
                cmdMyQuery.Parameters.AddWithValue("@Country_Region", ddlRegions.SelectedValue.ToString());
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully added Country!";
            }
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
    }
}