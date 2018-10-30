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
    if (status == null) status = "view";

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

    if (status.equals("view")) {
        agendaManager.agendaView();
    }

    if (status.equals(("addAppointment"))) {
        agendaManager.addAppointment();
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.css"/>

    <title>Kozel100 CRM</title>
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<script language="JavaScript">
    function addAppointment(form) {
        form.action = "Agenda.jsp";
        form.submit();
    }
</script>

<div class="container">
    <div id='calendar'></div>
</div>

<!--Appointment Modal -->
<div class="modal fade" id="addAppointment" tabindex="-1" role="dialog"
     aria-labelledby="addAppointmentLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAppointmentLabel">Add Appointment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="agendaManager" action="" method="post">
                    <div class="form-group">
                        <label for="companyId" class="bmd-label-floating">Select Company</label>
                        <select class="form-control" name="companyId" id="companyId">
                            <%for (int k = 0; k < agendaManager.getCompanies().length; k++) {%>
                            <option value="<%=agendaManager.getCompany(k).companyId%>">
                                <%=agendaManager.getCompany(k).name%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="appointmentDate" class="bmd-label-floating">Date</label>
                        <input type="date" name="appointmentDate" class="form-control"
                               id="appointmentDate">
                    </div>
                    <div class="form-group">
                        <label for="appointmentTime" class="bmd-label-floating">Time</label>
                        <input type="time" name="appointmentTime" class="form-control"
                               id="appointmentTime">
                    </div>
                    <div class="form-group">
                        <label for="appointmentNote" class="bmd-label-floating">Note</label>
                        <textarea class="form-control" rows="5" id="appointmentNote"
                                  name="appointmentNote"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="userIds" class="bmd-label-floating">Share this Appointment with other
                            Users</label>
                        <select class="form-control multipleSelect" name="userIds" id="userIds" multiple="multiple">
                            <%for (int k = 0; k < agendaManager.getUsers().length; k++) {%>
                            <%if (userId != agendaManager.getUser(k).userId) {%>
                            <option value="<%=agendaManager.getUser(k).userId%>">
                                <%=agendaManager.getUser(k).fullName()%>
                            </option>
                            <% } %>
                            <% } %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised"
                                onclick="addAppointment(this.form)">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="addAppointment"/>
                        <input type="hidden" name="appointmentUserId" id="appointmentUserId"
                               value="<%= userId %>"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.js"></script>
<script>$(document).ready(function () {
    $('.multipleSelect').css('width', '100%');
    $('.multipleSelect').select2();

    var curEvents = [];
    <% int nAppointments = agendaManager.getUserAppointments().map(t -> t.length).orElse(0);
    if (nAppointments != 0) {%>
    <% for(int x=0;x<nAppointments;x++){ %>
    curEvents.push({
        title: "<%=agendaManager.getAppointmentCompany(agendaManager.getUserAppointment(x).companyId)%>",
        start: "<%=agendaManager.getUserAppointment(x).date%>" + " <%=agendaManager.getUserAppointment(x).time%>",
        description: "<%=agendaManager.getUserAppointment(x).note%>",
        allDay: false
    });
    <% } %>
    <% } %>

    $('#calendar').fullCalendar({
        events: curEvents,
        themeSystem: 'bootstrap4',
        themeButtonIcons: {
            prev: 'circle-triangle-w',
            next: 'circle-triangle-e',
            prevYear: 'seek-prev',
            nextYear: 'seek-next'
        },
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'agendaWeek,month,listMonth,addAppointment'
        },
        eventRender: function (eventObj, $el) {
            $el.popover({
                title: eventObj.title,
                content: eventObj.description,
                trigger: 'hover',
                placement: 'top',
                container: 'body'
            });
        },
        customButtons: {
            addAppointment: {
                text: 'ADD',
                click: function () {
                    $('#addAppointment').modal('show');
                }
            }
        },
        timeFormat: 'H(:mm)',
    });
    $('body').bootstrapMaterialDesign();
});</script>

</body>
</html>
