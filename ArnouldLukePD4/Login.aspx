<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="ArnouldLukePD4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Precision Computer Professionals</title>
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
                    <div class="col-sm-12 p-3">
                        <h1 class="d-flex align-content-center justify-content-center">Login
                        </h1>
                    </div>
                </div>
                <%-- End Page Title --%>

                <%-- Begin account creation prompt --%>
                <div class="d-flex justify-content-center">
                    <a href="AccountCreation.aspx" class="greenlink">Need to create an account?</a>
                </div>
                <%-- End account creation prompt --%>

                <%-- Begin email text field with label and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Email Address</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxUserEmail" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvUserEmail" runat="server" ErrorMessage="Required field!" ControlToValidate="tboxUserEmail" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmailFormatCheck" runat="server" ErrorMessage="Please enter a valid email" ControlToValidate="tboxUserEmail" ForeColor="#FF3300" ValidationExpression="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <%-- End email text field with label and validator --%>

                <%-- Begin password text field with label and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Password</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxUserPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvUserPassword" runat="server" ErrorMessage="Required field!" ControlToValidate="tboxUserPassword" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <%-- End password text field with label and validator --%>

                <%-- A nice submit button --%>
                <div class="d-flex justify-content-center m-3">
                    <asp:Button ID="btnSubmitSignUp" runat="server" Text="Submit" ForeColor="White" Font-Size="Large" ClientIDMode="Static" class="button" OnClick="btnSubmitSignUp_Click" />
                </div>
                <%-- End submit button --%>

                <%-- Cancel button--%>
                <div class="d-flex justify-content-center m-3">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ForeColor="White" Font-Size="Small" ClientIDMode="Static" class="cancel-button" CausesValidation="False" OnClick="btnCancel_Click" />
                </div>
                <%-- End cancel button --%>

                <%-- Message label --%>
                <div class="d-flex justify-content-center p-3">
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <%-- End message label --%>
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
