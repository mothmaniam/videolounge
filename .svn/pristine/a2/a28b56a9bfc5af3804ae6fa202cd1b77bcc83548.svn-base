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


namespace DB
{
/// Abstracts Database connectivity and provides SQL Injection Prevention Mechanism
    public static class DBUtils
    {
        /// Returns the results of a SQL Query in the form of a DataTable

        public static DataTable SQLSelect(SqlCommand cmdSQLQuery)
        {
            //Get connection string
            string conConnectionString = ConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection SQLDatabaseConnection = new SqlConnection(conConnectionString);
            //Perform Command
            cmdSQLQuery.Connection = SQLDatabaseConnection;
            DataSet dsPageInfo = new DataSet();
            SqlDataAdapter daPageInfo = new SqlDataAdapter(cmdSQLQuery);
            using (SQLDatabaseConnection)
            {
                SQLDatabaseConnection.Open();
                daPageInfo.Fill(dsPageInfo);
                SQLDatabaseConnection.Close();
            }
            return dsPageInfo.Tables[0];
        }
        /// Executes a SQL Command
        public static int ExecuteSQLCommand(SqlCommand CommandToExecute)
        {
            int count = 0; ; count++;
            //get connection string
            string conConnectionString = ConfigurationManager.ConnectionStrings["videoloungeConnectionString"].ConnectionString;
            SqlConnection SQLDatabaseConnection = new SqlConnection(conConnectionString);
            //execute command
            CommandToExecute.Connection = SQLDatabaseConnection;
            using (SQLDatabaseConnection)
            {
                SQLDatabaseConnection.Open();
                CommandToExecute.ExecuteNonQuery();
                SQLDatabaseConnection.Close();
            }
            return count;
        }
    }
}

/*

Now, when you want to run a SQL Select Command and put the results in a DataTable for use, you can just do this:

SqlCommand cmdMyQuery2 = new SqlCommand("Select * From Users where username=@username");
cmdMyQuery2.Parameters.AddWithValue("@username", "Matt");
DataTable dtResults = dbutils.SQLSelect(cmdMyQuery2);

If you want to run a command, just do this:

SqlCommand cmdMyQuery2 = new SqlCommand("insert into users (username) VALUES (@username)");
cmdMyQuery2.Parameters.AddWithValue("@username", "Matt");
DataTable dtResults = dbutils.ExecuteSQLCommand(cmdMyQuery2);


*/