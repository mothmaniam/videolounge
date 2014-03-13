using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DB;

namespace videolounge
{
    public partial class AddLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnAddLocation_Click(object sender, EventArgs e)
        {
            if (txtLocationName.Text.Equals(""))
            {
                lblMessageHeader.Text = "Please enter a Location!";
                txtLocationName.Focus();
            }
            else
            {
                SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Locations (Location_Name) VALUES (@Location_Name)");
                cmdMyQuery.Parameters.AddWithValue("@Location_Name", txtLocationName.Text);
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully added Location!";
            }
        }
    }
}