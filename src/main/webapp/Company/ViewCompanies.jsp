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

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form action="InsertCompany.jsp">
                <h1 class="text-center">
                    Companies
                    <button type="submit" value="InsertCompany" class="btn btn-info add-new"><i class="fa fa-plus"></i>
                        Add New
                    </button>
                </h1>
            </form>
        </div>
        <div id="no-more-tables">
            <table class="col-md-12 table-bordered table-striped table-condensed cf">
                <thead class="cf">
                <tr>
                    <th>Name</th>
                    <th>VAT</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Email</th>
                    <th>Contact Reference</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%for (int k = 0; k < companyManager.getCompanies().length; k++) {%>
                <tr>
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

</div>
</body>
</html>
