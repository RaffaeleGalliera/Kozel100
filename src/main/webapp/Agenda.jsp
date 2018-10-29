<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 29/10/18
  Time: 14.08
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="services.sessionservice.Session" %>
<%@ page import="util.Debug" %>
<%@ page import="blogics.Tag" %>
<%@ page buffer="30kb" %>

<jsp:useBean id="agendaManager" scope="page" class="bflows.AgendaManager"/>
<jsp:setProperty name="agendaManager" property="*"/>
<%

    String status = null;
    String message = null;
    Integer userId = 0;
    boolean isAdmin = false;
    boolean complete = false;
    Cookie[] cookies = request.getCookies();
    status = request.getParameter("status");

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("jwt_auth_token") && Session.isAuthorized(cookie)) {

                userId = Session.getUserID(cookie);
                agendaManager.setUserId(userId);


            }
        }
    }
    for (Cookie cookie : cookies) {

        if (cookie.getName().equals("jwt_auth_token") && Session.isAdmin(cookie)) {

            isAdmin = true;

        }

    }

    agendaManager.agendaView();
%>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500|Material+Icons" rel="stylesheet">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" href="https://storage.googleapis.com/non-spec-apps/mio-icons/latest/twotone.css">
    <%--<link rel="stylesheet" type="text/css" href="/css/admin_panel.css">--%>

    <%--Bootstrap multiselect css--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/qtip2/3.0.3/jquery.qtip.min.css" rel="stylesheet"/>
    <%--Calendar CSS--%>
    <link rel='stylesheet' href='fullcalendar/fullcalendar.css'/>

    <title>Kozel100 CRM</title>
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<div class="container">
    <div id='calendar'></div>
</div>


<%--VUE JS--%>
<%--<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>--%>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
        integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/qtip2/3.0.3/jquery.qtip.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
        integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
        crossorigin="anonymous"></script>
<%--Multiselect javascript--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<%--FullCalendar Script--%>
<script src='fullcalendar/fullcalendar.js'></script>


<script>$(document).ready(function () {
    var curEvents = [];
    <% for(int x=0;x<agendaManager.getUserAppointments().length;x++){ %>
    curEvents.push({
        title: "<%=agendaManager.getAppointmentCompany(agendaManager.getUserAppointment(x).companyId)%>",
        start: "<%=agendaManager.getUserAppointment(x).date%>" + " <%=agendaManager.getUserAppointment(x).time%>",
        <%--description: "<%=agendaManager.getUserAppointment(x).note%>",--%>
        allDay: false
    });
    <% } %>

    $('#calendar').fullCalendar({
        events: curEvents,
        themeSystem: 'bootstrap4',
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'agendaWeek,month,listMonth'
        },
        // businessHours: {
        //     // days of week. an array of zero-based day of week integers (0=Sunday)
        //     dow: [ 1, 2, 3, 4, 5 ], // Monday - Frriday
        //
        //     start: '10:00', // a start time
        //     end: '18:00', // an end time
        // },
        timeFormat: 'H(:mm)',
        themeButtonIcons: {
            prev: 'circle-triangle-w',
            next: 'circle-triangle-e',
            prevYear: 'seek-prev',
            nextYear: 'seek-next'
        },
    });
    $('body').bootstrapMaterialDesign();
});</script>

</body>
</html>
