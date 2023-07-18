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
    public partial class Subscription : System.Web.UI.Page
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
                    // If user not logged in then show login option and hide admin and logout options
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

        protected void btnSubmitSubscription_Click(object sender, EventArgs e)
        {
            // Checks if at least one of the fields has a value. Otherwise, it will run the else
            if (tboxSubscriptionEmail.Text != "" || tboxSubscriptionPhone.Text != "")
                {
                // create a string variable to store our login credentials to our database
                string strConn = ConfigurationManager.ConnectionStrings["S22_kslarnoulConnectionString"].ConnectionString;

                using (SqlConnection sqlConn = new SqlConnection(strConn))
                {
                    SqlCommand InsertSubscription = new SqlCommand("spInsertSubscription", sqlConn);
                    InsertSubscription.CommandType = CommandType.StoredProcedure;
                    // Tells the code that spInsertSubscription is a stored procedure and not direct SQL

                    // Build our input parameters
                    InsertSubscription.Parameters.AddWithValue("@Email", tboxSubscriptionEmail.Text);
                    InsertSubscription.Parameters.AddWithValue("@PhoneNumber", tboxSubscriptionPhone.Text);

                    try
                    {
                        sqlConn.Open();

                        InsertSubscription.ExecuteNonQuery();

                        //Clear the form
                        tboxSubscriptionEmail.Text = "";
                        tboxSubscriptionPhone.Text = "";

                        // Output success message if it works
                        lblSubscriptionMessage.Attributes.CssStyle.Add("color", "#000000");
                        lblSubscriptionMessage.Text = "You have successfully been subscribed!";

                    }
                    catch (SqlException exc)
                    {
                        // "basic" error messasaing, very long and not user friendly
                        //lblSubscriptionMessage.Text = exc.Message;

                        if (exc.Number == 2601)
                        {
                            lblSubscriptionMessage.Attributes.CssStyle.Add("color", "#FF3300");
                            lblSubscriptionMessage.Text = "This email/phone number is already in use with another account.";
                        }
                        else
                        {
                            lblSubscriptionMessage.Attributes.CssStyle.Add("color", "#FF3300");
                            lblSubscriptionMessage.Text = exc.Message;
                        }

                        //Clear the form
                        tboxSubscriptionEmail.Text = "";
                        tboxSubscriptionPhone.Text = "";
                    }
                }
            }
            else
            {
                // If both of the fields are blank we tell the user not to do that
                lblSubscriptionMessage.Attributes.CssStyle.Add("color", "#FF3300");
                lblSubscriptionMessage.Text = "Please enter a value for at least one of the above fields!";
            }
           
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            tboxSubscriptionEmail.Text = "";
            tboxSubscriptionPhone.Text = "";
        }
    }
}