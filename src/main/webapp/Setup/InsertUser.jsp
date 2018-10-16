<%@ page info="Pagina iniziale della WebApp" %>
<%@ page session="false" %>
<!--App Stateless -->
<%@ page buffer="30kb" %>
<%@ page import="services.sessionservice.*" %>
<%@ page import="global.*" %>
<%@ page import="util.*" %>
<%--<%@ page errorPage="ErrorPage.jsp"%>--%>

<jsp:useBean id="adminPanelManager" scope="page" class="bflows.AdminPanelManager"/>
<jsp:setProperty name="adminPanelManager" property="*"/>
<%

    String status = null;
    String message = null;
    boolean complete = false;

    status = request.getParameter("status");

    if (status == null) {
        status = "view";
        adminPanelManager.getPositionWorkFieldList();
    }

    if (status.equals("insertUser")) {
        adminPanelManager.insertUser();

        if (adminPanelManager.getResult() == 0) {
            complete = true;
        } else {
            status = "view";
        }
    }

    if (adminPanelManager.getResult() == -2) {
        message = adminPanelManager.getErrorMessage();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="/css/common.css">


    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">

    <title>Kozel100</title>

</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<div class="container col-lg-12">
    <%if (complete) {%>
    <div class="jumbotron">
        <h2>User successfully added!</h2>
    </div>
    <%}%>
    <div class="col-sm-10 form-group-lg block center">
        <h1 class="text-center">
            New User
        </h1>
        <form action="../AdminPanel.jsp">
            <button style="float:right" type="submit" value="InsertUser" class="btn btn-default">
                Back To List
            </button>

            </h1>
        </form>
        <form name="adminPanelManager" action="" method="post">
            <div class="form-group">
                <label for="firstName" class="bmd-label-floating">First Name</label>
                <input type="text" name="firstName" class="form-control" id="firstName"
                       <%if (message != null)%>value="<%=adminPanelManager.getFirstName()%>">
            </div>
            <div class="form-group">
                <label for="lastName" class="bmd-label-floating">Last Name</label>
                <input type="text" name="lastName" class="form-control" id="lastName"
                       <%if (message != null)%>value="<%=adminPanelManager.getLastName()%>">
            </div>
            <div class="form-group">
                <label for="email" class="bmd-label-floating">Email</label>
                <%if (message == null) {%>
                <input type="email" name="email" class="form-control" id="email">
                <%}%>
                <%if (message != null) {%>
                <input type="email" name="email" class="form-control is-invalid" id="email"
                       value="<%=adminPanelManager.getEmail()%>">
                <div class="invalid-feedback">
                    <%=message%>
                </div>
                <%}%>
            </div>
            <div class="form-group">
                <label for="password" class="bmd-label-floating">Password</label>
                <input type="text" name="password" class="form-control" id="password">
            </div>
            <div class="form-group">
                <label for="positionId" class="bmd-label-floating">Position</label>
                <select class="form-control" id="positionId" name="positionId">
                    <%for (int k = 0; k < adminPanelManager.getPositions().length; k++) {%>
                        <%if ((message!=null)&&(adminPanelManager.getPosition(k).positionId==adminPanelManager.getPositionId())) {%>
                            <option value="<%=adminPanelManager.getPosition(k).positionId%>" selected>
                                <%=adminPanelManager.getPosition(k).name%>
                            </option>
                        <% } %>
                        <%if (adminPanelManager.getPosition(k).positionId!=adminPanelManager.getPositionId()) {%>
                            <option value="<%=adminPanelManager.getPosition(k).positionId%>">
                             <%=adminPanelManager.getPosition(k).name%>
                            </option>
                        <% } %>
                    <% } %>
                </select>
            </div>
            <div class="form-group">
                <label for="workFieldId" class="bmd-label-floating">Work Field</label>
                <select class="form-control" id="workFieldId" name="workFieldId">
                    <%for (int k = 0; k < adminPanelManager.getWorkFields().length; k++) {%>
                        <%if ((message != null) && (adminPanelManager.getWorkField(k).workFieldId == adminPanelManager.getWorkFieldId())) {%>
                            <option value="<%=adminPanelManager.getWorkField(k).workFieldId%>" selected>
                                <%=adminPanelManager.getWorkField(k).name%>
                            </option>
                        <% } %>
                        <%if (adminPanelManager.getWorkField(k).workFieldId != adminPanelManager.getWorkFieldId()) {%>
                            <option value="<%=adminPanelManager.getWorkField(k).workFieldId%>">
                                <%=adminPanelManager.getWorkField(k).name%>
                            </option>
                        <% } %>
                    <% } %>
                </select>
            </div>
            <button class="btn btn-default">Cancel</button>
            <button type="submit" class="btn btn-primary btn-raised" onclick="insert(this.form)">Submit</button>
            <input type="hidden" name="status" value="insertUser"/>
        </form>
    </div>
</div>


<script>


    function insert(form) {


        form.action = "InsertUser.jsp";
        form.submit();
    }

</script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
        integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
        integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
        crossorigin="anonymous"></script>
<script>$(document).ready(function () {
    $('body').bootstrapMaterialDesign();
});</script>

</body>
</html>