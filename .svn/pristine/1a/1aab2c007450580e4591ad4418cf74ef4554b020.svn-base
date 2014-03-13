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

namespace videolounge
{
    public partial class DebtCollection : System.Web.UI.Page
    {
        private static string resultEmployee;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                resultEmployee = "";
                loadQuotes();
            }
        }

        protected void lstQuotes_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selected_opp = Convert.ToInt32(lstQuotes.SelectedValue.ToString());
            loadOpportunityDetails(selected_opp);
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
                    string sqlQuery = "SELECT Employee, Company_Name, Agency, Quote_Campaign, Quote_Status, Debbie_Comments FROM Opportunities WHERE Opportunities_ID = '" + opp_num + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        resultEmployee = datatb.Rows[i]["Employee"].ToString();
                        string resultAgency = datatb.Rows[i]["Agency"].ToString();
                        string resultCompany = datatb.Rows[i]["Company_Name"].ToString();
                        string resultCampaign = datatb.Rows[i]["Quote_Campaign"].ToString();
                        string resultStatus = datatb.Rows[i]["Quote_Status"].ToString();
                        string resultComments = datatb.Rows[i]["Debbie_Comments"].ToString();

                        txtAgencyClient.Text = resultAgency;
                        txtCampaign.Text = resultCampaign;
                        txtQuoteStatus.Text = resultStatus;
                        txtQuoteComments.Text = resultComments;
                        txtCompany.Text = resultCompany;
                    }
                    customerConnection.Close();
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void loadQuotes()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Opportunities_ID FROM Opportunities WHERE Opportunity_Stage = 'Quote' ORDER BY Opportunities_ID DESC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstQuotes.DataSource = dtResults;
            lstQuotes.DataTextField = "Opportunities_ID";
            lstQuotes.DataValueField = "Opportunities_ID";
            lstQuotes.DataBind();
        }

        protected void btnAddDebt_Click(object sender, EventArgs e)
        {
            string rand_amount, naira_amount;

            rand_amount = txtRandAmount.Text.Trim();
			naira_amount = txtNairaAmount.Text.Trim();
            Int64 num = 0;

            if (Int64.TryParse(txtRandAmount.Text, out num) && Int64.TryParse(txtNairaAmount.Text, out num))
            {
                SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Debt_Collection (Debt_Collection_ID, Employee, Company_Name, Client, Campaign, Status, Rand_Amount, Naira_Amount, Comments) VALUES (@Debt_Collection_ID, @Employee, @Company_Name, @Client, @Campaign, @Status, @Rand_Amount, @Naira_Amount, @Comments)");
                cmdMyQuery.Parameters.AddWithValue("@Debt_Collection_ID", Convert.ToInt32(lstQuotes.SelectedValue.ToString()));
                cmdMyQuery.Parameters.AddWithValue("@Employee", resultEmployee);
                cmdMyQuery.Parameters.AddWithValue("@Company_Name", txtCompany.Text);
				cmdMyQuery.Parameters.AddWithValue("@Client", txtAgencyClient.Text);
				cmdMyQuery.Parameters.AddWithValue("@Campaign", txtCampaign.Text);
				cmdMyQuery.Parameters.AddWithValue("@Status", txtQuoteStatus.Text);
				cmdMyQuery.Parameters.AddWithValue("@Rand_Amount", txtRandAmount.Text);
				cmdMyQuery.Parameters.AddWithValue("@Naira_Amount", txtNairaAmount.Text);
				cmdMyQuery.Parameters.AddWithValue("@Comments", txtQuoteComments.Text);
				int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);

                SqlCommand cmdMyQuery2 = new SqlCommand("UPDATE Opportunities SET Opportunity_Stage = 'Debt' WHERE Opportunities_ID = '" + Convert.ToInt32(lstQuotes.SelectedValue.ToString()) + "'");
                int sql2 = DBUtils.ExecuteSQLCommand(cmdMyQuery2);
				lblMessageHeader.Text = "Successfully added to debt collection!";
            }
            else
            {
                lblMessageHeader.Text = "Please enter a number for your Rand/Naira amounts!";
            }
        }
    }
}