using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DB;
using Encryption;
using System.Web.Configuration;
using System.Data;

namespace videolounge
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text.Equals("") || txtPassword.Text.Equals("") || txtConfirmPassword.Text.Equals(""))
            {
                lblMessageHeader.Text = "Please enter all the fields to add a new user!";
                txtUsername.Focus();
            }
            else
            {
                if (!txtPassword.Text.Equals(txtConfirmPassword.Text))
                {
                    lblMessageHeader.Text = "The passwords do not match!";
                    txtPassword.Text = "";
                    txtConfirmPassword.Text = "";
                    txtPassword.Focus();
                }
                else
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
                            string sqlQuery = "SELECT Count(Username) FROM Employees WHERE Username = '" + txtUsername.Text + "'";
                            mySQLCommand.CommandText = sqlQuery;
                            datatb = new DataTable();
                            da = new SqlDataAdapter(mySQLCommand);
                            da.Fill(datatb);
                            count = (Int32)mySQLCommand.ExecuteScalar();
                            if (count == 0)
                            {
                                string password = Encrypt.ComputeHash(txtPassword.Text, "SHA512", null);
                                addUser(txtUsername.Text, password);
                                lblMessageHeader.Text = "New user successfully added!";
                            }
                            else if(count >=1)
                            {
                                lblMessageHeader.Text = "Username already exists. Please choose another.";
                            }
                            //for (int i = 0; i < datatb.Rows.Count; i++)
                            //{
                                
                                //string resultUser = datatb.Rows[i]["Username"].ToString();
                                //if (resultUser.Equals(txtUsername.Text))
                                //{
                                //    lblMessageHeader.Text = "Username already exists. Please choose another.";
                                //}
                                //else
                                //{
                                //    string password = Encrypt.ComputeHash(txtPassword.Text, "SHA512", null);
                                //    addUser(txtUsername.Text, password);
                                //    lblMessageHeader.Text = "New user successfully added!";
                                //}
                            //}
                        }
                        da = null;
                        datatb = null;
                    }
                    catch (Exception ex) { Response.Write(ex.Message); }
                }
            }
        }

        private void addUser(string theUsername, string thePassword)
        {
            string sqlQuery = "INSERT INTO [Employees] ([Username], [Password], [Status]) VALUES (@Username, @Password, @Status)";
            string connectionString = WebConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;

            SqlConnection employeeConnection = new SqlConnection(connectionString);
            SqlCommand mySQLCommand = new SqlCommand(sqlQuery, employeeConnection);

            lblMessageHeader.Text = "";

            try
            {
                using (employeeConnection)
                {
                    employeeConnection.Open();

                    mySQLCommand.CommandText = sqlQuery;

                    mySQLCommand.Parameters.AddWithValue("@Username", theUsername);
                    mySQLCommand.Parameters.AddWithValue("@Password", thePassword);
                    mySQLCommand.Parameters.AddWithValue("@Status", "active");

                    mySQLCommand.CommandType = CommandType.Text;

                    mySQLCommand.ExecuteNonQuery();
                    employeeConnection.Close();
                }
            }
            catch (Exception e) { Response.Write(e.Message); }
        }
    }
}