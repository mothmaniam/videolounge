using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using Encryption;

namespace videolounge
{
    public partial class Login : System.Web.UI.Page
    {

        private static string resultUsername, resultPassword;

        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                verifyUser(txtUsername.Text, txtPassword.Text);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void verifyUser(string the_username, string the_password)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection customerConnection = new SqlConnection(connectionString);
            SqlDataAdapter da = null;
            DataTable datatb = null;
            SqlCommand mySQLCommand = new SqlCommand();
            mySQLCommand.Connection = customerConnection;
            int count = 0;
            resultUsername = "";
            resultPassword = "";

            try
            {
                using (customerConnection)
                {
                    customerConnection.Open();
                    string sqlQuery = "SELECT [Username], [Password] FROM [Employees] WHERE [Username] = '" + the_username + "'";
                    mySQLCommand.CommandText = sqlQuery;
                    datatb = new DataTable();
                    da = new SqlDataAdapter(mySQLCommand);
                    da.Fill(datatb);
                    count = mySQLCommand.ExecuteNonQuery();
                    for (int i = 0; i < datatb.Rows.Count; i++)
                    {
                        resultUsername = datatb.Rows[i]["Username"].ToString();
                        resultPassword = datatb.Rows[i]["Password"].ToString();
                    }

                    customerConnection.Close();

                    if (resultUsername == null || resultUsername.Equals(""))
                    {
                        lblMessage.Text = "User does not exist!";
                    }
                    else
                    {
                        bool flag = Encrypt.VerifyHash(the_password, "SHA512", resultPassword);
                        if (flag == true)
                        {
                            Session["currentUser"] = the_username;
                            Response.Redirect("ViewCompany.aspx", true);
                        }
                        else
                        {
                            lblMessage.Text = "Incorrect password!";
                        }
                    }
                }
                da = null;
                datatb = null;
            }
            catch (Exception e) { Response.Write(e.Message); }
        }

    }
}