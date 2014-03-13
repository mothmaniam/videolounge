using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB;
using System.Data.SqlClient;

namespace videolounge
{
    public partial class AddIndustry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddIndustry_Click(object sender, EventArgs e)
        {
            if(txtIndustry.Text.Equals(""))
            {
                lblMessageHeader.Text = "Please enter an industry!";
                txtIndustry.Focus();
            }
            else
            {
                SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Job_Industry (Job_Industry_Description) VALUES (@Job_Industry_Description)");
                cmdMyQuery.Parameters.AddWithValue("@Job_Industry_Description", txtIndustry.Text);
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully added Industry!";
            }
        }
    }
}