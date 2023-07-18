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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserRecord currentUser = new UserRecord();

            // Checks if user is currently logged in
            if (Session["currentUser"] != null)
            {
                // If they are, we set the instance of currentUser to match their Session variable. 
                currentUser = (UserRecord)Session["currentUser"];

                // Next we check if their RoleID matches 2, that of the admin
                if (currentUser.RoleID == 2)
                {
                    // If it does then they can access this page as normally so no code is reuqired here

                }
                else
                {
                    // If they are logged in but not an admin, they should not be on this page, and will be redirected to home page
                    Response.Redirect("~/Home.aspx");
                }

            }
            else
            {
                // If they are not logged in whatsoever, then we give the benefit of the doubt that the user is an admin who needs to log in first and send them to Login page
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                // Checks if the user is logged in or not
                if (Session["currentUser"] != null)
                {
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

        protected void btnSaveOS_Click(object sender, EventArgs e)
        {
            //Ensure admin input is not blank 
            if (tboxPreferredOSAdmin.Text != "")
            {
                // create a string variable to store our login credentials to our database
                string strConn = ConfigurationManager.ConnectionStrings["S22_kslarnoulConnectionString"].ConnectionString;

                using (SqlConnection sqlConn = new SqlConnection(strConn))
                {
                    SqlCommand InsertPreferredOS = new SqlCommand("spInsertPreferredOS", sqlConn);
                    InsertPreferredOS.CommandType = CommandType.StoredProcedure;
                    // Tells the code that spInsertPreferredOS is a stored procedure and not direct SQL

                    // Build our input parameters
                    InsertPreferredOS.Parameters.AddWithValue("@PreferredOSDesc", tboxPreferredOSAdmin.Text);

                    try
                    {
                        sqlConn.Open();

                        InsertPreferredOS.ExecuteNonQuery();

                        //Clear the form
                        tboxPreferredOSAdmin.Text = "";

                        // Output success message if it works
                        lblInsertPreferredOSMessage.Attributes.CssStyle.Add("color", "#000000");
                        lblInsertPreferredOSMessage.Text = "Item successfully added to drop down list";

                    }
                    catch (SqlException exc)
                    {
                        // "basic" error messasaing, very long and not user friendly
                        //lblMessage.Text = exc.Message;

                        //Checks if the entry is a duplicate, and if so, tells the user. Otherwise we display the error message as usual.
                        if (exc.Number == 2601)
                        {
                            lblInsertPreferredOSMessage.Attributes.CssStyle.Add("color", "#FF3300");
                            lblInsertPreferredOSMessage.Text = "This item is already existent in the drop down list";
                        }
                        else
                        {
                            lblInsertPreferredOSMessage.Attributes.CssStyle.Add("color", "#FF3300");
                            lblInsertPreferredOSMessage.Text = exc.Message;
                        }
                    }
                }
            }
            else
            {
                // If the text box is blank and the user pressed submit then we tell them so
                lblInsertPreferredOSMessage.Attributes.CssStyle.Add("color", "#FF3300");
                lblInsertPreferredOSMessage.Text = "Input cannot be blank";
            }
            
        }

        protected void btnCancelOS_Click(object sender, EventArgs e)
        {
            // Clears the appropriate labels and fields
            tboxPreferredOSAdmin.Text = "";
            lblInsertPreferredOSMessage.Text = "";
        }

        protected void btnSaveAwareness_Click(object sender, EventArgs e)
        {
            // Ensure user input is not empty
            if (tboxAwarenessAdmin.Text != "")
            {
                // create a string variable to store our login credentials to our database
                string strConn = ConfigurationManager.ConnectionStrings["S22_kslarnoulConnectionString"].ConnectionString;

                using (SqlConnection sqlConn = new SqlConnection(strConn))
                {
                    SqlCommand InsertAwareness = new SqlCommand("spInsertAwareness", sqlConn);
                    InsertAwareness.CommandType = CommandType.StoredProcedure;
                    // Tells the code that spInsertAwareness is a stored procedure and not direct SQL

                    // Build our input parameters
                    InsertAwareness.Parameters.AddWithValue("@AwarenessDesc", tboxAwarenessAdmin.Text);

                    try
                    {
                        sqlConn.Open();

                        InsertAwareness.ExecuteNonQuery();

                        //Clear the form
                        tboxAwarenessAdmin.Text = "";

                        // Output success message if it works
                        lblInsertAwarenessMessage.Attributes.CssStyle.Add("color", "#000000");
                        lblInsertAwarenessMessage.Text = "Item successfully added to drop down list";

                    }
                    catch (SqlException exc)
                    {
                        // "basic" error messasaing, very long and not user friendly
                        //lblMessage.Text = exc.Message;

                        //Checks if the entry is a duplicate, and if so, tells the user. Otherwise we display the error message as usual.
                        if (exc.Number == 2601)
                        {
                            // Show error message for unique index violation
                            lblInsertAwarenessMessage.Attributes.CssStyle.Add("color", "#FF3300");
                            lblInsertAwarenessMessage.Text = "This item is already existent in the drop down list";
                        }
                        else
                        {
                            //Show other message if not a violation of unique index
                            lblInsertAwarenessMessage.Attributes.CssStyle.Add("color", "#FF3300");
                            lblInsertAwarenessMessage.Text = exc.Message;
                        }
                    }
                }
            }
            else
            {
                // If the text box is blank and the user pressed submit then we tell them so
                lblInsertAwarenessMessage.Attributes.CssStyle.Add("color", "#FF3300");
                lblInsertAwarenessMessage.Text = "Input cannot be blank";
            }

        }

        protected void btnCancelAwareness_Click(object sender, EventArgs e)
        {
            // Clear Awareness admin text box and message label upon clicking cancel
            tboxAwarenessAdmin.Text = "";
            lblInsertAwarenessMessage.Text = "";
        }
    }
}