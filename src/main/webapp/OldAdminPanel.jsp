<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 27/09/18
  Time: 11.39
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
    <title>Kozel100</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/admin_panel.css">
    <link rel="stylesheet" type="text/css" href="/css/common.css">

    <!-- Required meta tags -->
    <meta charset="utf-8">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">

    <%--$(document).ready(function () {--%>
    <%--$('[data-toggle="tooltip"]').tooltip();--%>
    <%--var actions = $("table td:last-child").html();--%>
    <%--// Append table with add row form on add new button click--%>
    <%--$(".add-new").click(function () {--%>
    <%--$(this).attr("disabled", "disabled");--%>
    <%--var index = $("table tbody tr:last-child").index();--%>
    <%--var row = '<tr>' +--%>
    <%--'<td><input type="text" class="form-control" name="name" id="name"></td>' +--%>
    <%--'<td>' + actions + '</td>' +--%>
    <%--'</tr>';--%>
    <%--$("table").append(row);--%>
    <%--$("table tbody tr").eq(index + 1).find(".add, .edit").toggle();--%>
    <%--$('[data-toggle="tooltip"]').tooltip();--%>
    <%--});--%>
    <%--// Add row on add button click--%>
    <%--$(document).on("click", ".add", function () {--%>
    <%--var empty = false;--%>
    <%--var input = $(this).parents("tr").find('input[type="text"]');--%>
    <%--input.each(function () {--%>
    <%--if (!$(this).val()) {--%>
    <%--$(this).addClass("error");--%>
    <%--empty = true;--%>
    <%--} else {--%>
    <%--$(this).removeClass("error");--%>
    <%--}--%>
    <%--});--%>
    <%--$(this).parents("tr").find(".error").first().focus();--%>
    <%--if (!empty) {--%>
    <%--input.each(function () {--%>
    <%--$(this).parent("td").html($(this).val());--%>
    <%--});--%>
    <%--$(this).parents("tr").find(".add, .edit").toggle();--%>
    <%--$(".add-new").removeAttr("disabled");--%>
    <%--}--%>
    <%--});--%>
    <%--// Edit row on edit button click--%>
    <%--$(document).on("click", ".edit", function () {--%>
    <%--$(this).parents("tr").find("td:not(:last-child)").each(function () {--%>
    <%--$(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');--%>
    <%--});--%>
    <%--$(this).parents("tr").find(".add, .edit").toggle();--%>
    <%--$(".add-new").attr("disabled", "disabled");--%>
    <%--});--%>
    <%--// Delete row on delete button click--%>
    <%--$(document).on("click", ".delete", function () {--%>
    <%--$(this).parents("tr").remove();--%>
    <%--$(".add-new").removeAttr("disabled");--%>
    <%--});--%>
    <%--});--%>
    <%--</script>--%>
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<div class="container">
    <div class="page-header">
        <h1>Admin Panel</h1>
    </div>
    <%--<div class="panel with-nav-tabs panel-default">--%>
    <%--<div class="panel-heading">--%>
    <ul class="nav nav-tabs bg-dark">
        <li class="nav-item"><a class="nav-link active" href="#welcometab" data-toggle="tab">Welcome</a></li>
        <li class="nav-item"><a class="nav-link " href="#workfieldtab" data-toggle="tab">Work Fields</a></li>
        <li class="nav-item"><a class="nav-link " href="#positiontab" data-toggle="tab">Position</a></li>
        <li class="nav-item"><a class="nav-link " href="#productcategoriestab" data-toggle="tab">Product Categories</a>
        </li>
        <li class="nav-item"><a class="nav-link " href="#clienttypestab" data-toggle="tab">Client Types</a></li>
        <%--<li><a href="#workfieldtab" data-toggle="tab">Work Fields</a></li>--%>
        <%--<li><a href="#positiontab" data-toggle="tab">Positions</a></li>--%>
        <%--<li><a href="#productcategoriestab" data-toggle="tab">Product Categories</a></li>--%>
        <%--<li><a href="#clienttypestab" data-toggle="tab">Client Types</a></li>--%>
        <%--<li class="dropdown">--%>
        <%--<a href="#" data-toggle="dropdown">Dropdown <span class="caret"></span></a>--%>
        <%--<ul class="dropdown-menu" role="menu">--%>
        <%--<li><a href="#tab6default" data-toggle="tab">Default 4</a></li>--%>
        <%--<li><a href="#tab7default" data-toggle="tab">Default 5</a></li>--%>
        <%--</ul>--%>
        <%--</li>--%>
    </ul>
</div>
<div class="panel-body">
    <div class="tab-content">
        <div class="tab-pane fade in active" id="welcometab">
            <div class="jumbotron">
                <h1 class="display-4">Welcome</h1>
                <p class="lead">This is your administration panel. Here you can add new User, new position and
                    other useless stuff</p>
                <hr class="my-4">
                <p>In case of troubles contact the Webmaster.</p>
                <p class="lead">
                    <a class="btn btn-primary btn-lg" href="#" role="button">Contact That Motherfucker</a>
                </p>
            </div>
        </div>
        <div class="tab-pane fade" id="workfieldtab">
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
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < adminPanelManager.getWorkFields().length; k++) {%>
                        <tr>
                            <td><%=adminPanelManager.getWorkField(k).name%>
                            </td>
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

        <div class="tab-pane fade" id="positiontab">
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
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < adminPanelManager.getPositions().length; k++) {%>
                        <tr>
                            <td><%=adminPanelManager.getPosition(k).name%>
                            </td>
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
        <div class="tab-pane fade" id="productcategoriestab">
            <div class="container">
                <div class="table-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="Setup/InsertTag.jsp">
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
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < adminPanelManager.getProductCategories().length; k++) {%>
                        <tr>
                            <td><%=adminPanelManager.getProductCategory(k).name%>
                            </td>
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
        <div class="tab-pane fade" id="clienttypestab">
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
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < adminPanelManager.getClientTypes().length; k++) {%>
                        <tr>
                            <td><%=adminPanelManager.getClientType(k).name%>
                            </td>
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
</body>
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
</html>

<%--Dati nel bean: <br><br><br>--%>
<%--Name: <%=adminPanelManager.getPositionName()%><br><br>--%>


<%--<%adminPanelManager.insertPosition();%>--%>

<%--Dati nel bean: <br><br><br>--%>
<%--Name: <%=adminPanelManager.getWorkFieldName()%><br><br>--%>


<%--<%adminPanelManager.insertWorkField();%>--%>

<%--Dati nel bean: <br><br><br>--%>
<%--Name: <%=adminPanelManager.getClientTypeName()%><br><br>--%>


<%--<%adminPanelManager.insertClientType();%>--%>

<script>

    function insertPosition(form) {

        form.action = "OldAdminPanel.jsp";
        form.submit();
    }

    function insertWorkField(form) {

        form.action = "OldAdminPanel.jsp";
        form.submit();
    }

    function insertClientType(form) {

        form.action = "OldAdminPanel.jsp";
        form.submit();
    }

</script>
