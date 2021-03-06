<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 09/10/18
  Time: 11.17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page info="Inserimento nuovo Contatto" %>
<%@ page session="false" %>
<%@ page buffer="30kb" %>
<%@ page import="services.sessionservice.*" %>

<jsp:useBean id="adminPanelManager" scope="page" class="bflows.AdminPanelManager"/>
<jsp:setProperty name="adminPanelManager" property="*"/>

<% adminPanelManager.adminView(); %>

<html>
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="../resources/logoS.png">
    <link rel="icon" type="image/png" href="../resources/logoS.png">
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
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <%--<link rel="stylesheet" type="text/css" href="/css/admin_panel.css">--%>

</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>

<div class="container">
    <div class="page-header">
        <div class="jumbotron">
            <h6 class="display-4">Welcome</h6>
            <p class="lead">This is your administration panel. Here you can add new User, Consulting Services and modify the application's Setup state</p>
            <hr class="my-4">
            <p>In case of troubles contact your Webmaster.</p>
        </div>
    </div>
        <div class="col">
            <div class="collapse multi-collapse show" id="consultingServicesCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="InsertConsultingService.jsp">
                                        <h2>Consulting Services
                                            <button style="float:right" type="submit" value="ConsultingService"
                                                    class="btn btn-outline-secondary">
                                                <i class="fa fa-plus"></i>Add New
                                            </button>
                                        </h2>
                                    </form>
                                </div>
                            </div>

                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% int nConsultingServices = adminPanelManager.getConsultingServices().map(t -> t.length).orElse(0);
                                    if (nConsultingServices == 0) {%>
                                <div class="jumbotron">
                                    <h6> No consulting services yet</h6>
                                </div>
                                <%} else {%>
                                <%for (int k = 0; k < nConsultingServices ; k++) {%>
                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getConsultingService(k).name%></td>
                                </tr>
                                <%}%>
                                <%}%>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="collapse multi-collapse show" id="usersCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="InsertUser.jsp">
                                        <h2>Users
                                            <button style="float:right" type="submit" value="InsertUser"
                                                    class="btn btn-outline-secondary">
                                                <i class="fa fa-plus"></i>Add New
                                            </button>
                                        </h2>
                                    </form>
                                </div>
                            </div>

                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for (int k = 0; k < adminPanelManager.getUsers().length; k++) {%>
                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getUser(k).fullName()%></td>
                                    <td><%=adminPanelManager.getUser(k).email%></td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse multi-collapse show" id="workFieldsCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="InsertWorkField.jsp">
                                        <h2>Work Fields
                                            <button style="float:right" type="submit" value="InsertWorkField"
                                                    class="btn btn-outline-secondary">
                                                <i class="fa fa-plus"></i>Add New
                                            </button>
                                        </h2>
                                    </form>
                                </div>
                            </div>

                            <table class="col-md-12 table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                            </tr>
                            </thead>
                                <tbody>
                                <% int nWorkFields = adminPanelManager.getWorkFields().map(t -> t.length).orElse(0);
                                    if (nWorkFields== 0) {%>
                                <div class="jumbotron">
                                    <h6> No work fields yet</h6>
                                </div>
                                <%} else {%>
                                <%for (int k = 0; k < nWorkFields ; k++) {%>
                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getWorkField(k).name%></td>
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
        <div class="col">
            <div class="collapse multi-collapse show" id="positionCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="InsertPosition.jsp">
                                        <h2>Positions
                                            <button style="float:right" type="submit" value="InsertPosition"
                                                    class="btn btn-outline-secondary">
                                                <i class="fa fa-plus"></i>Add New
                                            </button>
                                        </h2>
                                    </form>
                                </div>
                            </div>
                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% int nPositions = adminPanelManager.getPositions().map(t -> t.length).orElse(0);
                                    if (nPositions == 0) {%>
                                <div class="jumbotron">
                                    <h6> No positions yet</h6>
                                </div>
                                <%} else {%>
                                <%for (int k = 0; k < nPositions ; k++) {%>
                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getPosition(k).name%></td>
                                </tr>
                                <%}%>
                                <%}%>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse multi-collapse show" id="clientTypesCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="InsertClientType.jsp">
                                        <h2>Customer Types
                                            <button style="float:right" type="submit" value="InsertClientType"
                                                    class="btn btn-outline-secondary">
                                                <i class="fa fa-plus"></i>Add New
                                            </button>
                                        </h2>
                                    </form>
                                </div>
                            </div>
                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% int nCustomerType = adminPanelManager.getClientTypes().map(t -> t.length).orElse(0);
                                    if (nCustomerType == 0) {%>
                                <div class="jumbotron">
                                    <h6> No customer types yet</h6>
                                </div>
                                <%} else {%>
                                <%for (int k = 0; k < nCustomerType ; k++) {%>
                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getClientType(k).name%></td>
                                </tr>
                                <%}%>
                                <%}%>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse multi-collapse show" id="productCategoryCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="InsertProductCategory.jsp">
                                        <h2>Product Categories
                                            <button style="float:right" type="submit" value="Tag"
                                                    class="btn btn-outline-secondary">
                                                <i class="fa fa-plus"></i>Add New
                                            </button>
                                        </h2>
                                    </form>
                                </div>
                            </div>

                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% int nProductCategories = adminPanelManager.getProductCategories().map(t -> t.length).orElse(0);
                                    if (nProductCategories == 0) {%>
                                <div class="jumbotron">
                                    <h6> No Product categories yet</h6>
                                </div>
                                <%} else {%>
                                <%for (int k = 0; k < nProductCategories ; k++) {%>                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getProductCategory(k).name%></td>
                                </tr>
                                <%}%>
                                <%}%>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse multi-collapse show" id="tagsCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="InsertTag.jsp">
                                        <h2>Tags
                                            <button style="float:right" type="submit" value="InsertTag"
                                                    class="btn btn-outline-secondary">
                                                <i class="fa fa-plus"></i>Add New
                                            </button>
                                        </h2>
                                    </form>
                                </div>
                            </div>
                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% int nTags = adminPanelManager.getTags().map(t -> t.length).orElse(0);
                                    if (nTags == 0) {%>
                                <div class="jumbotron">
                                    <h6> No tags yet</h6>
                                </div>
                                <%} else {%>
                                <%for (int k = 0; k < nTags ; k++) {%>                                <tr>
                                    <td><%= k + 1 %></td>
                                    <td><%=adminPanelManager.getTag(k).name%></td>
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

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>