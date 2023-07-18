using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArnouldLukePD4
{
    public partial class Home : System.Web.UI.Page
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
                    // If user is not logged in then we show the login option and hide logout and admin options
                    LoginSignupMenuItem.Attributes.CssStyle.Add("display", "block");
                    LogoutMenuItem.Attributes.CssStyle.Add("display", "none");
                    AdminMenuItem.Attributes.CssStyle.Add("display", "none");
                }
            }   
        }

        protected void btnServices_Click(object sender, EventArgs e)
        {
            // Sends the "View Our Services" button to the Services page
            Response.Redirect("~/Services.aspx");
        }

        protected void LogoutMenuItem_Click(object sender, EventArgs e)
        {
            // When the user clicks the Logout menu item we will set their Session variable to null
            Session["currentUser"] = null;

            // And then we will hide and show the appropriate menu items
            LoginSignupMenuItem.Attributes.CssStyle.Add("display", "block");
            LogoutMenuItem.Attributes.CssStyle.Add("display", "none");
            AdminMenuItem.Attributes.CssStyle.Add("display", "none");
        }
    }
}