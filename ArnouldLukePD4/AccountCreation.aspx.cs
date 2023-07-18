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
    public partial class AccountCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlPreferredOS.SelectedValue = "1";
                ddlAwareness.SelectedValue = "1";

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
                    // If the user is not logged in then we display the login menu option and hide logout and admin 
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //Clear the form
            tboxFirstName.Text = "";
            tboxLastName.Text = "";
            ddlPreferredOS.SelectedIndex = -1;
            ddlAwareness.SelectedIndex = -1;
            tboxDOB.Text = "";
            tboxEmailSignUp.Text = "";
            tboxPhoneNumber.Text = "";
            tboxPasswordSignUp.Text = "";
        }

        protected void btnSubmitSignUp_Click(object sender, EventArgs e)
        {
            // create a string variable to store our login credentials to our database
            string strConn = ConfigurationManager.ConnectionStrings["S22_kslarnoulConnectionString"].ConnectionString;

            using (SqlConnection sqlConn = new SqlConnection(strConn))
            {
                SqlCommand AddAccount = new SqlCommand("spAddAccount", sqlConn);
                AddAccount.CommandType = CommandType.StoredProcedure;
                // Tells the code that SpAddAccount is a stored procedure and not direct SQL

                // Build our input parameters
                AddAccount.Parameters.AddWithValue("@FirstName", tboxFirstName.Text);
                AddAccount.Parameters.AddWithValue("@LastName", tboxLastName.Text);
                AddAccount.Parameters.AddWithValue("@PreferredOS", ddlPreferredOS.SelectedValue);
                AddAccount.Parameters.AddWithValue("@Awareness", ddlAwareness.Text);
                AddAccount.Parameters.AddWithValue("@DOB", tboxDOB.Text);
                AddAccount.Parameters.AddWithValue("@Email", tboxEmailSignUp.Text);
                AddAccount.Parameters.AddWithValue("@PhoneNumber", tboxPhoneNumber.Text);
                AddAccount.Parameters.AddWithValue("@UserPassword", tboxPasswordSignUp.Text);

                // create one output parameter to receive back from SQL Server the accountID
                SqlParameter OutputAccountID = new SqlParameter("OutputAccountID", SqlDbType.Int);
                OutputAccountID.Direction = ParameterDirection.Output;
                AddAccount.Parameters.Add(OutputAccountID);

                try
                {
                    sqlConn.Open();

                    AddAccount.ExecuteNonQuery();

                    // Store the Account ID in a session variable
                    Session["AccountID"] = OutputAccountID.Value;

                    //Clear the form
                    tboxFirstName.Text = "";
                    tboxLastName.Text = "";
                    ddlPreferredOS.SelectedIndex = -1;
                    ddlAwareness.SelectedIndex = -1;
                    tboxDOB.Text = "";
                    tboxEmailSignUp.Text = "";
                    tboxPasswordSignUp.Text = "";

                    lblMessage.Text = "";

                    //Redirect to my login page
                    Response.Redirect("~/Login.aspx");

                }
                catch (SqlException exc)
                {
                    // "basic" error messasaing, very long and not user friendly
                    //lblMessage.Text = exc.Message;

                    // Checks if the error is the specific one which occurs if a SQL unique index is violated. 
                    if (exc.Number == 2601)
                    {
                        lblMessage.Text = "This email is already in use with another account.";
                    }
                    else
                    {
                        lblMessage.Text = exc.Message;
                    }
                }
            }
        }
    }
}