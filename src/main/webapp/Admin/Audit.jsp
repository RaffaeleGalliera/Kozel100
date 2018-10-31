<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 31/10/18
  Time: 22.33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="adminPanelManager" scope="page" class="bflows.AdminPanelManager"/>
<jsp:setProperty name="adminPanelManager" property="*"/>
<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="services.sessionservice.Session" %>


<%

    String message = null;
    boolean complete = false;
    String status = request.getParameter("status");
    String previousStatus = "none";
    String userId = null;
    String clientTypeId = null;
    String productCategoryId = null;

    if (status == null) status = "view"; //

    if (status.equals("view")) {


        if (request.getParameter("previousStatus") != null && request.getParameter("previousStatus").equals("filter")) {

            previousStatus = "filter";

        }

        adminPanelManager.logView();

    }

%>

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

    <title>Kozel100 CRM</title>

</head>

<body>
<jsp:include page="/Common/Navbar.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 class="text-center">
                Audit Logging
            </h1>
        </div>
        <table class="col-md-12 table table-striped" id="companiesTable">
            <thead class="cf">
            <tr>
                <th scope="col">#</th>
                <th scope="col">User</th>
                <th scope="col">Requested Resource</th>
                <th scope="col">Company</th>
                <th scope="col">Action</th>
                <th scope="col">IP</th>
                <th scope="col">Method</th>
                <th scope="col">Details</th>
                <th scope="col">Timestamp</th>
            </tr>
            </thead>
            <tbody>
            <%for (int k = 0; k < adminPanelManager.getAuditLogs().length; k++) {%>
            <tr>
                <th scope="row"><%= k %>
                </th>

                <td><%=adminPanelManager.getAuditLog(k).userEmail%>
                </td>
                <td><%=adminPanelManager.getAuditLog(k).requestedResource%>
                </td>
                <td><%=adminPanelManager.getAuditLog(k).companyName%>
                </td>
                <td><%=adminPanelManager.getAuditLog(k).action%>
                </td>
                <td><%=adminPanelManager.getAuditLog(k).ip%>
                </td>
                <td><%=adminPanelManager.getAuditLog(k).method%>
                </td>
                <td><%=adminPanelManager.getAuditLog(k).details%>
                </td>
                <td><%=adminPanelManager.getAuditLog(k).timestamp%>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
        integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
        integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        $('body').bootstrapMaterialDesign();
    });
</script>
</body>
</html>
