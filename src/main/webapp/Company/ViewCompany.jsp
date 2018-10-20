<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 10/19/18
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page info="Inserimento nuova Compagnia" %>
<%@ page session="false" %>
<%@ page buffer="30kb" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>
<%

    String status = null;
    String message = null;
    boolean complete = false;
    status = request.getParameter("status");
    companyManager.setCompanyId(Integer.parseInt(request.getParameter("companyId")));

    if (status.equals("view")) {
        companyManager.companyView();
    }
    if (status.equals("updateCompany")) {
        companyManager.updateCompany();
        if (companyManager.getResult() == 0) {
            complete = true;
        } else {
            status = "view";
        }
    }

%>
<!doctype html>
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
            <h1 class="display-4"><%=companyManager.getCompany().name%></h1>
            <p class="lead"><%=companyManager.getClientType().name%></p>
            <p class="lead"><%for (int c = 0; c < companyManager.getContactPeople(companyManager.getCompany(k).companyId).length; c++) {%>
                <%if (c > 0) {%>
                ,
                <%}%>
                <%=companyManager.getContactPeople(companyManager.getCompany(k).companyId)[c].fullName()%>
                <%}%>
            </p>
            <p class="lead"><%=companyManager.getCompany().name%></p>
            <p class="lead"><%=companyManager.getCompany().name%></p>
            <p class="lead"><%=companyManager.getCompany().name%></p>
            <hr class="my-4">
            <p>In case of troubles contact the Webmaster.</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="#" role="button">Contact That Motherfucker</a>
            </p>
        </div>
    </div>
    <p>
    <ul class="nav nav-tabs">
        <li class="nav-item"><a class="nav-link" href="#consultingServiceCard" data-toggle="collapse"
                                data-target="#consultingServiceCard"
                                aria-expanded="false" aria-controls="consultingServiceCard">Consulting Services</a></li>
        <li class="nav-item"><a class="nav-link" href="#clientNotesCard" data-toggle="collapse"
                                data-target="#clientNotesCard"
                                aria-expanded="false" aria-controls="clientNotesCard">Client Notes</a></li>
        <%--<li class="nav-item"><a class="nav-link" data-toggle="collapse" data-target=".multi-collapse"--%>
        <%--aria-expanded="false"--%>
        <%--aria-controls="clientNotesCard positionCard productCategoriesCard clientTypesCard">Show--%>
        <%--All</a></li>--%>
    </ul>
    </p>

    <div class="row">
        <div class="col">
            <div class="collapse multi-collapse" id="consultingServiceCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="Setup/InsertUser.jsp">
                                        <h2>Users
                                            <button style="float:right" type="submit" value="InsertUser"
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
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for (int k = 0; k < adminPanelManager.getUsers().length; k++) {%>
                                <tr>
                                    <td><%= k + 1 %>
                                    </td>
                                    <td><%=adminPanelManager.getUser(k).fullName()%>
                                    </td>
                                    <td><%=adminPanelManager.getUser(k).email%>
                                    </td>
                                    <td>
                                        <a class="edit" title="Edit" data-toggle="tooltip"><i
                                                class="material-icons">&#xE254;</i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse multi-collapse" id="clientNotesCard">
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
                                    <td><%= k + 1 %>
                                    </td>
                                    <td><%=adminPanelManager.getWorkField(k).name%>
                                    </td>
                                    <td>
                                        <a class="edit" title="Edit" data-toggle="tooltip"><i
                                                class="material-icons">&#xE254;</i></a>
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