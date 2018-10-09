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

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <%--<link rel="stylesheet" type="text/css" href="/css/admin_panel.css">--%>

    <title>Kozel100 CRM</title>
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>

<div class="container">
    <div class="page-header">
        <div class="jumbotron">
            <h1 class="display-4">Welcome</h1>
            <p class="lead">This is your administration panel. Here you can add new User, new positions and
                other useless stuff</p>
            <hr class="my-4">
            <p>In case of troubles contact the Webmaster.</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="#" role="button">Contact That Motherfucker</a>
            </p>
        </div>
    </div>
    <p>
    <ul class="nav nav-tabs">
        <li class="nav-item"><a class="nav-link" href="#workFieldsCard" data-toggle="collapse"
                                data-target="#workFieldsCard"
                                aria-expanded="false" aria-controls="workFieldsCard">Work Fields</a></li>
        <li class="nav-item"><a class="nav-link" href="#positionCard" data-toggle="collapse" data-target="#positionCard"
                                aria-expanded="false" aria-controls="positionCard">Position</a></li>
        <li class="nav-item"><a class="nav-link" href="#productCategoriesCard" data-toggle="collapse"
                                data-target="#productCategoriesCard"
                                aria-expanded="false" aria-controls="productCategoriesCard">Product Categories</a></li>

        <li class="nav-item"><a class="nav-link" href="#clientTypesCard" data-toggle="collapse"
                                data-target="#clientTypesCard"
                                aria-expanded="false" aria-controls="clientTypesCard">Client Types</a></li>

        <%--<li class="nav-item"><a class="nav-link" data-toggle="collapse" data-target=".multi-collapse"--%>
                                <%--aria-expanded="false"--%>
                                <%--aria-controls="workFieldsCard positionCard productCategoriesCard clientTypesCard">Show--%>
            <%--All</a></li>--%>
    </ul>
    </p>

    <div class="row">
        <div class="col">
            <div class="collapse multi-collapse" id="workFieldsCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="Setup/InsertWorkField.jsp">
                                        <h2>Work Fields
                                            <button style="float:right" type="submit" value="InsertWorkField"
                                                    class="btn btn-default">
                                                +
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
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for (int k = 0; k < adminPanelManager.getWorkFields().length; k++) {%>
                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getWorkField(k).name%></td>
                                    <td>
                                        <a class="edit" title="Edit" data-toggle="tooltip"><i
                                                class="material-icons">&#xE254;</i></a>
                                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                                class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse multi-collapse" id="productCategoriesCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="Setup/InsertProductCategory.jsp">
                                        <h2>Product Categories
                                            <button style="float:right" type="submit" value="InsertProductCategory"
                                                    class="btn btn-default">
                                                +
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
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for (int k = 0; k < adminPanelManager.getProductCategories().length; k++) {%>
                                <tr>
                                    <td><%= k + 1 %></td>
                                    <td><%=adminPanelManager.getProductCategory(k).name%></td>
                                    <td>
                                        <a class="edit" title="Edit" data-toggle="tooltip"><i
                                                class="material-icons">&#xE254;</i></a>
                                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                                class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="collapse multi-collapse" id="positionCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="Setup/InsertPosition.jsp">
                                        <h2>Positions
                                            <button style="float:right" type="submit" value="InsertPosition"
                                                    class="btn btn-default">
                                                +
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
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for (int k = 0; k < adminPanelManager.getPositions().length; k++) {%>
                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getPosition(k).name%></td>
                                    <td>
                                        <a class="edit" title="Edit" data-toggle="tooltip"><i
                                                class="material-icons">&#xE254;</i></a>
                                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                                class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse multi-collapse" id="clientTypesCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="Setup/InsertClientType.jsp">
                                        <h2>Client Types
                                            <button style="float:right" type="submit" value="InsertClientType"
                                                    class="btn btn-default">
                                                +
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
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for (int k = 0; k < adminPanelManager.getClientTypes().length; k++) {%>
                                <tr>
                                    <td><%= k +1 %></td>
                                    <td><%=adminPanelManager.getClientType(k).name%></td>
                                    <td>
                                        <a class="edit" title="Edit" data-toggle="tooltip"><i
                                                class="material-icons">&#xE254;</i></a>
                                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                                class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
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
