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
<%@ page import="global.Status" %>
<%@ page buffer="30kb" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    Cookie[] cookies = request.getCookies();
    int userId = 0;
    String status = "view";
    boolean isAdmin = false;
    int todayAppointments = 0;
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
    <link rel="apple-touch-icon" sizes="76x76" href="resources/logoS.png">
    <link rel="icon" type="image/png" href="resources/logoS.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Kozel100 CRM
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
    <link href="/css/common.css" rel="stylesheet"/>


</head>
<jsp:include page="/Common/Navbar.jsp"/>

<body class="">
<div class="wrapper-full-page">
    <div class="main-panel">
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
                                <small>Scheduled</small>
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
                                <%=dashboardManager.getCommercialProposalsStatus(Status.PENDING)%>
                                <small>Pending</small>
                                <br>
                                <%=dashboardManager.getCommercialProposalsStatus(Status.ACCEPTED)%>
                                <small style="color:#45a149">Accepted</small>
                                <br>
                                <%=dashboardManager.getCommercialProposalsStatus(Status.REJECTED)%>
                                <small>Rejected</small>
                            </h3>
                        </div>
                        <div class="card-footer">
                            <div class="stats">
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
                                                <i class="material-icons">question_answer</i>Companies Assigned to You
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
                                            <h6>You didn't write notes yet</h6>
                                        </div>
                                        <%} else {%>
                                        <%int c = nUserNotes;%>
                                        <%if (nUserNotes > 10) c = 10; %>
                                        <%for (int k = 0; k < c; k++) {%>
                                        <tr>

                                            <td><%=dashboardManager.getUserNote(k).createdAt%>
                                            </td>
                                            <td><%=dashboardManager.getUserNote(k).title%>
                                            </td>
                                            <td><a style="font-size:large; color:#45a149"
                                                   href="JavaScript: viewCompany('<%=dashboardManager.getCompanyByConversationId(dashboardManager.getUserNote(k).conversationId).companyId%>');">
                                                <%=dashboardManager.getCompanyByConversationId(dashboardManager.getUserNote(k).conversationId).name%>
                                            </a></td>
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
                                        <thead class="text-gray">
                                            <th>
                                                Date
                                            </th>
                                            <th>
                                                Time
                                            </th>
                                            <th>
                                                Company
                                            </th>
                                            <th>
                                                Commented by
                                            </th>
                                            <th>
                                                Email
                                        </th>
                                        </thead>
                                        <%int c = nOtherUsersNotes;%>
                                        <%if (nOtherUsersNotes > 10) c = 10; %>
                                        <%for (int k = 0; k < c; k++) {%>
                                        <tr>

                                            <td><%=dashboardManager.getOtherUsersNote(k).createdAt%>
                                            </td>
                                            <td><%=dashboardManager.getOtherUsersNote(k).title%>
                                            </td>
                                            <td><a style="font-size:large; color:#45a149"
                                                   href="JavaScript: viewCompany('<%=dashboardManager.getCompanyByConversationId(dashboardManager.getOtherUsersNote(k).conversationId).companyId%>');">
                                                <%=dashboardManager.getCompanyByConversationId(dashboardManager.getOtherUsersNote(k).conversationId).name%>
                                            </a></td>
                                            <td><%=dashboardManager.getUserByNote(dashboardManager.getOtherUsersNote(k).userId).fullName()%>
                                            </td>
                                            <td><%=dashboardManager.getUserByNote(dashboardManager.getOtherUsersNote(k).userId).email%>
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
                                </thead>
                                <%for (int k = 0; k < nAppointments; k++) {%>
                                <tr>
                                    <td><%=dashboardManager.getUserAppointment(k).date%>
                                    </td>
                                    <td><%=dashboardManager.getUserAppointment(k).time%>
                                    </td>
                                    <td>
                                    <a style="font-size:large; color:#45a149"
                                           href="JavaScript: viewCompany('<%=dashboardManager.getCompanyById(dashboardManager.getUserAppointment(k).companyId).companyId%>');">
                                            <%=dashboardManager.getCompanyById(dashboardManager.getUserAppointment(k).companyId).name%>
                                    </td>
                                    <%if (dashboardManager.appointmentToday(dashboardManager.getUserAppointment(k).date)) {%>
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
                                    Contact Reference
                                </th>
                                <th>
                                    Country
                                </th>
                                <th>
                                    Client Since
                                </th>
                                </thead>
                                <%for (int k = 0; k < nCompanies; k++) {%>
                                <tr>
                                    <td><a style="font-size:large; color:#45a149"
                                           href="JavaScript: viewCompany('<%=dashboardManager.getUserCompany(k).companyId%>');">
                                            <%=dashboardManager.getUserCompany(k).name%>
                                    </td>
                                    <td><%=dashboardManager.getUserCompany(k).email%>
                                    </td>
                                    <td><%= dashboardManager.getContactPersonByCompanyId(dashboardManager.getUserCompany(k).companyId).fullName()%>
                                    </td>
                                    <td><%=dashboardManager.getUserCompany(k).country%>
                                    </td>
                                    <td><%=dashboardManager.getUserCompany(k).startDate%>
                                    </td>
                                </tr>
                                <%}%>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%--User's commercial proposal--%>
                <div class="col-lg-6 col-md-12">
                    <div class="card">
                        <div class="card-header card-header-tabs card-header-success">
                            <div class="card-icon">
                                <i class="material-icons">assignment</i>
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
                                <th>
                                    Last Update
                                </th>
                                </thead>
                                <%for (int k = 0; k < nCommercialProposals; k++) {%>
                                <tr>
                                    <td><%=dashboardManager.getUserCommercialProposal(k).name%>
                                    </td>
                                    <td><a style="font-size:large; color:#45a149"
                                           href="JavaScript: viewCompany('<%=dashboardManager.getCompanyById(dashboardManager.getUserCommercialProposal(k).company_id).companyId%>');">
                                            <%=dashboardManager.getCompanyById(dashboardManager.getUserCommercialProposal(k).company_id).name%>
                                    </td>
                                    <td><%=dashboardManager.getUserCommercialProposal(k).status%>
                                    </td>
                                    <td><%=dashboardManager.getUserCommercialProposal(k).updatedAt%>
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
        <form name="viewCompanyForm" action="Company/ViewCompany.jsp" method="post">
            <input type="hidden" name="companyId" value=""/>
            <input type="hidden" name="status" value="view"/>
        </form>
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
    <%} else{%>
    $.notify({
        icon: "calendar_today",
        message: " <%=dashboardManager.getUser().firstName%> You have No appointments Today"

    }, {
        type: 'warning',
        timer: 2000,
        placement: {
            from: 'bottom',
            align: 'right'
        }
    });
    <%}%>
});

function viewCompany(id) {
    document.viewCompanyForm.companyId.value = id;
    document.viewCompanyForm.submit();
}

</script>
</body>
</html>