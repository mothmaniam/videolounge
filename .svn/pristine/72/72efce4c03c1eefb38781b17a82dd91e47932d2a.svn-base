using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using DB;
using Encryption;

namespace videolounge
{
    public partial class EditUser : System.Web.UI.Page
    {
        private static string status;
        private static string resultPassword;
        private static string selected_user;
        private static int emp_id;
        private static string resultStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                status = ""; resultPassword = ""; selected_user = ""; resultStatus = ""; emp_id = 0;
                txtConfirmNewPassword.Text = ""; txtNewPassword.Text = "";
                ddlEmployee.Items.Add("--Please Select--");
                loadEmployees();
                btnUpdateUser.Enabled = false;
                btnUpdateUser.CssClass = "silverButtonDisabled";
                radioStatusActive.Enabled = false;
                radioStatusInactive.Enabled = false;
                txtConfirmNewPassword.Enabled = false;
                txtNewPassword.Enabled = false;
            }
        }

        private void loadEmployees()
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
                    string sqlQuery = "SELECT Username FROM Employees WHERE Status = 'active'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        string users = datatb.Rows[i]["Username"].ToString();
                        ddlEmployee.Items.Add(users);
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmployee.SelectedValue.ToString().Equals("--Please Select--"))
            {
                btnUpdateUser.Enabled = false;
                btnUpdateUser.CssClass = "silverButtonDisabled";
                txtConfirmNewPassword.Enabled = false;
                txtNewPassword.Enabled = false;
                radioStatusActive.Enabled = false;
                radioStatusInactive.Enabled = false;
            }
            else
            {
                selected_user = ddlEmployee.SelectedValue.ToString();
                loadEmployeeInfo(selected_user);
                btnUpdateUser.Enabled = true;
                btnUpdateUser.CssClass = "silverButton";
                txtConfirmNewPassword.Enabled = true;
                txtNewPassword.Enabled = true;
                radioStatusActive.Enabled = true;
                radioStatusInactive.Enabled = true;
            }
        }

        private void loadEmployeeInfo(string username)
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
                    string sqlQuery = "SELECT Employee_ID, Password, Status FROM Employees WHERE Username = '" + username + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        resultPassword = datatb.Rows[i]["Password"].ToString();
                        resultStatus = datatb.Rows[i]["Status"].ToString();
                        status = resultStatus;
                        emp_id = Convert.ToInt32(datatb.Rows[i]["Employee_ID"].ToString());

                        if (resultStatus.Equals("active"))
                        {
                            radioStatusActive.Checked = true;
                            radioStatusInactive.Checked = false;
                        }
                        else if (resultStatus.Equals("inactive"))
                        {
                            radioStatusActive.Checked = false;
                            radioStatusInactive.Checked = true;
                        }
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

        private void update_user(int user_id)
        {
            if (txtNewPassword.Text.Equals("") && txtConfirmNewPassword.Text.Equals(""))
            {
                //check if password fields are empty - if they are, only update status
                SqlCommand cmdMyQuery = new SqlCommand("UPDATE [Employees] SET [Status]='" + status + "' WHERE [Employee_ID] = '" + emp_id + "'");
                int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                lblMessageHeader.Text = "Successfully updated status!";
            }
            else if (!txtNewPassword.Text.Equals("") && !txtConfirmNewPassword.Text.Equals(""))
            {
                //they want to update their password - check that the new password and the confirm fields are not empty
                //when it doesn't match, show message below
                if (!txtNewPassword.Text.Equals(txtConfirmNewPassword.Text))
                {
                    //check if new password fields match. if not, display msg below.
                    lblMessageHeader.Text = "New passwords do not match!";
                    txtNewPassword.Text = ""; txtConfirmNewPassword.Text = "";
                    txtNewPassword.Focus();
                }
                else
                {
                    //update password and status
                    string newPassword = Encrypt.ComputeHash(txtNewPassword.Text, "SHA512", null);
                    SqlCommand cmdMyQuery = new SqlCommand("UPDATE [Employees] SET [Password]='" + newPassword + "', [Status]='" + status + "' WHERE [Employee_ID] = '" + emp_id + "'");
                    int sql = DBUtils.ExecuteSQLCommand(cmdMyQuery);
                    lblMessageHeader.Text = "Successfully updated password and status!";
                }
            }
            else if(!txtNewPassword.Text.Equals("") && txtConfirmNewPassword.Text.Equals(""))
            {
                lblMessageHeader.Text = "Please enter the password and password confirmation fields!";
                txtNewPassword.Focus();
            }
            else if(txtNewPassword.Text.Equals("") && !txtConfirmNewPassword.Text.Equals(""))
            {
                lblMessageHeader.Text = "Please enter the password and password confirmation fields!";
                txtNewPassword.Focus();
            }
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            update_user(emp_id);
        }

        protected void radioStatusActive_CheckedChanged(object sender, EventArgs e)
        {
            status = "active";
        }

        protected void radioStatusInactive_CheckedChanged(object sender, EventArgs e)
        {
            status = "inactive";
        }
    }
}