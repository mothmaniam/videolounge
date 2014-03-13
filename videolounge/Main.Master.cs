using System;

namespace videolounge
{
    public partial class Main : System.Web.UI.MasterPage
    {
        private static string theUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["currentUser"] == null)
                {
                    Response.Redirect("Login.aspx", true);
                }
                else
                {
                    //theUser = Session["currentUser"].ToString();
                    //lblUser.Text = "Current User - " + theUser;
                }
            }
            catch (Exception ex) { Response.Write(ex.Message); }
        }
    }
}