using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace videolounge
{
    public partial class ViewCompanyContacts : System.Web.UI.Page
    {
        private string strConnString = ConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
        private string companyName = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                companyName = Session["CompanyName"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script type='text/javascript'>alert('You did not select a company to view its contacts.');</script>");
                Response.Write("<script type='text/javascript'>window.close();</script>");
            }

            if (!IsPostBack)
            {
                BindData();                
            }
        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindData();
            gridContactPersons.PageIndex = e.NewPageIndex;
            gridContactPersons.DataBind();
        }

        private void BindData()
        {
            string strQuery = "SELECT * FROM Contact_Persons WHERE Company = '" + companyName + "'";
            SqlCommand cmd = new SqlCommand(strQuery);
            gridContactPersons.DataSource = GetData(cmd);
            gridContactPersons.DataBind();
        }

        protected void EditCustomer(object sender, GridViewEditEventArgs e)
        {
            gridContactPersons.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridContactPersons.EditIndex = -1;
            BindData();
        }

        protected void DeleteCustomer(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "DELETE FROM Contact_Persons WHERE Contact_Person_ID = @ContactID";
            cmd.Parameters.Add("@ContactID", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
            gridContactPersons.DataSource = GetData(cmd);
            gridContactPersons.DataBind();
            Response.Redirect(Request.RawUrl);
        }

        protected void UpdateCustomer(object sender, GridViewUpdateEventArgs e)
        {
            string ContactID = ((Label)gridContactPersons.Rows[e.RowIndex].FindControl("lblContactPersonID")).Text;
            string Name = ((TextBox)gridContactPersons.Rows[e.RowIndex].FindControl("txtContactName")).Text;
            string Position = ((TextBox)gridContactPersons.Rows[e.RowIndex].FindControl("txtContactPosition")).Text;
            string Cell = ((TextBox)gridContactPersons.Rows[e.RowIndex].FindControl("txtContactCell")).Text;
            string Email = ((TextBox)gridContactPersons.Rows[e.RowIndex].FindControl("txtContactEmail")).Text;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE Contact_Persons SET Name=@Name, Position=@Position, Cell=@Cell, Email=@Email WHERE Contact_Person_ID = @Contact_Person_ID";
            cmd.Parameters.Add("@Contact_Person_ID", SqlDbType.VarChar).Value = ContactID;
            cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name;
            cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = Position;
            cmd.Parameters.Add("@Cell", SqlDbType.VarChar).Value = Cell;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
            gridContactPersons.EditIndex = -1;
            gridContactPersons.DataSource = GetData(cmd);
            gridContactPersons.DataBind();
            Response.Redirect(Request.RawUrl);
        }

        protected void AddNewCustomer(object sender, EventArgs e)
        {
            string CustomerID = ((TextBox)gridContactPersons.FooterRow.FindControl("txtContactPersonID")).Text;
            string Name = ((TextBox)gridContactPersons.FooterRow.FindControl("txtContactName")).Text;
            string Position = ((TextBox)gridContactPersons.FooterRow.FindControl("txtContactPosition")).Text;
            string Cell = ((TextBox)gridContactPersons.FooterRow.FindControl("txtContactCell")).Text;
            string Email = ((TextBox)gridContactPersons.FooterRow.FindControl("txtContactEmail")).Text;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO Contact_Persons(Name, Position, Cell, Email, Company) VALUES(@Name, @Position, @Cell, @Email, @Company)";
            cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name;
            cmd.Parameters.Add("@Position", SqlDbType.VarChar).Value = Position;
            cmd.Parameters.Add("@Cell", SqlDbType.VarChar).Value = Cell;
            cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
            cmd.Parameters.Add("@Company", SqlDbType.VarChar).Value = companyName;         
            gridContactPersons.DataSource = GetData(cmd);
            gridContactPersons.DataBind();
            Response.Redirect(Request.RawUrl);
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Write("<script type='text/javascript'>window.close();</script>");
        }
    }
}