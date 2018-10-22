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
<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="services.sessionservice.Session" %>


<%

    String message = null;
    boolean complete = false;
    String status = request.getParameter("status");

    if (status == null) status = "view"; //

    if (status.equals("view")) {

        companyManager.companiesView();

    }


    if (status.equals("deleteCompany")) {
        companyManager.deleteCompany(Integer.parseInt(request.getParameter("companyId")));
    }

    if (status.equals("insertCompany")) {
        companyManager.insertCompany();

        if (companyManager.getResult() == 0) {
            complete = true;
        } else {
            status = "view";
        }
    }

    if (companyManager.getResult() == -2) {
        message = companyManager.getErrorMessage();
    }


    if (status.equals("filter")) {

        Map<String, Integer> filters = new HashMap<String, Integer>();

        Boolean filterByUser = Boolean.parseBoolean(request.getParameter("filterByUser"));
        String userId = request.getParameter("userId");

        if (filterByUser) {

            filters.put("userId", Integer.parseInt(userId));

        }

        Boolean filterByType = Boolean.parseBoolean(request.getParameter("filterByType"));
        String clientTypeId = request.getParameter("clientTypeId");

        if (filterByType) {

            filters.put("clientTypeId", Integer.parseInt(clientTypeId));

        }

        Boolean filterByProduct = Boolean.parseBoolean(request.getParameter("filterByProduct"));
        String tagId = request.getParameter("tagId");

        if (filterByProduct) {

            filters.put("tagId", Integer.parseInt(tagId));

        }

        //I used an HashMap so it's easier to deal with parameters sent to the bean

        companyManager.filterCompanies(filters);

    }

%>

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

    <style>

        .filter {

            background-color: whitesmoke;
            margin-left: 10%;
            margin-right: 10%;
            padding: 3%;
            border-radius: 7px;
            padding-bottom: 1%;
            margin-bottom: 3%;

        }

        .filterGroup {

            display: none;

        }

        div.filter {

            display: none;

        }

    </style>


    <title>Kozel100 CRM</title>

</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<script language="JavaScript">

    function toggle() {

        var x = document.getElementById("filter");
        if (x.style.display === "none" || x.style.display === "") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }

    }

    function redirect() {

        window.location.replace("/Company/InsertCompany.jsp");

    }

    function getFiltered() {


        f = document.getElementById("filterForm");

        if (f.filterByType.checked || f.filterByUser.checked || f.filterByProduct.checked) {

            f.submit();

        } else {

            alert("No fields selected xD LOL!");

        }


    }

    function deleteCompany(id, name) {

        r = confirm("Are you sure to delete : " + name + "? Even all its contacts will be Deleted");

        if (r === true) {
            document.deleteCompanyForm.companyId.value = id;

            document.deleteCompanyForm.submit();
        }
        else {
            return;
        }

    }

    function updateCompany(id) {
        document.updateCompanyForm.companyId.value = id;
        document.updateCompanyForm.submit();
    }

    function viewCompany(id) {
        document.viewCompanyForm.companyId.value = id;
        document.viewCompanyForm.submit();
    }

    function insert(form) {

        form.action = "ViewCompanies.jsp";
        form.submit();
    }

    function track(checkbox) {


        if (checkbox.id == "filterByType") {


            if (!checkbox.checked) {

                checkbox.value = "false";
                document.getElementById("filterClientTypeGroup").style.display = "none";

            } else {

                checkbox.value = "true";
                document.getElementById("filterClientTypeGroup").style.display = "block";

            }

        }

        if (checkbox.id == "filterByUser") {


            if (!checkbox.checked) {

                checkbox.value = "false";
                document.getElementById("filterUserGroup").style.display = "none";

            } else {

                checkbox.value = "true";
                document.getElementById("filterUserGroup").style.display = "block";

            }

        }

        if (checkbox.id == "filterByProduct") {


            if (!checkbox.checked) {

                checkbox.value = "false";
                document.getElementById("filterProductGroup").style.display = "none";

            } else {

                checkbox.value = "true";
                document.getElementById("filterProductGroup").style.display = "block";

            }

        }
    }

</script>


<div class="container">
    <%if (complete) {%>
    <div class="jumbotron">
        <h2>Company successfully added!</h2>
    </div>
    <%}%>
    <div class="row">
        <div class="col-md-12">
            <h1 class="text-center">
                Companies
                <button class="btn btn-raised btn-primary" data-toggle="modal" data-target="#insertCompanyModal"><i
                        class="fa fa-plus"></i>Add New
                </button>
                <button class="btn btn-raised btn-primary" onclick="toggle()"><i class="fa fa-plus"></i>Filter</button>
            </h1>
        </div>

        <div class="container filter" id="filter">

            <form id="filterForm" action="ViewCompanies.jsp" method="post">

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByType" name="filterByType"
                               value="false" onchange="track(this)">
                        Tipo Cliente
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterClientTypeGroup">
                    <select class="form-control" id="clientTypeId" name="clientTypeId">
                        <%for (int k = 0; k < companyManager.getClientTypes().length; k++) {%>
                        <option value="<%=companyManager.getClientType(k).clientTypeId%>"><%=companyManager.getClientType(k).name%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByUser" name="filterByUser"
                               value="false" onchange="track(this)">
                        Utente
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterUserGroup">
                    <select class="form-control" id="userId" name="userId">
                        <%for (int k = 0; k < companyManager.getUsers().length; k++) {%>
                        <option value="<%=companyManager.getUser(k).userId%>"><%=companyManager.getUser(k).lastName%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByProduct" name="filterByProduct"
                               value="false" onchange="track(this)">
                        Categoria Merceologica
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterProductGroup">
                    <select class="form-control" id="tagId" name="tagId">
                        <%for (int k = 0; k < companyManager.getTags().length; k++) {%>
                        <option value="<%=companyManager.getTag(k).tagId%>"><%=companyManager.getTag(k).name%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <input type="hidden" name="status" value="filter"/>
                <button type="button" class="btn btn-primary btn-raised" onclick="getFiltered()">Submit</button>

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
                <th scope="row"><%= k %>
                </th>

                <td><a href="JavaScript: viewCompany('<%=companyManager.getCompany(k).companyId%>');"><%=companyManager.getCompany(k).name%></a></td>
                <td><%=companyManager.getCompany(k).vat%>
                </td>
                <td><%=companyManager.getCompany(k).address%>
                </td>
                <td><%=companyManager.getCompany(k).city%>
                </td>
                <td><%=companyManager.getCompany(k).email%>
                </td>
                <td>
                    <%for (int c = 0; c < companyManager.getContactPeople().length; c++) {%>
                        <%if ((companyManager.getContactPerson(c).companyId)==(companyManager.getCompany(k).companyId) ){%>
                        <%=companyManager.getContactPerson(c).fullName()%>
                        <br>
                        <%}%>
                    <%}%>
                </td>
                <td>
                    <a class="edit" title="Edit" data-toggle="tooltip"
                       href="JavaScript: updateCompany('<%=companyManager.getCompany(k).companyId%>');"><i
                            class="material-icons">&#xE254;</i></a>
                    <a class="delete" title="Delete" data-toggle="tooltip"
                       href="JavaScript:deleteCompany('<%=companyManager.getCompany(k).companyId%>','<%=companyManager.getCompany(k).name%>');"><i
                            class="material-icons">&#xE872;</i></a>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <form name="deleteCompanyForm" action="ViewCompanies.jsp" method="post">
            <input type="hidden" name="companyId" value=""/>
            <input type="hidden" name="status" value="deleteCompany"/>
        </form>
        <form name="updateCompanyForm" action="UpdateCompany.jsp" method="post">
            <input type="hidden" name="companyId" value=""/>
            <input type="hidden" name="status" value="view"/>
        </form>
        <form name="viewCompanyForm" action="ViewCompany.jsp" method="post">
            <input type="hidden" name="companyId" value=""/>
            <input type="hidden" name="status" value="view"/>
        </form>
        <!-- Modal -->
        <div class="modal fade" id="insertCompanyModal" tabindex="-1" role="dialog" aria-labelledby="insertCompanyTitle"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="insertCompanyTitle">Insert Company</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="companyManager" action="" method="post">
                            <div class="form-group">
                                <label for="name" class="bmd-label-floating">Name</label>
                                <%if (message == null) {%>
                                <input type="text" name="name" class="form-control" id="name">
                                <%}%>
                                <%if (message != null) {%>
                                <input type="text" name="name" class="form-control is-invalid" id="name"
                                       value="<%=companyManager.getName()%>">
                                <div class="invalid-feedback">
                                    <%=message%>
                                </div>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label for="vat" class="bmd-label-floating">VAT</label>
                                <input type="text" name="vat" class="form-control" id="vat"
                                       <%if (message != null)%>value="<%=companyManager.getVat()%>">
                            </div>
                            <div class="form-group">
                                <label for="address" class="bmd-label-floating">Address</label>
                                <input type="text" name="address" class="form-control" id="address"
                                       <%if (message != null)%>value="<%=companyManager.getAddress()%>">
                            </div>
                            <div class="form-group">
                                <label for="city" class="bmd-label-floating">City</label>
                                <input type="text" name="city" class="form-control" id="city"
                                       <%if (message != null)%>value="<%=companyManager.getCity()%>">
                            </div>
                            <div class="form-group">
                                <label for="companyEmail" class="bmd-label-floating">Email</label>
                                <input type="email" name="companyEmail" class="form-control" id="companyEmail"
                                       <%if (message != null)%>value="<%=companyManager.getCompanyEmail()%>">
                            </div>
                            <div class="form-group">
                                <label for="clientTypeId2" class="bmd-label-floating">Client Type</label>
                                <select class="form-control" id="clientTypeId2" name="clientTypeId">
                                    <%for (int k = 0; k < companyManager.getClientTypes().length; k++) {%>
                                    <%if ((message != null) && (companyManager.getClientType(k).clientTypeId == companyManager.getClientTypeId())) {%>
                                    <option value="<%=companyManager.getClientType(k).clientTypeId%>" selected>
                                        <%=companyManager.getClientType(k).name%>
                                    </option>
                                    <% } %>
                                    <%if (companyManager.getClientType(k).clientTypeId != companyManager.getClientTypeId()) {%>
                                    <option value="<%=companyManager.getClientType(k).clientTypeId%>">
                                        <%=companyManager.getClientType(k).name%>
                                    </option>
                                    <% } %>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="productCategoryId" class="bmd-label-floating">Product Category</label>
                                <select class="form-control" id="productCategoryId" name="productCategoryId">
                                    <%for (int x = 0; x < companyManager.getProductCategories().length; x++) {%>
                                    <%if ((message != null) && (companyManager.getProductCategory(x).productCategoryId == companyManager.getProductCategoryId())) {%>
                                    <option value="<%=companyManager.getProductCategory(x).productCategoryId%>" selected>
                                        <%=companyManager.getProductCategory(x).name%>
                                    </option>
                                    <% } %>
                                    <%if (companyManager.getProductCategory(x).productCategoryId != companyManager.getProductCategoryId()) {%>
                                    <option value="<%=companyManager.getProductCategory(x).productCategoryId%>">
                                        <%=companyManager.getProductCategory(x).name%>
                                    </option>
                                    <% } %>
                                    <% } %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="userId2" class="bmd-label-floating">Responsible User</label>
                                <select class="form-control" id="userId2" name="userId">
                                    <%for (int x = 0; x < companyManager.getUsers().length; x++) {%>
                                    <%if ((message != null) && (companyManager.getUser(x).userId == companyManager.getUserId())) {%>
                                    <option value="<%=companyManager.getUser(x).userId%>" selected>
                                        <%=companyManager.getUser(x).fullName()%>
                                    </option>
                                    <% } %>
                                    <%if (companyManager.getUser(x).userId != companyManager.getUserId()) {%>
                                    <option value="<%=companyManager.getUser(x).userId%>">
                                        <%=companyManager.getUser(x).fullName()%>
                                    </option>
                                    <% } %>
                                    <% } %>
                                </select>
                            </div>
                            <%--<div class="form-group">--%>
                                <%--<div class="checkbox">--%>
                                            <%--<%for (int k = 0; k < companyManager.getTags().length; k++) { int c=0; %>--%>
                                                <%--<%if ((message != null) && (companyManager.getTag(k) == companyManager.getCompanyTag(c).tagId)) {%>--%>
                                                 <%--<label>--%>
                                                   <%--<input type="checkbox" value="<%=companyManager.getTag(k).tagId%>" checked>--%>
                                                       <%--<%=companyManager.getClientType(k).name%>--%>
                                                       <%--<% c++;%>--%>
                                                 <%--</label>--%>
                                                <%--<% } %>--%>
                                                <%--<%if (companyManager.getTag(k).tagId!= companyManager.getCompanyTag(c).tagId) {%>--%>
                                                <%--<label>--%>
                                                    <%--<input type="checkbox" value="<%=companyManager.getTag(k).tagId%>">--%>
                                                    <%--<%=companyManager.getClientType(k).name%>--%>
                                                    <%--<% c++;%>--%>
                                                <%--</label>--%>
                                                <%--<% } %>--%>
                                            <%--<% } %>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div class="jumbotron">
                                <h1>Contact Reference</h1>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="firstName" class="bmd-label-floating">First Name</label>
                                        <input type="text" name="firstName" class="form-control" id="firstName"
                                               <%if (message != null)%>value="<%=companyManager.getFirstName()%>">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="lastName" class="bmd-label-floating">Last Name</label>
                                        <input type="text" name="lastName" class="form-control" id="lastName"
                                               <%if (message != null)%>value="<%=companyManager.getLastName()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phoneNumber" class="bmd-label-floating">Phone Number</label>
                                    <input type="text" name="phoneNumber" class="form-control" id="phoneNumber"
                                           <%if (message != null)%>value="<%=companyManager.getPhoneNumber()%>">
                                </div>
                                <div class="form-group">
                                    <label for="contactEmail" class="bmd-label-floating">Email</label>
                                    <input type="email" name="contactEmail" class="form-control" id="contactEmail"
                                           <%if (message != null)%>value="<%=companyManager.getcontactEmail()%>">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-default">Cancel</button>
                                <button type="submit" class="btn btn-primary btn-raised" onclick="insert(this.form)">
                                    Submit
                                </button>
                                <input type="hidden" name="status" value="insertCompany"/>
                            </div>
                        </form>
                        <input type="hidden" id="modal" name="modal" <%if (message != null)%>value="1"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    if ($('#modal').val() == 1) {
        $('#insertCompanyModal').modal('show');
    }
});</script>

</body>
</html>
