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
    public partial class AddAgency : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnAddAgency_Click(object sender, EventArgs e)
        {
            if (txtAgency.Text.Equals(""))
            {
                lblMessageHeader.Text = "Please enter an Agency!";
                txtAgency.Focus();
            }
            else
            {
                SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Agency_Clients (Agency_Clients_Name, Additional_Info) VALUES (@Agency_Clients_Name, @Additional_Info)");
                cmdMyQuery.Parameters.AddWithValue("@Agency_Clients_Name", txtAgency.Text);
                cmdMyQuery.Parameters.AddWithValue("@Additional_Info", txtAdditionalInfo.Text);
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully added Agency!";
            }
        }
    }
}