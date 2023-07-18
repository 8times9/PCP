<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ArnouldLukePD4.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - Precision Computer Professionals</title>
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

            <%-- Begin banner image --%>
            <homebanner class="row gx-0 bottom-border">
                <div class="col-12 bannertext p-5">
                    <h1>Computer Repairs. Reimagined.
                    </h1>
                </div>
            </homebanner>
            <%-- End banner image --%>

            <%-- Begin primary page content --%>
            <div class="row gx-0 p-2 mt-3 mb-3">

                <%-- Begin paragraph, customer rating, and view services button --%>
                <div class="col-sm-6 d-flex flex-column justify-content-between">
                    <p class="p-4 mt-0">
                        We are dedicated to bringing the best out of your technology all while minimizing frustrations with the typical wait time for your computer to be fixed. Bringing your computer in to be repaired elsewhere can be stressful experience, but we want to do everything to make this a good and predictable experience for you, like having your car's oil changed. 
                    </p>
                    <div>
                        <p class="rating-stars text-center mb-0">⭐⭐⭐⭐</p>
                        <h3 class="text-center">Customer Rating
                        </h3>
                    </div>

                    <div class="d-flex justify-content-center p-4">
                        <%-- A very nice button below --%>
                        <asp:Button ID="btnServices" runat="server" Text="View Our Services!" ForeColor="White" Font-Size="Large" href="Services.aspx" class="button" OnClick="btnServices_Click" />
                    </div>
                </div>
                <%-- End paragraph, customer rating, and view services button --%>

                <%-- Begin map embed --%>
                <div class="col-sm-6 p-3 d-flex flex-column justify-content-center">
                    <h2 class="text-center">Visit Us</h2>
                    <div class="ratio ratio-16x9 p-5">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3058.7771089387184!2d-75.17675668386154!3d39.946375092033094!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c6c7bb21ae6d1b%3A0xb538d6cbb35cc0d3!2sComputer%20Repair%20Near%20Me!5e0!3m2!1sen!2sus!4v1650329357668!5m2!1sen!2sus" width="300" height="150" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
                <%-- End map embed --%>
            </div>
            <%-- End primary page content --%>

            <%-- Start three images --%>
            <div class="row greenbackground top-border gx-0">
                <div class="col-sm-4">
                    <img src="Images/HomeImg1.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Computer motherboard" />
                </div>
                <div class="col-sm-4">
                    <img src="Images/HomeImg2.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Disassembled Apple MacBook" />
                </div>
                <div class="col-sm-4">
                    <img src="Images/HomeImg3.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Closeup of electronic chip" />
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
    </form>
</body>
</html>
