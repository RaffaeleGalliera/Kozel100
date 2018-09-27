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

<jsp:useBean id="adminPanelManager" scope="page" class="bflows.AdminPanelManager"/>
<jsp:setProperty name="adminPanelManager" property="*"/>
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
                        <li class="active"><a href="#tab1default" data-toggle="tab">Default 1</a></li>
                        <li><a href="#tab2default" data-toggle="tab">Default 2</a></li>
                        <li><a href="#tab3default" data-toggle="tab">Default 3</a></li>
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
                            <form class="form-horizontal" name="adminPanel" action="" method="post">
                                <fieldset>
                                    <legend>Position</legend>
                                    <!-- Text input-->

                                            <input id="name" name="name" type="text" placeholder="Insert Position Name" class="form-control input-md">

                                    <!-- Button -->
                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <button id="singlebutton" name="singlebutton" class="btn btn-primary" value="inserisci" onclick="insert(this.form)">Inserisci</button>
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="tab2default">Default 2</div>
                        <div class="tab-pane fade" id="tab3default">Default 3</div>
                        <div class="tab-pane fade" id="tab4default">Default 4</div>
                        <div class="tab-pane fade" id="tab5default">Default 5</div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>

Dati nel bean: <br><br><br>
Name: <%=adminPanelManager.getName()%><br><br>


<%adminPanelManager.insertPosition();%>

<script>

    function insert(form){

        form.action="AdminPanel.jsp";
        form.submit();
    }

</script>

