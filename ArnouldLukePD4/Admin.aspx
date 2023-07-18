<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="ArnouldLukePD4.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Console - Precision Computer Professionals</title>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;1,400;1,700&display=swap" rel="stylesheet" />
    <link href="Content/MyCss.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="flex-wrapper">
            <div class="container-fluid p-0">
                <%-- Begin Navbar --%>
                <div class="row gx-0 navbar-nav bottom-border">
                    <nav class="navbar navbar-expand-sm navbar-nav navbar-light sticky-top">
                        <%-- Page Logo --%>
                        <div>
                            <a href="Home.aspx" class="navbar-brand">
                                <img src="Images/PCP%20Full.png" class="logo" alt="Precision Computer Professionals Logo" />
                            </a>
                        </div>
                        <%-- End Page Logo --%>

                        <%-- Collapsible Button --%>
                        <div class="menuburger p-3">
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        </div>

                        <div id="collapsibleNavbar" class="collapse navbar-collapse">

                            <ul class="nav-button navbar-nav navbar-hamburger">
                                <li class="nav-item">
                                    <a href="Home.aspx" class="nav-link">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a href="Services.aspx" class="nav-link">Services</a>
                                </li>
                                <li class="nav-item">
                                    <a href="Subscription.aspx" class="nav-link">Subscription</a>
                                </li>
                                <li class="nav-item">
                                    <a href="AboutUs.aspx" class="nav-link">About Us</a>
                                </li>
                                <li class="nav-item">
                                    <a id="LoginSignupMenuItem" runat="server" href="Login.aspx" class="nav-link">Login/Sign Up</a>
                                </li>
                                <li class="nav-item">
                                    <a id="AdminMenuItem" runat="server" href="Admin.aspx" class="nav-link">Admin</a>
                                </li>
                                <li class="nav-item">
                                    <a id="LogoutMenuItem" runat="server" class="nav-link" onserverclick="LogoutMenuItem_Click">Logout</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
                <%-- End navbar --%>

                <%-- Page title --%>
                <div class="row gx-0">
                    <div class="col-sm-12 p-3 d-flex align-content-center justify-content-center">
                        <h1>Admin Page
                        </h1>
                    </div>
                </div>
                <%-- End Page Title --%>

                <%-- Begin controls --%>
                <div class="row gx-0 mt-4">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-4 controlspacing p-3">
                        <p>Use the below forms to add options for drop-down lists on the site. Both fields are populated on the account creation page. </p>
                    </div>
                    <div class="col-sm-4">
                    </div>
                </div>

                <%-- Text field with label and validator --%>
                <div class="row gx-0 pe-2">
                    <div class="col-sm-4 controlspacing mylabel text-center">
                        <label>Preferred OS Versions</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxPreferredOSAdmin" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing d-flex justify-content-center align-content-center">
                        <asp:Button ID="btnSaveOS" runat="server" Text="Save" ForeColor="White" Font-Size="Small" class="button m-1" OnClick="btnSaveOS_Click" />
                        <asp:Button ID="btnCancelOS" runat="server" Text="Cancel" ForeColor="White" Font-Size="Small" class="cancel-button m-1" OnClick="btnCancelOS_Click" CausesValidation="False" />
                    </div>
                </div>
                <div class="d-flex justify-content-center align-content-center">
                    <asp:Label ID="lblInsertPreferredOSMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                </div>
                <%-- End text field with label and validator --%>

                <%-- Text field with label and validator --%>
                <div class="row gx-0 pe-2">
                    <div class="col-sm-4 controlspacing mylabel text-center">
                        <label>Ways User Made Aware of PCP</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxAwarenessAdmin" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing d-flex justify-content-center align-content-center">
                        <asp:Button ID="btnSaveAwareness" runat="server" Text="Save" ForeColor="White" Font-Size="Small" class="button m-1" OnClick="btnSaveAwareness_Click" />

                        <asp:Button ID="btnCancelAwareness" runat="server" Text="Cancel" ForeColor="White" Font-Size="Small" class="cancel-button m-1" OnClick="btnCancelAwareness_Click" CausesValidation="False" />
                    </div>
                </div>
                <div class="d-flex justify-content-center align-content-center pb-3">
                    <asp:Label ID="lblInsertAwarenessMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                </div>
                <%-- End text field with label and validator --%>
            </div>

            <%-- Begin footer --%>
            <div class="row gx-0 footercustom h-auto p-3 top-border">
                <div class="col-sm-4 p-3 text-center">
                    <p>
                        <b>Contact Us:</b><br />
                        (405) 999-9999<br />
                        questions@pcp.com
                    </p>
                </div>
                <div class="col-sm-4 p-3 text-center">
                    <p class="">
                        <b>Connect with us:</b><br />
                        @pcprofessionals
                    </p>
                </div>
                <div class="col-sm-4 p-3 text-center">
                    <p>
                        © Precision Computer Professionals LLC 2022<br />
                        <a class="whitelink" href="mailto:luke.arnould@okstate.edu"><u>Contact the Webmaster</u></a>
                    </p>
                </div>
            </div>
            <%-- End footer --%>
        </div>
    </form>
</body>
</html>
