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
    public partial class ViewDebt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDebt();
            }
        }

        private void loadDebt()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Debt_Collection_ID FROM Debt_Collection ORDER BY Debt_Collection_ID ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            lstDebt.DataSource = dtResults;
            lstDebt.DataTextField = "Debt_Collection_ID";
            lstDebt.DataValueField = "Debt_Collection_ID";
            lstDebt.DataBind();
        }

        protected void lstDebt_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selected_debt = Convert.ToInt32(lstDebt.SelectedValue.ToString());
            loadDebtDetails(selected_debt);
        }

        private void loadDebtDetails(int debt_num)
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
                    string sqlQuery = "SELECT Employee, Company_Name, Client, Campaign, Status, Rand_Amount, Naira_Amount, Comments FROM Debt_Collection WHERE Debt_Collection_ID = '" + debt_num + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string resultEmployee = datatb.Rows[i]["Employee"].ToString();
                        string resultCompany = datatb.Rows[i]["Company_Name"].ToString();
                        string resultClient = datatb.Rows[i]["Client"].ToString();
                        string resultCampaign = datatb.Rows[i]["Campaign"].ToString();
                        string resultStatus = datatb.Rows[i]["Status"].ToString();
                        Int64 resultRandAmount = Convert.ToInt64(datatb.Rows[i]["Rand_Amount"].ToString());
                        Int64 resultNairaAmount = Convert.ToInt64(datatb.Rows[i]["Naira_Amount"].ToString());
                        string resultComments = datatb.Rows[i]["Comments"].ToString();

                        txtEmployee.Text = resultEmployee;
                        txtAgencyClient.Text = resultClient;
                        txtCampaign.Text = resultCampaign;
                        txtQuoteStatus.Text = resultStatus;
                        txtRandAmount.Text = "" + resultRandAmount;
                        txtNairaAmount.Text = "" + resultNairaAmount;
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
    }
}