<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 04/10/18
  Time: 9.28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>

<%companyManager.companiesView();%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/view_companies.css">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">

    <title>Kozel100 CRM</title
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form action="InsertCompany.jsp">
                <h1 class="text-center">
                    Companies
                    <button type="submit" value="InsertCompany" class="btn btn-raised btn-secondary"><i class="fa fa-plus"></i>

                        Add New
                    </button>
                </h1>
            </form>
        </div>
            <table class="col-md-12 table table-striped">
                <thead class="cf">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">VAT</th>
                    <th scope="col">Address</th>
                    <th scope="col">City</th>
                    <th scope="col">Email</th>
                    <th scope="col">Contact Reference</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <%for (int k = 0; k < companyManager.getCompanies().length; k++) {%>
                <tr>
                    <th scope="row"> <%= k %> </th>

                    <td><%=companyManager.getCompany(k).name%>
                    </td>
                    <td><%=companyManager.getCompany(k).vat%>
                    </td>
                    <td><%=companyManager.getCompany(k).address%>
                    </td>
                    <td><%=companyManager.getCompany(k).city%>
                    </td>
                    <td><%=companyManager.getCompany(k).email%>
                    </td>
                    <td>
                        <%for (int c = 0; c < companyManager.getContactPeople(companyManager.getCompany(k).companyId).length; c++) {%>
                        <%=companyManager.getContactPeople(companyManager.getCompany(k).companyId)[c].fullName()%>
                        <%}%>
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
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
