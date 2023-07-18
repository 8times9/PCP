using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ArnouldLukePD4
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Checks if the user is logged in or not
                if (Session["currentUser"] != null)
                {

                    // If logged in, create instance of their CurrentUser data
                    UserRecord currentUser = new UserRecord();
                    // Turns session variable into formatting of having AccountID, FirstName, etc
                    currentUser = (UserRecord)Session["currentUser"];

                    // If they are logged in, then check if they are an admin or not
                    if (currentUser.RoleID == 2)
                    {
                        // If they are an admin, show the admin and logout menus options and hide login option
                        AdminMenuItem.Attributes.CssStyle.Add("display", "block");

                        LoginSignupMenuItem.Attributes.CssStyle.Add("display", "none");
                        LogoutMenuItem.Attributes.CssStyle.Add("display", "block");
                    }
                    else
                    {
                        // If they are not an admin, hide the admin and login options and show logout option
                        AdminMenuItem.Attributes.CssStyle.Add("display", "none");
                        LoginSignupMenuItem.Attributes.CssStyle.Add("display", "none");
                        LogoutMenuItem.Attributes.CssStyle.Add("display", "block");
                    }

                }
                else
                {
                    //If user not logged in then login shown, logout and admin hidden
                    LoginSignupMenuItem.Attributes.CssStyle.Add("display", "block");
                    LogoutMenuItem.Attributes.CssStyle.Add("display", "none");
                    AdminMenuItem.Attributes.CssStyle.Add("display", "none");
                }
            }
        }

        protected void LogoutMenuItem_Click(object sender, EventArgs e)
        {
            // When the user clicks the Logout menu item we will set their Session variable to null
            Session["currentUser"] = null;

            // And then we will hide and show the appropriate menu items
            LoginSignupMenuItem.Attributes.CssStyle.Add("display", "block");
            LogoutMenuItem.Attributes.CssStyle.Add("display", "none");
            AdminMenuItem.Attributes.CssStyle.Add("display", "none");

            // Finally we will redirect them to the homescreen
            Response.Redirect("~/Home.aspx");
        }

        protected void btnSubmitSignUp_Click(object sender, EventArgs e)
        {
            // create a string variable to store our login credentials to our database
            string strConn = ConfigurationManager.ConnectionStrings["S22_kslarnoulConnectionString"].ConnectionString;

            using (SqlConnection sqlConn = new SqlConnection(strConn))
            {
                // Use SQlDataAdapter to retrieve the user record into our code
                SqlDataAdapter sqlDAValidate = new SqlDataAdapter("spValidateAccount",sqlConn);
                // We have to tell it we are using a stored procedure thus the below line
                sqlDAValidate.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Create our input parameters
                sqlDAValidate.SelectCommand.Parameters.AddWithValue("@Email", tboxUserEmail.Text);
                sqlDAValidate.SelectCommand.Parameters.AddWithValue("@UserPassword", tboxUserPassword.Text);
                
                try
                {
                    // define a dataset (mini table) for the user record to come back into from database
                    DataSet dsUserRecord = new DataSet();

                    // Execute the stored procedure
                    sqlDAValidate.Fill(dsUserRecord);

                    //Check if we found a user record
                    if (dsUserRecord.Tables[0].Rows.Count == 0)
                    {
                        lblMessage.Text = "Invalid login, please try again";
                    }
                    else
                    {
                        // create an instance of the UserRecord.cs class
                        UserRecord currentUser = new UserRecord();

                        // Move each value from each column into the user record class
                        currentUser.AccountID = Convert.ToInt32(dsUserRecord.Tables[0].Rows[0]["AccountID"]);
                        currentUser.FirstName = dsUserRecord.Tables[0].Rows[0]["FirstName"].ToString();
                        currentUser.LastName = dsUserRecord.Tables[0].Rows[0]["LastName"].ToString();
                        currentUser.PreferredOS = Convert.ToInt32(dsUserRecord.Tables[0].Rows[0]["PreferredOS"]);
                        currentUser.Awareness = Convert.ToInt32(dsUserRecord.Tables[0].Rows[0]["Awareness"]);
                        currentUser.DOB = Convert.ToDateTime(dsUserRecord.Tables[0].Rows[0]["DOB"]);
                        currentUser.Email = dsUserRecord.Tables[0].Rows[0]["Email"].ToString();
                        currentUser.PhoneNumber = dsUserRecord.Tables[0].Rows[0]["PhoneNumber"].ToString();
                        currentUser.RoleID = Convert.ToInt32(dsUserRecord.Tables[0].Rows[0]["RoleID"]);

                        Session["CurrentUser"] = currentUser;

                        tboxUserEmail.Text = "";
                        tboxUserPassword.Text = "";

                        if (currentUser.RoleID == 2)
                        {
                            // This means I am an admin user
                            Response.Redirect("~/Admin.aspx");
                        }
                        else
                        {
                            // This means I am not an admin user
                            Response.Redirect("~/Services.aspx");
                        }

                    }

                }

                catch (Exception exc)
                {
                    // Display any errors encountered in the login process
                    lblMessage.Text = exc.Message;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Clear the text fields after clicking cancel button
            tboxUserEmail.Text = "";
            tboxUserPassword.Text = "";
        }
    }
}