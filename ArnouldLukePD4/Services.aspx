<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="ArnouldLukePD4.Services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Services - Precision Computer Professionals</title>
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

            <%-- Begin page title --%>
            <div class="row gx-0">
                <div class="col-sm-12 p-3">
                    <h1 class="d-flex align-content-center justify-content-center">Services
                    </h1>
                </div>
            </div>
            <%-- End page title --%>

            <%-- Begin first row of services --%>
            <div class="row gx-0 service-row text-center">

                <%-- Begin service option --%>
                <div class="col-sm-4 all-border p-2">
                    <div>
                        <img src="Images/ComputerRepair.jpg" class="img-fluid w-100 d-block mx-auto p-3 mb-0 rounded-photo" alt="A man repairing a computer" />
                        <h2>Computer Repair</h2>
                        <h3>$99 + cost of parts</h3>
                    </div>
                    <div class="row gx-0">
                        <div class="col-sm-8 text-start">
                            <p>Broken computer components? No problem. Select one of the options from the side and we can fix whatever you bring to us.</p>
                        </div>
                        <div class="col-sm-4 services-selection text-start">
                            <asp:CheckBoxList ID="cboxRepairParts" runat="server" DataSourceID="ComputerRepairType" DataTextField="ComputerRepairTypeDesc" DataValueField="ComputerRepairTypeID">
                            </asp:CheckBoxList>
                            <asp:SqlDataSource ID="ComputerRepairType" runat="server" ConnectionString="<%$ ConnectionStrings:S22_kslarnoulConnectionString %>" SelectCommand="spComputerRepairType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <%-- Begin Add to Cart button --%>
                    <div class="p-2">
                        <asp:Button ID="btnAddRepairToCart" runat="server" Text="Add to Cart" BackColor="#00B865" ForeColor="White" Font-Size="Large" class="button" />
                    </div>

                </div>
                <%-- End service option --%>

                <%-- Begin service option --%>
                <div class="col-sm-4 all-border p-2">
                    <div>
                        <img src="Images/ServicesClean.jpg" class="img-fluid w-100 d-block mx-auto p-3 mb-0 rounded-photo" alt="An outdated computer tower stripped of parts and in disrepair" />
                        <h2>Computer Cleanup</h2>
                        <h3>$25</h3>
                    </div>

                    <div class="row gx-0">
                        <div class="col-sm-8 text-start">
                            <p>Sometimes your computer can get dirty, whether in software or the hardware itself. We offer a variety of cleanup options guaranteed to make your computer feel like new.</p>
                        </div>
                        <div class="col-sm-4 services-selection text-start">
                            <asp:CheckBoxList ID="cboxClean" runat="server" DataSourceID="ComputerCleanType" DataTextField="ComputerCleanTypeDesc" DataValueField="ComputerCleanTypeID">
                            </asp:CheckBoxList>
                            <asp:SqlDataSource ID="ComputerCleanType" runat="server" ConnectionString="<%$ ConnectionStrings:S22_kslarnoulConnectionString %>" SelectCommand="spComputerCleanType" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <%-- Begin Add to Cart button --%>
                    <div class="p-2">
                        <asp:Button ID="btnCleanAddToCart" runat="server" Text="Add to Cart" BackColor="#00B865" ForeColor="White" Font-Size="Large" class="button" />
                    </div>

                </div>
                <%-- End service option --%>

                <%-- Begin service option --%>
                <div class="col-sm-4 all-border p-2">
                    <div>
                        <img src="Images/ServicesMalware.jpg" class="img-fluid w-100 d-block mx-auto p-3 mb-0 rounded-photo" alt="Laptop notification showing that malware has been detected on device" />
                        <h2>Malware Removal</h2>
                        <h3>$49</h3>
                    </div>
                    <div class="row gx-0">
                        <div class="col-sm-8 text-start">
                            <p>Malware and viruses are a part of the world we live in now, and at some point everyone will encounter one. We offer comprehensive malware removal options with a priority on preserving any data on the device.</p>
                        </div>
                        <div class="col-sm-4 services-selection text-start">
                            <asp:RadioButtonList ID="rblMalware" runat="server" DataSourceID="OSRepairMaster" DataTextField="OSRepairDesc" DataValueField="OSRepairID">
                            </asp:RadioButtonList>
                            <asp:SqlDataSource ID="OSRepairMaster" runat="server" ConnectionString="<%$ ConnectionStrings:S22_kslarnoulConnectionString %>" SelectCommand="spOSRepairMaster" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <%-- Begin Add to Cart button --%>
                    <div class="p-2">
                        <asp:Button ID="btnMalwareAddToCart" runat="server" Text="Add to Cart" BackColor="#00B865" ForeColor="White" Font-Size="Large" class="button" />
                    </div>

                </div>
                <%-- End service option --%>
            </div>
            <%-- End first row of services --%>

            <%-- Begin second row of services --%>
            <div class="row gx-0 service-row text-center mb-4">

                <%-- Begin service option --%>
                <div class="col-sm-4 all-border p-2">
                    <div>
                        <img src="Images/ServicesUpdate.jpg" class="img-fluid w-100 d-block mx-auto p-3 mb-0 rounded-photo" alt="A laptop being updated" />
                        <h2>New Computer Setup</h2>
                        <h3>$49</h3>
                    </div>

                    <div class="row gx-0">
                        <div class="col-sm-8 text-start">
                            <p>Buying a new computer and needing to load your programs and data onto it can be a daunting task, but we are here to help.</p>
                        </div>
                        <div class="col-sm-4 services-selection text-start">
                            <asp:RadioButtonList ID="rblTransferServices" runat="server" DataSourceID="OSRepairMaster" DataTextField="OSRepairDesc" DataValueField="OSRepairID">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <%-- Begin Add to Cart button --%>
                    <div class="p-2">
                        <asp:Button ID="btnTransferAddToCart" runat="server" Text="Add to Cart" BackColor="#00B865" ForeColor="White" Font-Size="Large" class="button" />
                    </div>

                </div>
                <%-- End service option --%>

                <%-- Begin service option --%>
                <div class="col-sm-4 all-border p-2">
                    <div>
                        <img src="Images/ServicesParts.jpg" class="img-fluid w-100 d-block mx-auto p-3 mb-0 rounded-photo" alt="Closeup of computer motherboard and CPU cooler" />
                        <h2>Computer Part Upgrade</h2>
                        <h3>$49 + cost of parts</h3>
                    </div>

                    <div class="row gx-0">
                        <div class="col-sm-8 text-start">
                            <p>At some point every device will begin to feel outdated, but with this service you can ensure you are getting the longest life possible out of your hardware.</p>
                        </div>
                        <div class="col-sm-4 services-selection text-start">
                            <asp:CheckBoxList ID="cboxPartUpgrade" runat="server" DataSourceID="ComputerPartUpgrade" DataTextField="PartUpgradeDesc" DataValueField="PartUpgradeID">
                            </asp:CheckBoxList>
                            <asp:SqlDataSource ID="ComputerPartUpgrade" runat="server" ConnectionString="<%$ ConnectionStrings:S22_kslarnoulConnectionString %>" SelectCommand="spComputerPartUpgrade" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <%-- Begin Add to Cart button --%>
                    <div class="p-2">
                        <asp:Button ID="btnPartAddToCart" runat="server" Text="Add to Cart" BackColor="#00B865" ForeColor="White" Font-Size="Large" class="button" />
                    </div>

                </div>
                <%-- End service option --%>

                <%-- Begin service option --%>
                <div class="col-sm-4 all-border p-2">
                    <div>
                        <img src="Images/ServicesBackup.jpg" class="img-fluid w-100 d-block mx-auto p-3 mb-0 rounded-photo" alt="Computer hard disk drive with protective plate removed, revealing magnetic spinning disk" />
                        <h2>Data Backup</h2>
                        <h3>$15/month</h3>
                    </div>

                    <div class="row gx-0">
                        <div class="col-sm-8 text-start">
                            <p>Wishing to backup your data but not wanting to worry about local hard drives or the cloud? Bring it in with this service and we can back it up to our encrypted double redundancy backup drives.</p>
                        </div>
                        <div class="col-sm-4 services-selection text-start">
                            <asp:RadioButtonList ID="rblServicesBackup" runat="server" DataSourceID="OSRepairMaster" DataTextField="OSRepairDesc" DataValueField="OSRepairID">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <%-- Begin Add to Cart button --%>
                    <div class="p-2">
                        <asp:Button ID="btnBackupAddToCart" runat="server" Text="Add to Cart" BackColor="#00B865" ForeColor="White" Font-Size="Large" class="button" />
                    </div>

                </div>
                <%-- End service option --%>
            </div>
            <%-- End second row of services --%>

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
