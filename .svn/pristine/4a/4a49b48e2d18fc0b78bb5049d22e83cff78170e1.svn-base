using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DB;

namespace videolounge
{
    public partial class Quotes : System.Web.UI.Page
    {
        private static string likelihood;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadOpportunities("%");
            }
        }

        protected void lstOpportunities_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selected_opp = Convert.ToInt32(lstOpportunities.SelectedValue.ToString());
            loadOpportunityDetails(selected_opp);
        }

        private void loadOpportunities(string username)
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID FROM Opportunities WHERE Opportunity_Stage = 'Quote' ORDER BY Opportunities_ID DESC");
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
                        string resultCampaign = datatb.Rows[i]["Quote_Campaign"].ToString();
                        string resultStatus = datatb.Rows[i]["Quote_Status"].ToString();
                        string resultLikelihood = datatb.Rows[i]["Quote_Likelihood"].ToString();
                        Int64 resultBudget = Convert.ToInt64(datatb.Rows[i]["Quote_Budget"].ToString());

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
                        txtCampaign.Text = resultCampaign;
                        txtStatus.Text = resultStatus;
                        txtBudget.Text = "" + resultBudget;
                        
                        if(resultLikelihood.Equals("highlylikely"))
                        {
                            radioHighlyLikely.Checked = true;
                            radioLikely.Checked = false;
                            radioLessLikely.Checked = false;
                            radioInThePipeline.Checked = false;
                        }
                        else if(resultLikelihood.Equals("likely"))
                        {
                            radioHighlyLikely.Checked = false;
                            radioLikely.Checked = true;
                            radioLessLikely.Checked = false;
                            radioInThePipeline.Checked = false;
                        }
                        else if(resultLikelihood.Equals("lesslikely"))
                        {
                            radioHighlyLikely.Checked = false;
                            radioLikely.Checked = false;
                            radioLessLikely.Checked = true;
                            radioInThePipeline.Checked = false;
                        }
                        else if(resultLikelihood.Equals("inthepipeline"))
                        {
                            radioHighlyLikely.Checked = false;
                            radioLikely.Checked = false;
                            radioLessLikely.Checked = false;
                            radioInThePipeline.Checked = true;
                        }
                    }
                    customerConnection.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
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

        private void update_quote(int opp_num)
        {
            string budget;

            budget = txtBudget.Text.Trim();
            Int64 num = 0;

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

            if (Int64.TryParse(txtBudget.Text, out num))
            {
                string currentUser = Session["currentUser"].ToString();
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE Opportunities SET Quote_Campaign = @Quote_Campaign, Quote_Status = @Quote_Status, Quote_Likelihood = @Quote_Likelihood, Quote_Budget = @Quote_Budget, Description = @Description, Date_Last_Contact = @Date_Last_Contact, Date_Next_Contact = @Date_Last_Contact, Outcome_Last_Contact = @Outcome_Last_Contact, Next_Action_Required = @Next_Action_Required, Debbie_Comments = @Debbie_Comments, Last_Updated_By = '" + currentUser + "' WHERE Opportunities_ID = '" + Convert.ToInt32(lstOpportunities.SelectedValue.ToString()) + "'");
                cmdMyQuery.Parameters.Add("@Quote_Campaign", System.Data.SqlDbType.VarChar).Value = txtCampaign.Text;
                cmdMyQuery.Parameters.Add("@Quote_Status", System.Data.SqlDbType.VarChar).Value = txtStatus.Text;
                cmdMyQuery.Parameters.Add("@Quote_Likelihood", System.Data.SqlDbType.VarChar).Value = likelihood;
                cmdMyQuery.Parameters.Add("@Quote_Budget", System.Data.SqlDbType.VarChar).Value = txtBudget.Text;
                cmdMyQuery.Parameters.Add("@Description", System.Data.SqlDbType.VarChar).Value = txtOpportunityDescription.Text;
                cmdMyQuery.Parameters.Add("@Date_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtDateLastContact.Text;
                cmdMyQuery.Parameters.Add("@Outcome_Last_Contact", System.Data.SqlDbType.VarChar).Value = txtOutcomeLastContact.Text;
                cmdMyQuery.Parameters.Add("@Next_Action_Required", System.Data.SqlDbType.VarChar).Value = txtNextActionRequired.Text;
                cmdMyQuery.Parameters.Add("@Debbie_Comments", System.Data.SqlDbType.VarChar).Value = txtDebbieComments.Text;
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated!";
            }
            else
            {
                lblMessageHeader.Text = "Please enter a number for your budget!";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int selected_opp = Convert.ToInt32(lstOpportunities.SelectedValue.ToString());
            update_quote(selected_opp);
        }
    }
}