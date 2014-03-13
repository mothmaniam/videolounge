using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace videolounge
{
    public partial class AddMa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadEmployees();
                loadCountries();
                loadIndustries();
                loadAgencies();
                loadEntities();
            }
        }

        private void loadEmployees()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Username FROM Employees WHERE Username NOT LIKE 'debbie' AND Status = 'active'");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlEmployee.DataSource = dtResults;
            ddlEmployee.DataTextField = "Username";
            ddlEmployee.DataValueField = "Username";
            ddlEmployee.DataBind();
        }

        private void loadCountries()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Country_Name FROM Countries ORDER BY Country_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlCountry.DataSource = dtResults;
            ddlCountry.DataTextField = "Country_Name";
            ddlCountry.DataValueField = "Country_Name";
            ddlCountry.DataBind();
        }

        private void loadIndustries()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Job_Industry_Description FROM Job_Industry ORDER BY Job_Industry_Description ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlIndustry.DataSource = dtResults;
            ddlIndustry.DataTextField = "Job_Industry_Description";
            ddlIndustry.DataValueField = "Job_Industry_Description";
            ddlIndustry.DataBind();
        }

        private void loadAgencies()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Agency_Clients_Name FROM Agency_Clients ORDER BY Agency_Clients_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlAgency.DataSource = dtResults;
            ddlAgency.DataTextField = "Agency_Clients_Name";
            ddlAgency.DataValueField = "Agency_Clients_Name";
            ddlAgency.DataBind();
        }

        private void loadEntities()
        {
            SqlCommand cmdMyQuery = new SqlCommand("SELECT Company_Name FROM Contacts ORDER BY Company_Name ASC");
            DataTable dtResults = DBUtils.SQLSelect(cmdMyQuery);
            ddlEntity.DataSource = dtResults;
            ddlEntity.DataTextField = "Company_Name";
            ddlEntity.DataValueField = "Company_Name";
            ddlEntity.DataBind();
        }

        protected void btnAddMA_Click(object sender, EventArgs e)
        {
            if (txtDateLastContact.Text.Equals(""))
            {
                lblMessage.Text = "Please select a date!";
                txtDateLastContact.Focus();
            }
            else
            {
                lblMessage.Text = "";
                add_marketing_action();
            }
        }

        private void add_marketing_action()
        {
            SqlCommand cmdMyQuery = new SqlCommand("INSERT INTO Opportunities (Employee, Country, Job_Industry, Agency, Company_Name, Description, Date_Last_Contact, Outcome_Last_Contact, Next_Action_Required, Date_Next_Contact, Debbie_Comments, Opportunity_Stage, Quote_Budget) VALUES (@Employee, @Country, @Job_Industry, @Agency, @Company_Name, @Description, @Date_Last_Contact, @Outcome_Last_Contact, @Next_Action_Required, @Date_Next_Contact, @Debbie_Comments, @Opportunity_Stage, @Quote_Budget)");
            cmdMyQuery.Parameters.AddWithValue("@Employee", ddlEmployee.SelectedValue.ToString());
            cmdMyQuery.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue.ToString());
            cmdMyQuery.Parameters.AddWithValue("@Job_Industry", ddlIndustry.SelectedValue.ToString());
            cmdMyQuery.Parameters.AddWithValue("@Agency", ddlAgency.SelectedValue.ToString());
            cmdMyQuery.Parameters.AddWithValue("@Company_Name", ddlEntity.SelectedValue.ToString());
            cmdMyQuery.Parameters.AddWithValue("@Description", txtOpportunityDescription.Text);
            cmdMyQuery.Parameters.AddWithValue("@Date_Last_Contact", txtDateLastContact.Text);
            cmdMyQuery.Parameters.AddWithValue("@Outcome_Last_Contact", txtOutcomeLastContact.Text);
            cmdMyQuery.Parameters.AddWithValue("@Next_Action_Required", txtNextActionRequired.Text);
            cmdMyQuery.Parameters.AddWithValue("@Date_Next_Contact", txtDateNextContact.Text);
            cmdMyQuery.Parameters.AddWithValue("@Debbie_Comments", txtDebbieComments.Text);
            cmdMyQuery.Parameters.AddWithValue("@Opportunity_Stage", "Opportunity");
            cmdMyQuery.Parameters.AddWithValue("@Quote_Budget", 0);
            int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
            lblMessageHeader.Text = "Successfully Added!";
        }
    }
}