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
    <title>Title</title>
    <head>
        <title>Kozel100</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/css/admin_panel.css">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                var actions = $("table td:last-child").html();
                // Append table with add row form on add new button click
                $(".add-new").click(function () {
                    $(this).attr("disabled", "disabled");
                    var index = $("table tbody tr:last-child").index();
                    var row = '<tr>' +
                        '<td><input type="text" class="form-control" name="name" id="name"></td>' +
                        '<td>' + actions + '</td>' +
                        '</tr>';
                    $("table").append(row);
                    $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                    $('[data-toggle="tooltip"]').tooltip();
                });
                // Add row on add button click
                $(document).on("click", ".add", function () {
                    var empty = false;
                    var input = $(this).parents("tr").find('input[type="text"]');
                    input.each(function () {
                        if (!$(this).val()) {
                            $(this).addClass("error");
                            empty = true;
                        } else {
                            $(this).removeClass("error");
                        }
                    });
                    $(this).parents("tr").find(".error").first().focus();
                    if (!empty) {
                        input.each(function () {
                            $(this).parent("td").html($(this).val());
                        });
                        $(this).parents("tr").find(".add, .edit").toggle();
                        $(".add-new").removeAttr("disabled");
                    }
                });
                // Edit row on edit button click
                $(document).on("click", ".edit", function () {
                    $(this).parents("tr").find("td:not(:last-child)").each(function () {
                        $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
                    });
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").attr("disabled", "disabled");
                });
                // Delete row on delete button click
                $(document).on("click", ".delete", function () {
                    $(this).parents("tr").remove();
                    $(".add-new").removeAttr("disabled");
                });
            });
        </script>
    </head>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>Admin Panel<span class="pull-right label label-default">:)</span></h1>
    </div>
    <div class="panel with-nav-tabs panel-default">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab1default" data-toggle="tab">Welcome</a></li>
                <li><a href="#tab2default" data-toggle="tab">Work Fields</a></li>
                <li><a href="#tab3default" data-toggle="tab">Positions</a></li>
                <li><a href="#tab4default" data-toggle="tab">Product Categories</a></li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#tab5default" data-toggle="tab">Default 4</a></li>
                        <li><a href="#tab6default" data-toggle="tab">Default 5</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1default">
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
                <div class="tab-pane fade" id="tab2default">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-8"><h2>Work Fields </h2></div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i>
                                            Add New
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-bordered">
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
                                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
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

                <div class="tab-pane fade" id="tab3default">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-8"><h2>Positions</h2></div>
                                    <div class="col-sm-4">
                                        <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i>
                                            Add New
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-bordered">
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
                                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
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
                <div class="tab-pane fade" id="tab4default">
                        <div class="container">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-8"><h2>Product Categories</h2></div>
                                        <div class="col-sm-4">
                                            <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i>
                                                Add New
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-bordered">
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
                                            <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                            <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
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
                <div class="tab-pane fade" id="tab5default">Default 5</div>
            </div>
        </div>
    </div>
</div>
</body>
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

        form.action = "AdminPanel.jsp";
        form.submit();
    }

    function insertWorkField(form) {

        form.action = "AdminPanel.jsp";
        form.submit();
    }

    function insertClientType(form) {

        form.action = "AdminPanel.jsp";
        form.submit();
    }

</script>

