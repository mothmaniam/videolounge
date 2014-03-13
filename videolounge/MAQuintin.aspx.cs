using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DB;
using System.Web.Configuration;

namespace videolounge
{
    public partial class MAQuintin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadOpportunities("quintin");
            }
        }

        private void loadOpportunities(string username)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID FROM Opportunities WHERE Employee = '" + username + "' ORDER BY Opportunities_ID DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstOpportunities.DataSource = dtResults;
            lstOpportunities.DataTextField = "Opportunities_ID";
            lstOpportunities.DataValueField = "Opportunities_ID";
            lstOpportunities.DataBind();
        }

        private void loadOpportunityDetails(string username, int opp_num)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection customerConnection = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = customerConnection;
            int count = 0;

            try
            {
                using (customerConnection)
                {
                    customerConnection.Open();
                    string sqlQuery = "SELECT * FROM Opportunities WHERE Employee = '" + username + "' AND Opportunities_ID = '" + opp_num + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultCountry = datatb.Rows[i]["Country"].ToString();
                        string resultJobIndustry = datatb.Rows[i]["Job_Industry"].ToString();
                        string resultAgency = datatb.Rows[i]["Agency"].ToString();
                        string resultEntityName = datatb.Rows[i]["Company_Name"].ToString();
                        string resultDescription = datatb.Rows[i]["Description"].ToString();
                        string resultDateLastContact = datatb.Rows[i]["Date_Last_Contact"].ToString();
                        string resultOutcomeLastContact = datatb.Rows[i]["Outcome_Last_Contact"].ToString();
                        string resultNextActionRequired = datatb.Rows[i]["Next_Action_Required"].ToString();
                        string resultDateNextContact = datatb.Rows[i]["Date_Next_Contact"].ToString();
                        string resultDebbieComments = datatb.Rows[i]["Debbie_Comments"].ToString();
                        string resultLastUpdatedBy = datatb.Rows[i]["Last_Updated_By"].ToString();

                        txtCountry.Text = resultCountry;
                        txtIndustry.Text = resultJobIndustry;
                        txtAgency.Text = resultAgency;
                        txtEntity.Text = resultEntityName;
                        txtOpportunityDescription.Text = resultDescription;
                        txtDateLastContact.Text = resultDateLastContact;
                        txtOutcomeLastContact.Text = resultOutcomeLastContact;
                        txtNextActionRequired.Text = resultNextActionRequired;
                        txtDateNextContact.Text = resultDateNextContact;
                        txtDebbieComments.Text = resultDebbieComments;
                        txtLastUpdatedBy.Text = resultLastUpdatedBy;
                    }
                    customerConnection.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        protected void lstOpportunities_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selected_opp = Convert.ToInt32(lstOpportunities.SelectedValue.ToString());
            loadOpportunityDetails("quintin", selected_opp);
        }

        private void update_marketing_action(int _oppo_num)
        {
            string currentUser = Session["currentUser"].ToString();
            SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Description = @Description, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Next_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Debbie_Comments = @Debbie_Comments, Last_Updated_By = '" + currentUser + "' WHERE Opportunities_ID = '" + Convert.ToInt32(lstOpportunities.SelectedValue.ToString()) + "'");
            cmdMyQuery.Parameters.Add("@Description", System.Data.SqlDbType.VarChar).Value = txtOpportunityDescription.Text;
            cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtDateLastContact.Text;
            cmdMyQuery.Parameters.Add("@Date_Next_Contact", System.Data.SqlDbType.VarChar).Value = txtDateNextContact.Text;
            cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtOutcomeLastContact.Text;
            cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtNextActionRequired.Text;
            cmdMyQuery.Parameters.Add("@Debbie_Comments", System.Data.SqlDbType.VarChar).Value = txtDebbieComments.Text;
            int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
            lblMessageHeader.Text = "Successfully updated!";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int selected_opp = Convert.ToInt32(lstOpportunities.SelectedValue.ToString());
            update_marketing_action(selected_opp);
        }
    }
}