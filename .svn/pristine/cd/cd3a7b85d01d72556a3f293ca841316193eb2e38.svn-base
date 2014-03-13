using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DB;
using System.Data;
using System.Web.Configuration;

namespace videolounge
{
    public partial class MADebbie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadOpportunities("%");
            }
        }

        private void clearControls()
        {
            txtAgency.Text = ""; txtCountry.Text = ""; txtDateLastContact.Text = ""; txtDateNextContact.Text = ""; txtDebbieComments.Text = "";
            txtEntity.Text = ""; txtIndustry.Text = ""; txtLastUpdatedBy.Text = ""; txtNextActionRequired.Text = ""; txtOpportunityDescription.Text = "";
            txtOutcomeLastContact.Text = ""; radioPipelineYes.Checked = false; radioPipelineNo.Checked = false;
        }

        private void loadOpportunities(string username)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID FROM Opportunities WHERE Opportunity_Stage = 'Opportunity' AND Employee LIKE '" + username + "' ORDER BY Opportunities_ID DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstOpportunities.DataSource = dtResults;
            lstOpportunities.DataTextField = "Opportunities_ID";
            lstOpportunities.DataValueField = "Opportunities_ID";
            lstOpportunities.DataBind();
        }

        private void loadOpportunityDetails(int opp_num)
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
                    string sqlQuery = "SELECT * FROM Opportunities WHERE Opportunities_ID = '" + opp_num + "'";
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
                        string resultOpportunityStage = datatb.Rows[i]["Opportunity_Stage"].ToString();
                        string resultEmployee = datatb.Rows[i]["Employee"].ToString();

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

                        if (resultOpportunityStage.Equals("Opportunity"))
                        {
                            radioPipelineNo.Checked = true;
                            radioPipelineYes.Checked = false;
                        }
                        else
                        {
                            radioPipelineNo.Checked = false;
                            radioPipelineYes.Checked = true;
                        }
                    }
                    customerConnection.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        protected void lstOpportunities_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int selected_opp = Convert.ToInt32(lstOpportunities.SelectedValue.ToString());
            loadOpportunityDetails(selected_opp);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int selected_opp = Convert.ToInt32(lstOpportunities.SelectedValue.ToString());
            update_marketing_action(selected_opp);
        }

        private void update_marketing_action(int opp_num)
        {
            if (radioPipelineYes.Checked == true && radioPipelineNo.Checked == false)
            {
                string currentUser = Session["currentUser"].ToString();
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Description = '" + txtOpportunityDescription.Text + "', Date_Last_Contact = '" + txtDateLastContact.Text + "', Date_Next_Contact = '" + txtDateNextContact.Text + "', Outcome_Last_Contact = '" + txtOutcomeLastContact.Text + "', Next_Action_Required = '" + txtNextActionRequired.Text + "', Debbie_Comments = '" + txtDebbieComments.Text + "', Last_Updated_By = '" + currentUser + "', Opportunity_Stage = 'Pipeline' WHERE Opportunities_ID = '" + Convert.ToInt32(lstOpportunities.SelectedValue.ToString()) + "'");
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated and moved to Pipeline!";
            }
            else if(radioPipelineNo.Checked == true && radioPipelineYes.Checked == false)
            {
                string currentUser = Session["currentUser"].ToString();
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Description = '" + txtOpportunityDescription.Text + "', Date_Last_Contact = '" + txtDateLastContact.Text + "', Date_Next_Contact = '" + txtDateNextContact.Text + "', Outcome_Last_Contact = '" + txtOutcomeLastContact.Text + "', Next_Action_Required = '" + txtNextActionRequired.Text + "', Debbie_Comments = '" + txtDebbieComments.Text + "', Last_Updated_By = '" + currentUser + "' WHERE Opportunities_ID = '" + Convert.ToInt32(lstOpportunities.SelectedValue.ToString()) + "'");
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated!";
            }
        }
    }
}