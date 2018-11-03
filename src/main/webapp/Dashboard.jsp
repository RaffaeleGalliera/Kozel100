<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="dashboardManager" scope="page" class="bflows.DashboardManager"/>
<jsp:setProperty name="dashboardManager" property="*"/>
<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="services.sessionservice.Session" %>

<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="services.sessionservice.Session" %>
<%@ page import="util.Debug" %>
<%@ page buffer="30kb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    Cookie[] cookies = request.getCookies();
    int userId = 0;
    String status = "view";
    boolean isAdmin = false;
    status = request.getParameter("status");

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("jwt_auth_token") && Session.isAuthorized(cookie)) {

                userId = Session.getUserID(cookie);
                dashboardManager.setUserId(userId);
            }
        }
    }

    for (Cookie cookie : cookies) {

        if (cookie.getName().equals("jwt_auth_token") && Session.isAdmin(cookie)) {

            isAdmin = true;

        }

    }
    if (status == null) {
        status = "view";
    }
    if (status.equals("view")) {
        dashboardManager.dashView();
    }


%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Dashboard
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700|Montserrat+Slab:400,700|Material+Icons"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet"/>
</head>

<body class="">
<div class="wrapper ">
    <div class="sidebar" data-color="green" data-image="resources/logoS.png" data-background-color="white">
        <!--
          Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

          Tip 2: you can also add an image using data-image tag
      -->
        <div class="logo">
            <img src="/resources/logoSmall.png" width="160" height="80" class="d-inline-block align-top" alt="">

        </div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <%--<li class="nav-item active  ">--%>
                <%--<a class="nav-link" href="#0">--%>
                <%--<i class="material-icons">dashboard</i>--%>
                <%--<p>Dashboard</p>--%>
                <%--</a>--%>
                <%--</li>--%>
                <!-- your sidebar here -->
            </ul>
        </div>
    </div>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="#pablo">Dashboard</a>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                    <span class="navbar-toggler-icon icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#pablo">
                                <i class="material-icons">notifications</i> Notifications
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="companyDropdown" role="button"
                               data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                Companies
                            </a>
                            <div class="dropdown-menu" aria-labelledby="companyDropdown">
                                <a class="dropdown-item" href="/Company/ViewCompanies.jsp">View</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Company/InsertContactPerson.jsp">Insert Contact
                                    Person</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../Agenda.jsp">Agenda</a>
                        </li>
                        <%if (isAdmin) {%>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="adminDropdown"
                                                         role="button"
                                                         data-toggle="dropdown" aria-haspopup="true"
                                                         aria-expanded="false">
                            Admin Panel
                        </a>
                            <div class="dropdown-menu" aria-labelledby="adminDropdown">
                                <a class="dropdown-item" href="/Admin/AdminPanel.jsp">Panel</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Admin/Audit.jsp">Audit Logging</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="setupDropdown" role="button"
                               data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                Insert Setup
                            </a>
                            <div class="dropdown-menu" aria-labelledby="setupDropdown">
                                <a class="dropdown-item" href="/Admin/InsertUser.jsp">User</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Admin/InsertClientType.jsp">Client Type</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Admin/InsertPosition.jsp">Position</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Admin/InsertWorkField.jsp">Work Field</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Admin/InsertProductCategory.jsp">Product Category</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Admin/InsertTag.jsp">Tag</a>
                            </div>
                        </li>
                        <%}%>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-primary card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">comment</i>
                                </div>
                                <p class="card-category">Your Interactions</p>
                                <h3 class="card-title"><% int nUserNotes = dashboardManager.getUserNotes().map(t -> t.length).orElse(0);%>
                                    <%=nUserNotes%>
                                    <small>Notes</small>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Assigned Companies MiniCard--%>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-success card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">store</i>
                                </div>
                                <p class="card-category">Assigned Companies</p>
                                <h3 class="card-title"><% int nCompanies = dashboardManager.getUserCompanies().map(t -> t.length).orElse(0);%>
                                    <%=nCompanies%>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-warning card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">calendar_today</i>
                                </div>
                                <p class="card-category">Appointments</p>
                                <h3 class="card-title"><% int nAppointments = dashboardManager.getUserAppointments().map(t -> t.length).orElse(0);%>
                                    <%=nAppointments%>
                                    <small>To do</small>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">date_range</i> Visit Your Agenda
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-info card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">assignment</i>
                                </div>
                                <p class="card-category">Commercial Proposals</p>
                                <h3 class="card-title">+245</h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">update</i> Just Updated
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-chart">
                            <div class="card-header card-header-success">
                                <div class="ct-chart" id="dailySalesChart"></div>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Daily Sales</h4>
                                <p class="card-category">
                                    <span class="text-success"><i class="fa fa-long-arrow-up"></i> 55% </span> increase
                                    in today sales.</p>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">access_time</i> updated 4 minutes ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-chart">
                            <div class="card-header card-header-warning">
                                <div class="ct-chart" id="websiteViewsChart"></div>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Email Subscriptions</h4>
                                <p class="card-category">Last Campaign Performance</p>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">access_time</i> campaign sent 2 days ago
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-chart">
                            <div class="card-header card-header-danger">
                                <div class="ct-chart" id="completedTasksChart"></div>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">Completed Tasks</h4>
                                <p class="card-category">Last Campaign Performance</p>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">access_time</i> campaign sent 2 days ago
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-tabs card-header-primary">
                                <div class="nav-tabs-navigation">
                                    <div class="nav-tabs-wrapper">
                                        <span class="nav-tabs-title">Notes Recap</span>
                                        <ul class="nav nav-tabs" data-tabs="tabs">
                                            <li class="nav-item">
                                                <a class="nav-link active" href="#userNotes" data-toggle="tab">
                                                    <i class="material-icons">comment</i> Your Last Notes
                                                    <div class="ripple-container"></div>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#otherUsersNotes" data-toggle="tab">
                                                    <i class="material-icons">question_answer</i> Your Companies Interactions
                                                    <div class="ripple-container"></div>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="userNotes">
                                        <table class="table">
                                            <tbody>
                                            <%if (nUserNotes == 0) {%>
                                            <div class="jumbotron">
                                                <h4 class="display-4"> No Comments on your Companies yet</h4>
                                            </div>
                                            <%} else {%>
                                            <%for (int k = 0; k < 10; k++) {%>
                                            <tr>

                                                <td><%=dashboardManager.getUserNote(k).timestamp%>
                                                </td>
                                                <td><%=dashboardManager.getUserNote(k).title%>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="button" rel="tooltip" title="Edit Task"
                                                            class="btn btn-primary btn-link btn-sm">
                                                        <i class="material-icons">edit</i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="Remove"
                                                            class="btn btn-danger btn-link btn-sm">
                                                        <i class="material-icons">close</i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <%}%>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="otherUsersNotes">
                                        <table class="table">
                                            <tbody>
                                            <% int nOtherUsersNotes = dashboardManager.getOtherUsersNotes().map(t -> t.length).orElse(0);
                                                if (nOtherUsersNotes == 0) {%>
                                            <div class="jumbotron">
                                                <h6> No Comments on your Companies yet</h6>
                                            </div>
                                            <%} else {%>
                                            <%for (int k = 0; k < 10; k++) {%>
                                            <tr>

                                                <td><%=dashboardManager.getOtherUsersNote(k).timestamp%>
                                                </td>
                                                <td><%=dashboardManager.getOtherUsersNote(k).title%>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="button" rel="tooltip" title="Edit Task"
                                                            class="btn btn-primary btn-link btn-sm">
                                                        <i class="material-icons">edit</i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="Remove"
                                                            class="btn btn-danger btn-link btn-sm">
                                                        <i class="material-icons">close</i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <%}%>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-tabs card-header-success">
                                <div class="card-icon">
                                    <i class="material-icons">store</i>
                                </div>
                                <p class="card-category">Assigned Companies</p>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <tbody>
                                    <%if (nCompanies== 0) {%>
                                    <div class="jumbotron">
                                        <h6> You have no Companies Assigned right now</h6>
                                    </div>
                                    <%} else {%>
                                    <%for (int k = 0; k < nCompanies; k++) {%>
                                    <tr>
                                        <td><%=dashboardManager.getUserCompany(k).name%>
                                        </td>
                                        <td><%=dashboardManager.getUserCompany(k).email%>
                                        </td>
                                        <td class="td-actions text-right">
                                            <button type="button" rel="tooltip" title="Edit Task"
                                                    class="btn btn-primary btn-link btn-sm">
                                                <i class="material-icons">edit</i>
                                            </button>
                                            <button type="button" rel="tooltip" title="Remove"
                                                    class="btn btn-danger btn-link btn-sm">
                                                <i class="material-icons">close</i>
                                            </button>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <%}%>
                                    </tbody>
                                </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <footer class="footer">
                        <div class="container-fluid">
                            <nav class="float-left">
                                <ul>
                                    <li>
                                        <a href="https://www.creative-tim.com">
                                            Creative Tim
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://creative-tim.com/presentation">
                                            About Us
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://blog.creative-tim.com">
                                            Blog
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.creative-tim.com/license">
                                            Licenses
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="copyright float-right">
                                &copy;
                                <script>
                                    document.write(new Date().getFullYear())
                                </script>
                                , made with <i class="material-icons">favorite</i> by
                                <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a> for a better
                                web.
                            </div>
                        </div>
                    </footer>
                </div>
            </div>

            <!--   Core JS Files   -->
            <script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
            <script src="assets/js/core/popper.min.js" type="text/javascript"></script>
            <script src="assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
            <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
            <!--  Google Maps Plugin    -->
            <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
            <!-- Chartist JS -->
            <script src="assets/js/plugins/chartist.min.js"></script>
            <!--  Notifications Plugin    -->
            <script src="assets/js/plugins/bootstrap-notify.js"></script>
            <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
            <script src="assets/js/material-dashboard.min.js?v=2.1.0" type="text/javascript"></script>
            <script>$(document).ready(function () {
                $.notify({
                    icon: "add_alert",
                    message: "Welcome back <%=dashboardManager.getUser().firstName%> "

                }, {
                    type: 'success',
                    timer: 500,
                    placement: {
                        from: 'top',
                        align: 'center'
                    }
                });
            });</script>
</body>

</html>