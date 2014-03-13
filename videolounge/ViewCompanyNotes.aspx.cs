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

namespace videolounge
{
    public partial class ViewCompanyNotes : System.Web.UI.Page
    {
        private string companyName = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript'>alert('You did not select a company to view its notes.');</script>");
                Response.Write("<script type='text/javascript'>window.close();</script>");
            }

            if (!IsPostBack)
            {
                loadCompanyNotes(companyName);
            }
        }

        private void loadCompanyNotes(string companyName)
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
                    string sqlQuery = "SELECT [Meeting_Comments] FROM Contacts WHERE [Company_Name] = '" + companyName + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultNotes = datatb.Rows[i]["Meeting_Comments"].ToString();
                        txtNotes.Text = resultNotes;
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception exc) { Response.Write(exc.Message); }
        }
        
        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Write("<script type='text/javascript'>window.close();</script>");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            SqlCommand cmdMyQuery0 = new SqlCommand("UPDATE Contacts SET Meeting_Comments = @Meeting_Comments WHERE Company_Name = @Company_Name");
            cmdMyQuery0.Parameters.Add("@Meeting_Comments", System.Data.SqlDbType.VarChar).Value = txtNotes.Text;
            cmdMyQuery0.Parameters.Add("@Company_Name", System.Data.SqlDbType.VarChar).Value = companyName;
            int sql0 = DBUtils.ExecuteSQLCommand(cmdMyQuery0);
            lblMessageHeader.Text = "Successfully updated!";
        }
    }
}