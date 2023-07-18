<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="ArnouldLukePD4.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - Precision Computer Professionals</title>
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

            <%-- Page title --%>
            <div class="row gx-0">
                <div class="col-sm-12 p-3">
                    <h1 class="d-flex align-content-center justify-content-center">About Us
                    </h1>
                </div>
            </div>
            <%-- End Page Title --%>

            <%-- Begin Carousel --%>
            <div id="aboutuscarousel" class="carousel slide carouselcustom" data-bs-ride="carousel" data-bs-internal="1000">

                <%-- Indicators --%>
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#aboutuscarousel" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#aboutuscarousel" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#aboutuscarousel" data-bs-slide-to="2"></button>
                    <button type="button" data-bs-target="#aboutuscarousel" data-bs-slide-to="3"></button>
                </div>

                <%-- The carousel --%>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/carousel1.jpg" class="img-fluid d-block mx-auto" alt="People hugging at a group event to symbolize human connection and value" />
                    </div>
                    <div class="carousel-item">
                        <img src="images/carousel2.jpg" class="img-fluid d-block mx-auto" alt="Person holding dirt and plant in hand to symbolize sustainability" />
                    </div>
                    <div class="carousel-item">
                        <img src="images/carousel3.jpg" class="img-fluid d-block mx-auto" alt="Word tiles spelling out 'Speak truth' to symbolize a dedication to honesty" />
                    </div>
                    <div class="carousel-item">
                        <img src="images/carousel4.jpg" class="img-fluid d-block mx-auto" alt="The endings of fiber optic cables to symbolize an increasingly interconnected world" />
                    </div>
                </div>

                <%-- Buttons --%>
                <button class="carousel-control-prev" type="button" data-bs-target="#aboutuscarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#aboutuscarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>
            <%-- End carousel --%>

            <%-- Begin headshots --%>
            <div class="row gx-0 greenbackground mb-2 p-1 top-border bottom-border">

                <%-- Two headshots --%>
                <div class="col-sm-6">
                    <div class="row gx-0">
                        <div class="col-6">
                            <img src="Images/Headshot%201.jpg" class="img-fluid w-100 d-block mx-auto p-3 headshot" alt="Headshot of Gideon Bowes" />
                            <h2 class="d-flex align-content-center justify-content-center headshotsize">Founder, Gideon Bowes </h2>
                        </div>
                        <div class="col-6">
                            <img src="Images/Headshot%202.jpg" class="headshot img-fluid w-100 d-block mx-auto p-3" alt="Headshot of Keenan Schmidt" />
                            <h2 class="d-flex align-content-center justify-content-center headshotsize">CEO, Keenan Schmidt </h2>
                        </div>
                    </div>
                </div>

                <%-- Next two headshots --%>
                <div class="col-sm-6">
                    <div class="row gx-0">
                        <div class="col-6">
                            <img src="Images/Headshot%203.jpg" class="headshot img-fluid w-100 d-block mx-auto p-3" alt="Headshot of Aariah Ryan" />
                            <h2 class="d-flex align-content-center justify-content-center headshotsize">Public Relations, Aairah Ryan </h2>
                        </div>
                        <div class="col-6">
                            <img src="Images/Headshot%204.jpg" class="headshot img-fluid w-100 d-block mx-auto p-3" alt="Headshot of Matteo Corbett" />
                            <h2 class="d-flex align-content-center justify-content-center headshotsize">Chief of Repairs, Matteo Corbett </h2>
                        </div>
                    </div>
                </div>
            </div>
            <%-- End headshots --%>

            <%-- Begin history and video --%>
            <div class="row gx-0 m-4">
                <div class="col-sm-6 p-4 d-flex flex-column justify-content-between">
                    <div>
                        <h2>History
                        </h2>
                        <p>
                            Precision Computer Professionals' history begins in 1984 when its founder Gideon Bowes began repairing neighbors' computers in his garage at the mere age of ten. With a rapidly-growing customer base, he then rented out a section in the shopping strip on Main St. From there, customers slowly began to flock to his growing business. Over time he gained a reputation of truthworthiness and honesty among the community, being awarded a Chamber of Commerce Ribbon of Recognition in 2004. He later handed off operations to current CEO Keenan Schmidt who oversaw the transition to incorporation for the firm in 2009. Aairah Ryan was later hired as a public relations officer to oversee fundamental advertising and public relations operations. Matteo Corbett is the latest leadership hire, being elected as the Chief of Repairs in 2015. His goal is to increase efficiency while further making prices affordable for customers. 
                        </p>
                    </div>


                    <%-- My video --%>
                    <div>
                        <h2>Brief History Video</h2>
                        <div class="ratio ratio-16x9">
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/2DtlUY7TMv8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; fullscreen"></iframe>
                        </div>
                    </div>

                </div>
                <%-- End history and video --%>

                <%-- Begin mision/vision/values --%>
                <div class="col-sm-6 p-4 d-flex flex-column justify-content-between">
                    <div>
                        <h2>Our Mission </h2>
                        <p>
                            To make computer repair affordable, simple, and effortless. The simple fact is that too many individuals today find it difficult to get their computer repaired in a timely manner that does not adversely impact their career or essential activities. Additionally, it is a struggle for many to afford a computer repair due to the exorbitant prices charged by many computer repair firms. We seek to address all these issues at the service of our customers.
                        </p>
                    </div>

                    <div>
                        <h2>Our Vision </h2>
                        <p>
                            We envision a more ecological friendly world in which e-waste is rendered obsolete thanks to increased lifespan of electronics. One of the leading drivers of e-waste and its toxic emissions of mercury into ground water is repairable technology which is not repaired due to lack of knowledge or lack of accessibility to technology repair firms. While we are just one business in a world of nearly 8 billion individuals, we believe our local impact on preventing e-waste can be tremendous.
                        </p>
                    </div>

                    <div>
                        <h2>Our Values </h2>
                        <p>
                            We seek to maximize the values of honesty, efficiency, resourcefulness, and timeliness. Most can identify with the experience of a mechanic who tacks on mysterious charges and suddenly finds expensive new issues that require "critical" repair. The truth is that many computer repair firms operate in the same way, taking advantage of uninformed customers because they can get away with it. It is our desire to assume the opposite of these, exercising excellent character and truthfulness in service of our loyal customers.
                        </p>
                    </div>
                </div>
                <%-- End mission/vision/values --%>
            </div>

            <%-- Start three images --%>
            <div class="row gx-0 greenbackground top-border">
                <div class="col-sm-4">
                    <img src="Images/AboutUsImage1.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Man smiling in coffee shop with laptop" />
                </div>
                <div class="col-sm-4">
                    <img src="Images/AboutUsImage2.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Windmills above a green hilly plain" />
                </div>
                <div class="col-sm-4">
                    <img src="Images/AboutUsImage3.jpg" class="img-fluid w-100 d-block mx-auto p-3 threewidephotos" alt="Person using screwdriver on electronic chip" />
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
