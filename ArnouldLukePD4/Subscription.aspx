<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscription.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="ArnouldLukePD4.Subscription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subscribe - Precision Computer Professionals</title>
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

                <%-- Begin page title --%>
                <div class="row gx-0">
                    <div class="col-sm-12 p-3">
                        <h1 class="d-flex align-content-center justify-content-center">Subscription
                        </h1>
                    </div>
                </div>
                <%-- End page title --%>

                <%-- Begin main page content --%>
                <div class="row gx-0 controlspacing">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-4 controlspacing p-3">
                        <p>Stay connected with us for news of how we can take care of your computer as well as coupons. Enter your email and/or telephone number below to receive email and text message updates.</p>
                    </div>
                    <div class="col-sm-4">
                    </div>
                </div>

                <%-- Begin email address field with label and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing text-center mylabel">
                        <label>Email Address</label>
                    </div>
                    <div class="col-sm-4 controlspacing">
                        <asp:TextBox ID="tboxSubscriptionEmail" runat="server" class="form-control" ValidationGroup="Subscription"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:RegularExpressionValidator ID="revEmailFormatCheck" runat="server" ErrorMessage="Please enter a valid email" ControlToValidate="tboxSubscriptionEmail" ForeColor="#FF3300" ValidationExpression="(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])" Display="Dynamic" ValidationGroup="Subscription"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <%-- End email address field with label and validator --%>

                <%-- Begin phone number field with label and validator --%>
                <div class="row gx-0">
                    <div class="col-sm-4 controlspacing text-center mylabel">
                        <label>Phone Number</label>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:TextBox ID="tboxSubscriptionPhone" class="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                    </div>
                    <div class="col-sm-4 controlspacing text-center">
                        <asp:RegularExpressionValidator ID="revPhoneNumber" ForeColor="#FF3300" runat="server" ErrorMessage="RegularExpressionValidator" Text="Please enter a valid phone number" Display="Dynamic" ControlToValidate="tboxSubscriptionPhone" ValidationGroup="Subscription" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <%-- End phone number field with label and validator --%>

                <%-- End main page content --%>

                <%-- Begin submit button --%>
                <div class="d-flex justify-content-center m-3">
                    <asp:Button ID="btnSubmitSubscription" runat="server" Text="Submit" BackColor="#00B865" ForeColor="White" Font-Size="Large" class="button" OnClick="btnSubmitSubscription_Click" ValidationGroup="Subscription" />
                </div>
                <%-- End submit button --%>

                <%-- Cancel button--%>
                <div class="d-flex justify-content-center m-3">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ForeColor="White" Font-Size="Small" ClientIDMode="Static" class="cancel-button" CausesValidation="False" OnClick="btnCancel_Click" />
                </div>
                <%-- End cancel button --%>

                <%-- Begin error message label --%>
                <div class="text-center p-3">
                    <asp:Label ID="lblSubscriptionMessage" runat="server" Text=""></asp:Label>
                </div>
                <%-- End error message label --%>
            </div>

            <%-- Images and footer thrown into div together so they get pushed to bottom of screen regardless --%>
            <div>
                <%-- Start three images --%>
                <div class="row gx-0 greenbackground top-border">
                    <div class="col-sm-4">
                        <img src="Images/Subscription_1.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Lots of sales tags" />
                    </div>
                    <div class="col-sm-4">
                        <img src="Images/Subscription_2.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Lego figure holding a removed keyboard key cap" />
                    </div>
                    <div class="col-sm-4">
                        <img src="Images/Subscription_3.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Fully disassembled and laid out microchip" />
                    </div>
                </div>
                <%-- End three images --%>

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
        </div>
    </form>
</body>
</html>
