<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 27/09/18
  Time: 11.39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page info="Inserimento nuovo Contatto" %>
<%@ page session="false"%>
<%@ page buffer="30kb" %>
<%@ page import="services.sessionservice.*" %>

<jsp:useBean id="adminPanelManager" scope="page" class="bflows.AdminPanelManager"/>
<jsp:setProperty name="adminPanelManager" property="*"/>

<%
    String status;
    status = request.getParameter("status");
%>
<html>
<head>
    <title>Title</title>
    <head>
        <title>Kozel100</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="/css/admin_panel.css">

        <!-- Bootstrap -->
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
                        <li class="active"><a href="#tab1default" data-toggle="tab">Position</a></li>
                        <li><a href="#tab2default" data-toggle="tab">Work Field</a></li>
                        <li><a href="#tab3default" data-toggle="tab">Client Type</a></li>
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#tab4default" data-toggle="tab">Default 4</a></li>
                                <li><a href="#tab5default" data-toggle="tab">Default 5</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">
                            <form class="form-horizontal" name="adminPanelManager" action="" method="post">
                                <fieldset>
                                    <legend>Position</legend>
                                    <!-- Text input-->

                                            <input id="positionName" name="positionName" type="text" placeholder="Insert Position Name" class="form-control input-md">

                                    <!-- Button -->
                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <br>
                                            <button id="positionButton" name="singlebutton" class="btn btn-primary" value="inserisci" onclick="insertPosition(this.form)">Inserisci</button>
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="tab2default">
                            <form class="form-horizontal" name="adminPanel" action="" method="post">
                                <fieldset>
                                    <legend>Work Field</legend>
                                    <!-- Text input-->

                                    <input id="workFieldName" name="workFieldName" type="text" placeholder="Insert WorkField Name" class="form-control input-md">

                                    <!-- Button -->
                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <br>
                                            <button id="workFieldButton" name="singlebutton" class="btn btn-primary" value="inserisci" onclick="insertWorkField(this.form)">Inserisci</button>
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </div>

                        <div class="tab-pane fade" id="tab3default">
                            <form class="form-horizontal" name="adminPanel" action="" method="post">
                                <fieldset>
                                    <legend>Client Type</legend>
                                    <!-- Text input-->

                                    <input id="clientTypeName" name="clientTypeName" type="text" placeholder="Insert Client Type Name" class="form-control input-md">

                                    <!-- Button -->
                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <br>
                                            <button id="clientTypeButton" name="singlebutton" class="btn btn-primary" value="inserisci" onclick="insertClientType(this.form)">Inserisci</button>
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="tab4default">Default 4</div>
                        <div class="tab-pane fade" id="tab5default">Default 5</div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>

Dati nel bean: <br><br><br>
Name: <%=adminPanelManager.getPositionName()%><br><br>


<%adminPanelManager.insertPosition();%>

Dati nel bean: <br><br><br>
Name: <%=adminPanelManager.getWorkFieldName()%><br><br>


<%adminPanelManager.insertWorkField();%>

Dati nel bean: <br><br><br>
Name: <%=adminPanelManager.getClientTypeName()%><br><br>


<%adminPanelManager.insertClientType();%>

<script>

    function insertPosition(form){

        form.action="AdminPanel.jsp";
        form.submit();
    }
    function insertWorkField(form){

        form.action="AdminPanel.jsp";
        form.submit();
    }

    function insertClientType(form){

        form.action="AdminPanel.jsp";
        form.submit();
    }

</script>

