<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="dashboardManager" scope="page" class="bflows.DashboardManager"/>
<jsp:setProperty name="dashboardManager" property="*"/>
<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="services.sessionservice.Session" %>

<%@ page import="util.Debug" %>
<%@ page buffer="30kb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    Cookie[] cookies = request.getCookies();
    int userId = 0;
    String status = "view";
    boolean isAdmin = false;
    int todayAppointments=0;
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

    <!-- Material Design for Bootstrap fonts and icons -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500|Material+Icons" rel="stylesheet">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" href="https://storage.googleapis.com/non-spec-apps/mio-icons/latest/twotone.css">
    <%--<link rel="stylesheet" type="text/css" href="/css/admin_panel.css">--%>

    <%--<!--     Fonts and icons     -->--%>
    <%--<link rel="stylesheet" type="text/css"--%>
          <%--href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700|Montserrat+Slab:400,700|Material+Icons"/>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet"/>


</head>
<jsp:include page="/Common/Navbar.jsp"/>

<body class="" >

<div class="wrapper-full-page">
    <%--<div class="sidebar" data-color="green" data-image="resources/logoS.png" data-background-color="white">--%>
        <%--<!----%>
          <%--Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"--%>

          <%--Tip 2: you can also add an image using data-image tag--%>
      <%---->--%>
        <%--<div class="logo">--%>
            <%--<img src="/resources/logoSmall.png" width="160" height="80" class="d-inline-block align-top" alt="">--%>

        <%--</div>--%>
        <%--<div class="sidebar-wrapper">--%>
            <%--<ul class="nav">--%>
                <%--&lt;%&ndash;<li class="nav-item active  ">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<a class="nav-link" href="#0">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<i class="material-icons">dashboard</i>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<p>Dashboard</p>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                <%--<!-- your sidebar here -->--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-success card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">speaker_notes</i>
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
                            <div class="card-header card-header-icon">
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
                    <%--Appointments Mini card--%>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-success card-header-icon">
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
                    <%--Commercial Proposals mini card--%>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">assignment</i>
                                </div>
                                <p class="card-category">Commercial Proposals</p>
                                <h3 class="card-title"><% int nCommercialProposals = dashboardManager.getUserCommercialProposals().map(t -> t.length).orElse(0);%>
                                    <%=dashboardManager.getPendingCommercialProposal()%>
                                    <small>Pending</small>
                                </h3>
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
                            <div class="card-header ">
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
                            <div class="card-header card-header-success">
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
                            <div class="card-header card-header-tabs card-header-success">
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
                                                    <i class="material-icons">question_answer</i> Your Companies
                                                    Interactions
                                                    <div class="ripple-container"></div>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <%--Last 10 notes made by current user--%>
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="userNotes">
                                        <table class="table table-striped">
                                            <tbody>
                                            <%if (nUserNotes == 0) {%>
                                            <div class="jumbotron">
                                                <h4 class="display-4"> No Comments on your Companies yet</h4>
                                            </div>
                                            <%} else {%>
                                            <%int c = nUserNotes;%>
                                            <%if (nUserNotes > 10) c = 10; %>
                                            <%for (int k = 0; k < c; k++) {%>
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
                                    <%--Last 10 notes made by other users on current user's company--%>
                                    <div class="tab-pane" id="otherUsersNotes">
                                        <table class="table table-striped">
                                            <tbody>
                                            <% int nOtherUsersNotes = dashboardManager.getOtherUsersNotes().map(t -> t.length).orElse(0);
                                                if (nOtherUsersNotes == 0) {%>
                                            <div class="jumbotron">
                                                <h6> No Comments on your Companies yet</h6>
                                            </div>
                                            <%} else {%>
                                            <%int c = nOtherUsersNotes;%>
                                            <%if (nOtherUsersNotes > 10) c = 10; %>
                                            <%for (int k = 0; k < c; k++) {%>
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
                    <%--Next 10 User Appointments--%>
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-tabs card-header-success">
                                <div class="card-icon">
                                    <i class="material-icons">calendar_today</i>
                                </div>
                                <p class="card-category">Next Appointments</p>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <tbody>
                                    <%if (nAppointments == 0) {%>
                                    <div class="jumbotron">
                                        <h6> No scheduled appointments</h6>
                                    </div>
                                    <%} else {%>
                                    <%for (int k = 0; k < nAppointments; k++) {%>
                                    <tr>
                                        <td><%=dashboardManager.getUserAppointment(k).date%>
                                        </td>
                                        <td><%=dashboardManager.getUserAppointment(k).time%>
                                        </td>
                                        <td><%=dashboardManager.getCompanyById(dashboardManager.getUserAppointment(k).companyId)%>
                                        </td>
                                        <%if(dashboardManager.appointmentToday(dashboardManager.getUserAppointment(k).date)){%>
                                        <%todayAppointments++;%>
                                        <%}%>
                                    </tr>
                                    <%}%>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%--Companies assigned to user--%>
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-tabs card-header-success">
                                <div class="card-icon">
                                    <i class="material-icons">store</i>
                                </div>
                                <p class="card-category">Assigned Companies</p>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <tbody>
                                    <%if (nCompanies == 0) {%>
                                    <div class="jumbotron">
                                        <h6> You have no Companies Assigned right now</h6>
                                    </div>
                                    <%} else {%>
                                    <thead class="text-gray">
                                    <th>
                                        Name
                                    </th>
                                    <th>
                                        Email
                                    </th>
                                    <th>
                                        Country
                                    </th>
                                    </thead>
                                    <%for (int k = 0; k < nCompanies; k++) {%>
                                    <tr>
                                        <td><%=dashboardManager.getUserCompany(k).name%>
                                        </td>
                                        <td><%=dashboardManager.getUserCompany(k).email%>
                                        </td>
                                        <td><%=dashboardManager.getUserCompany(k).country%>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%--USer's commercial proposal--%>
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-tabs card-header-info">
                                <div class="card-icon">
                                    <i class="material-icons">store</i>
                                </div>
                                <p class="card-category">Commercial Proposals</p>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <tbody>
                                    <%if (nCommercialProposals == 0) {%>
                                    <div class="jumbotron">
                                        <h6> You have no Commercial Proposals right now</h6>
                                    </div>
                                    <%} else {%>
                                    <thead class="text-gray">
                                    <th>
                                        Proposal
                                    </th>
                                    <th>
                                        Company
                                    </th>
                                    <th>
                                        Status
                                    </th>
                                    </thead>
                                    <%for (int k = 0; k < nCommercialProposals; k++) {%>
                                    <tr>
                                        <td><%=dashboardManager.getUserCommercialProposal(k).name%>
                                        </td>
                                        <td><%=dashboardManager.getCompanyById(dashboardManager.getUserCommercialProposal(k).company_id)%>
                                        </td>
                                        <td><%=dashboardManager.getUserCommercialProposal(k).status%>
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
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <div class="copyright float-right">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                    , made with <i class="material-icons">favorite</i> by
                    Teu & Rafu
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
    <%if(todayAppointments>0){%>
    $.notify({
        icon: "calendar_today",
        message: " <%=dashboardManager.getUser().firstName%> check out your appointments today: <%=todayAppointments%> Scheduled"

    }, {
        type: 'danger',
        timer: 2000,
        placement: {
            from: 'bottom',
            align: 'right'
        }
    });
    <%}%>
});</script>
</body>

</html>