<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountCreation.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="ArnouldLukePD4.AccountCreation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - Precision Computer Professionals</title>
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
                        <h1 class="d-flex align-content-center justify-content-center">Sign Up
                        </h1>
                    </div>
                </div>
                <%-- End Page Title --%>

                <div class="d-flex justify-content-center">
                    <a href="Login.aspx" class="greenlink">Already have an account?</a>
                </div>

                <%-- Begin sign up for an account controls --%>

                <%-- Begin first name label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>First Name*</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxFirstName" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="Required field!" ControlToValidate="tboxFirstName" ForeColor="#FF3300" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <%-- End first name label, text box, and validator --%>

                <%-- Begin last name label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Last Name*</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxLastName" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Required field!" ControlToValidate="tboxLastName" ForeColor="#FF3300" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <%-- End last name label, text box, and validator --%>

                <%-- Begin email label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Email*</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxEmailSignUp" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvEmailSignUp" runat="server" ErrorMessage="RequiredFieldValidator" ClientIDMode="Inherit" ControlToValidate="tboxEmailSignUp" ForeColor="#FF3300" Text="Required field!" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmailFormatCheck" runat="server" ErrorMessage="Please enter a valid email" ControlToValidate="tboxEmailSignUp" ForeColor="#FF3300" ValidationExpression="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])" Display="Dynamic" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <%-- Begin email label, text box, and validator --%>

                <%-- Begin phone number label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Phone Number</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxPhoneNumber" class="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ForeColor="#FF3300" ErrorMessage="RegularExpressionValidator" Text="Please enter a valid phone number" Display="Dynamic" SetFocusOnError="True" ControlToValidate="tboxPhoneNumber" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <%-- End phone number label, text box, and validator --%>

                <%-- Begin password label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Password*</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxPasswordSignUp" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div id="password-message" class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvPasswordSignUp" runat="server" ErrorMessage="RequiredFieldValidator" ClientIDMode="Inherit" ControlToValidate="tboxPasswordSignUp" ForeColor="#FF3300" Text="Required field!" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Please choose a stronger password including at least 8 characters, with at least 1 upper case letter, 1 lower case letter, 1 special character, and at least 1 number" ControlToValidate="tboxPasswordSignUp" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" Display="Dynamic" SetFocusOnError="True" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <%-- End password label, text box, and validator --%>

                <%-- Begin confirm password label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Confirm Password*</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxConfirmPasswordSignUp" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvConfirmPasswordSignUp" runat="server" ErrorMessage="RequiredFieldValidator" ClientIDMode="Inherit" ControlToValidate="tboxConfirmPasswordSignUp" ForeColor="#FF3300" Text="Required field!" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPasswordConfirmPassword" runat="server" ErrorMessage="Passwords must match!" ForeColor="#FF3300" ControlToValidate="tboxConfirmPasswordSignUp" ControlToCompare="tboxPasswordSignUp" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                    </div>
                </div>
                <%-- End confirm password label, text box, and validator --%>

                <%-- Begin preferred operating system label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Preferred Operating System?*</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:DropDownList ID="ddlPreferredOS" class="form-control" runat="server" DataSourceID="PreferredOSTable" DataTextField="PreferredOSDesc" DataValueField="PreferredOSID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="PreferredOSTable" runat="server" ConnectionString="<%$ ConnectionStrings:S22_kslarnoulConnectionString %>" SelectCommand="spPreferredOS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvPreferredOS" runat="server" ErrorMessage="Required field!" ControlToValidate="ddlPreferredOS" ForeColor="#FF3300" InitialValue="1" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <%-- End preferred operating system label, text box, and validator --%>

                <%-- Begin user awareness of business label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>How did you hear about us?*</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:DropDownList ID="ddlAwareness" class="form-control" runat="server" DataSourceID="AwarenessTable" DataTextField="AwarenessDesc" DataValueField="AwarenessID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="AwarenessTable" runat="server" ConnectionString="<%$ ConnectionStrings:S22_kslarnoulConnectionString %>" SelectCommand="spAwareness" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvAwareness" runat="server" ErrorMessage="Required field!" ControlToValidate="ddlAwareness" ForeColor="#FF3300" InitialValue="1" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <%-- End user awareness of business label, text box, and validator --%>

                <%-- Begin user date of birth label, text box, and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing mylabel">
                        <label>Date of Birth*</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxDOB" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing validator-alignment">
                        <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ErrorMessage="Required field!" ControlToValidate="tboxDOB" ForeColor="#FF3300" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <%-- End user date of birth label, text box, and validator --%>

                <%-- A nice submit button --%>
                <div class="d-flex justify-content-center m-3">
                    <asp:Button ID="btnSubmitSignUp" runat="server" Text="Submit" ForeColor="White" Font-Size="Large" ClientIDMode="Static" class="button" OnClick="btnSubmitSignUp_Click" />
                </div>
                <%-- End submit button --%>

                <%-- Cancel button--%>
                <div class="d-flex justify-content-center m-3">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ForeColor="White" Font-Size="Small" ClientIDMode="Static" class="cancel-button" OnClick="btnCancel_Click" CausesValidation="False" />
                </div>
                <%-- End cancel button --%>

                <%-- Error message label --%>
                <div class="text-center p-3">
                    <asp:Label ID="lblMessage" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                </div>
                <%-- End error message label --%>

                <%-- End sign up for an account controls --%>
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
