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
            <hr class="my-4">
            <div class="row">
                <div class="col"><p class="lead">Contact References:<%for (int c = 0; c < companyManager.getContactPeople().length; c++) {%>
                    <br>
                    <%=companyManager.getContactPerson(c).fullName()%>
                    <%}%>
                </p></div>
                <div class="col"><p class="lead">Responsible User: </p></div>
            </div>
            <hr class="my-4">
            <p class="lead">Customer Type: <%=companyManager.getClientType().name%></p>
            <hr class="my-4">
            <div class="row">
                <div class="col"><p class="lead">Address: <%=companyManager.getCompany().address%></p></div>
                <div class="col"><p class="lead">City: <%=companyManager.getCompany().city%></p></div>
            </div>
            <hr class="my-4">
            <p class="lead">VAT: <%=companyManager.getCompany().vat%></p>
            <hr class="my-4">
            <p class="lead">
                <div class="row">
                    <div class="col"><p class="lead"><a class="btn btn-success btn-lg" href="#" role="button">Edit</a></p></div>
                    <div class="col"><p class="lead"><a class="btn btn-danger btn-lg" href="#" role="button">Delete</a></p></div>
                </div>
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
                                aria-expanded="false" aria-controls="clientNotesCard">Customer Notes</a></li>
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
                                    <th>Service</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <%--<tbody>--%>
                                <%--<%for (int k = 0; k < companyManager.getConsultingServices().length; k++) {%>--%>
                                <%--<tr>--%>
                                    <%--<td><%= k + 1 %>--%>
                                    <%--</td>--%>
                                    <%--<td><%=companyManager.getConsultingService(k).name%></td>--%>
                                    <%--<td>--%>
                                        <%--<a class="edit" title="Edit" data-toggle="tooltip"><i--%>
                                                <%--class="material-icons">&#xE254;</i></a>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<%}%>--%>
                                <%--</tbody>--%>
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
                                <%--<%for (int k = 0; k < adminPanelManager.getWorkFields().length; k++) {%>--%>
                                <%--<tr>--%>
                                    <%--<td><%= k + 1 %>--%>
                                    <%--</td>--%>
                                    <%--<td><%=adminPanelManager.getWorkField(k).name%>--%>
                                    <%--</td>--%>
                                    <%--<td>--%>
                                        <%--<a class="edit" title="Edit" data-toggle="tooltip"><i--%>
                                                <%--class="material-icons">&#xE254;</i></a>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<%}%>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
    <input type="hidden" name="status" value="view"/>
</div>
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