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
<%@ page import="blogics.Tag" %>
<%@ page import="static global.Constants.LOG_DIR" %>
<%@ page import="blogics.ContactPerson" %>



<%

    String message = null;
    boolean complete = false;
    String status = request.getParameter("status");

    if (status == null) status = "view";

    if (status.equals("insertCompany")) {
        companyManager.insertCompany();

        if (companyManager.getResult() == 0) {
            complete = true;
        } else {
            status = "view";
        }
    }

    if (status.equals("view")) {
        companyManager.companiesView();
    }

    if (status.equals("updateCompany")) {
        companyManager.updateCompany();
    }

    if (status.equals("deleteCompany")) {
        companyManager.deleteCompany(Integer.parseInt(request.getParameter("companyId")));
    }

    if (status.equals("addTag")) {
        companyManager.addNTagNCompanies();
    }

    if (status.equals("exportCompanies")) {

        companyManager.exportCompanies();

        String filename = "companies.pdf";
        String filepath = LOG_DIR;
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition","inline; filename=\"" + filename + "\"");

        java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);

        int i;
        byte[] buffer = new byte[1048];

        while ((i=fileInputStream.read(buffer)) != -1) {
            response.getOutputStream().write(buffer,0,i);
        }
        fileInputStream.close();
    }

    if (companyManager.getResult() == -2) {
        message = companyManager.getErrorMessage();
    }


%>

<html>

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="../resources/logoS.png">
    <link rel="icon" type="image/png" href="../resources/logoS.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Kozel100 CRM
    </title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>

    <!-- Material Design for Bootstrap fonts and icons -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500|Material+Icons" rel="stylesheet">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="/css/common.css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">


    <style>

        .filter {

            background-color: rgba(0, 0, 0, .05);
            padding-top: 2%;
            padding-left: 2%;
            padding-right: 2%;
            border-radius: 7px;
            margin-bottom: 2%;

        }

        #errorCompany {

            width: 60%;
            text-align: center;
            margin: 0 auto;

        }

        .filterGroup {

            display: none;

        }

        div.filter {

            display: none;

        }

        .highlight {
            background: #C8E6C9 !important;

        }

        .highlight a {

            color: #3c6b3d !important;

        }

        .highlightField {

            background-color: #ededed !important;

        }

        #tagBtn {
            display: none;

        }

        #exportBtn {
            display: none;

        }

        .selectable{

            cursor: pointer;

        }

        .selectable:hover{

            color: #54a172;

        }

        .selectableError{

            color: rgba(220, 20, 60, 0.78) !important;

        }

        #exportForm{

            display: none;

        }

        tr{

            cursor: pointer;

        }

        .successSnackbar {
            min-width: 250px; /* Set a default minimum width */
            margin-left: -125px; /* Divide value of min-width by 2 */
            background-color: #54a172;
            color: #fff; /* White text color */
            text-align: center; /* Centered text */
            border-radius: 7px; /* Rounded borders */
            padding: 16px; /* Padding */
            position: fixed; /* Sit on top of the screen */
            z-index: 1; /* Add a z-index if needed */
            left: 50%; /* Center the snackbar */
            bottom: 30px; /* 30px from the bottom */
        }

        .errorSnackbar {
            min-width: 250px; /* Set a default minimum width */
            margin-left: -125px; /* Divide value of min-width by 2 */
            background-color: rgba(220, 20, 60, 0.78);
            color: #fff; /* White text color */
            text-align: center; /* Centered text */
            border-radius: 7px; /* Rounded borders */
            padding: 16px; /* Padding */
            position: fixed; /* Sit on top of the screen */
            z-index: 1; /* Add a z-index if needed */
            left: 50%; /* Center the snackbar */
            bottom: 30px; /* 30px from the bottom */
        }

    </style>
</head>

<body>
<jsp:include page="/Common/Navbar.jsp"/>

<div class="container">
    <%if (complete) {%>
    <div id="complete" value="true" style="display: none"><%=complete%></div>
    <%}%>

    <div class="row">
        <div class="col-md-12">

            <h1 class="text-center">
                Companies
            </h1>
            <h2 class="text-center">
                <button class="btn btn-outline-secondary" data-toggle="modal" data-target="#insertCompanyModal"><i
                        class="fa fa-plus"></i>Add New
                </button>
                <button class="btn btn-outline-secondary" id="toggleFilterButton"><i class="fa fa-plus"></i>Filter
                </button>
                <button class="btn btn-outline-secondary" id="exportBtn"><i class="fa fa-plus"></i>Export</button>
                <button class="btn btn-outline-secondary" id="tagBtn" data-toggle="modal" data-target="#addTag"><i
                        class="fa fa-plus"></i>Tag
                </button>
            </h2>
        </div>

        <div class="container filter col-md-12" id="filter">

            <form id="filterForm" action="ViewCompanies.jsp" method="post">

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByType" name="filterByType"
                               value="false">
                        Client Type
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterClientTypeGroup">
                    <select class="form-control" id="clientTypeId" name="clientTypeId">
                        <%for (int k = 0; k < companyManager.getClientTypes().length; k++) {%>
                        <option value="<%=companyManager.getClientType(k).clientTypeId%>">
                            <%=companyManager.getClientType(k).name%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByUser" name="filterByUser"
                               value="false">
                        Assigned User
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterUserGroup">
                    <select class="form-control" id="userId" name="userId">
                        <%for (int k = 0; k < companyManager.getUsers().length; k++) {%>
                        <option value="<%=companyManager.getUser(k).userId%>">
                            <%=companyManager.getUser(k).lastName%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByProduct" name="filterByProduct"
                               value="false">
                        Product Category
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterProductGroup">
                    <select class="form-control" id="productCategoryId" name="productCategoryId">
                        <%for (int k = 0; k < companyManager.getProductCategories().length; k++) {%>
                        <option value="<%=companyManager.getProductCategory(k).productCategoryId%>">
                            <%=companyManager.getProductCategory(k).name%>
                        </option>
                        <% } %>
                    </select>
                </div>


                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByTag" name="filterByTag"
                               value="false">
                        Tags
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterTagGroup">
                    <select class="form-control multipleSelect" id="tagId" multiple="multiple" name="tagId">
                        <%for (int k = 0; k < companyManager.getTags().length; k++) {%>
                        <option value="<%=companyManager.getTag(k).tagId%>">
                            <%=companyManager.getTag(k).name%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <input type="hidden" name="status" value="filter">
            </form>

        </div>

        <%
            int nCompanies = companyManager.getCompanies().map(companies -> companies.length).orElse(0);
            if (nCompanies > 0) {
        %>
        <table class="col-md-12 table table-striped" id="companiesTable">
            <thead class="cf">
            <tr>
                <th scope="col">#</th>
                <th scope="col" class="selectable" value="name">Name</th>
                <th scope="col" class="selectable" value="country">Country</th>
                <th scope="col" class="selectable" value="city">City</th>
                <th scope="col" class="selectable" value="vat">VAT</th>
                <th scope="col" class="selectable" value="email">Email</th>
                <th scope="col" class="selectable" value="contactReference">Contact Reference</th>
                <th scope="col" class="selectable" value="startDate">Client Since</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%for (int k = 0; k < nCompanies; k++) {%>
            <tr value=<%=companyManager.getCompany(k).companyId%>>
                <th scope="row"><%= k %>
                </th>

                <td>
                    <a style="font-size:large; color:#45a149" href="JavaScript: viewCompany('<%=companyManager.getCompany(k).companyId%>');"><%=companyManager.getCompany(k).name%>
                    </a></td>
                <td><%=companyManager.getCompany(k).country%>
                </td>
                <td><%=companyManager.getCompany(k).city%>
                </td>
                <td><%=companyManager.getCompany(k).vat%>
                </td>
                <td><%=companyManager.getCompany(k).email%>
                </td>
                <td><%
                    ContactPerson person = companyManager.getContactPersonByCompanyId(companyManager.getCompany(k).companyId);%>
                    <%=person.fullName()%>
                    <input type="hidden" name="firstName" value="<%=person.firstName%>"/>
                    <input type="hidden" name="lastName" value="<%=person.lastName%>"/>
                    <input type="hidden" name="phoneNumber" value="<%=person.phoneNumber%>"/>
                    <input type="hidden" name="contactEmail" value="<%=person.email%>"/>
                </td>
                <td><%=companyManager.getCompany(k).startDate%>
                </td>
                <td>
                    <a style=" color:#34373b" class="edit" title="Edit" data-toggle="tooltip"
                       href="JavaScript: updateCompany('<%=companyManager.getCompany(k).companyId%>','<%=companyManager.getCompany(k).name%>','<%=companyManager.getCompany(k).vat%>','<%=companyManager.getCompany(k).email%>','<%=companyManager.getCompany(k).clientTypeId%>','<%=companyManager.getCompany(k).productCategoryId%>','<%=companyManager.getCompany(k).userId%>','<%=companyManager.getCompany(k).country%>','<%=companyManager.getCompany(k).state%>','<%=companyManager.getCompany(k).city%>','<%=companyManager.getCompany(k).zip%>','<%=companyManager.getCompany(k).address%>','<%=companyManager.getCompany(k).startDate%>','<%=person.firstName%>','<%=person.lastName%>','<%=person.email%>','<%=person.phoneNumber%>');"><i
                            class="material-icons">&#xE254;</i></a>
                    <a style=" color:#34373b"  class="delete" title="Delete" data-toggle="tooltip"
                       href="JavaScript:deleteCompany('<%=companyManager.getCompany(k).companyId%>','<%=companyManager.getCompany(k).name%>');"><i
                            class="material-icons">&#xE872;</i></a>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <%} else {%>
        <div class="jumbotron col-md-12" id="errorCompany">

            <h3>No companies found</h3>

        </div>
        <%}%>

        <form name="deleteCompanyForm" action="ViewCompanies.jsp" method="post">
            <input type="hidden" name="companyId" value=""/>
            <input type="hidden" name="status" value="deleteCompany"/>
        </form>
        <form name="viewCompanyForm" action="ViewCompany.jsp" method="post">
            <input type="hidden" name="companyId" value=""/>
            <input type="hidden" name="status" value="view"/>
        </form>

        <!-- Tag Modal -->
        <div class="modal fade" id="addTag" tabindex="-1" role="dialog" aria-labelledby="addTagLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addTagLabel">Add Tag</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="companyManager" id="tagModalForm" action="" method="post">
                            <div class="form-group">
                                <label for="tagIds" class="bmd-label-floating">Tags</label>
                                <select class="form-control multipleSelect" name="tagIds" id="tagIds"
                                        multiple="multiple">
                                    <%for (int k = 0; k < companyManager.getTags().length; k++) {%>
                                    <option value="<%=companyManager.getTag(k).tagId%>">
                                        <%=companyManager.getTag(k).name%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary btn-raised"
                                        onclick="">
                                    Submit
                                </button>
                                <input type="hidden" name="status" value="addTag"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Update Company Modal -->
        <div class="modal fade" id="updateCompanyModal" tabindex="-1" role="dialog" aria-labelledby="updateCompanyTitle"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateNoteLabel">Update Note</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="updateCompanyForm" action="" method="post">
                            <div class="form-group">
                                <label for="updateName" class="bmd-label-floating">Name</label>
                                <%if (message == null) {%>
                                <input type="text" name="name" maxlength="50" class="form-control" id="updateName"
                                       required>
                                <%}%>
                                <%if (message != null) {%>
                                <input type="text" name="name" maxlength="50" class="form-control is-invalid"
                                       id="updateName"
                                       value="<%=companyManager.getName()%>" required>
                                <div class="invalid-feedback">
                                    <%=message%>
                                </div>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label for="updateVat" class="bmd-label-floating">VAT</label>
                                <input type="number" name="vat" class="form-control" id="updateVat"
                                       <%if (message != null)%>value="<%=companyManager.getVat()%>" required
                                       min="11111111111" max="99999999999">
                            </div>
                            <div class="form-group">
                                <label for="updateCompanyStartDate" class="bmd-label-floating">Client Since</label>
                                <input type="date" name="companyStartDate" class="form-control"
                                       id="updateCompanyStartDate" required oninput="pastDate(this)"
                                       <%if (message != null)%>value="<%=companyManager.getCompanyStartDate()%>"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="updateCompanyEmail" class="bmd-label-floating">Email</label>
                                <input type="email" name="companyEmail" class="form-control" id="updateCompanyEmail"
                                       <%if (message != null)%>value="<%=companyManager.getCompanyEmail()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="updateClientTypeId" class="bmd-label-floating">Client Type</label>
                                <select class="form-control" id="updateClientTypeId" name="clientTypeId" required>
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
                                <label for="updateProductCategoryId" class="bmd-label-floating">Product Category</label>
                                <select class="form-control" id="updateProductCategoryId" name="productCategoryId"
                                        required>
                                    <%for (int x = 0; x < companyManager.getProductCategories().length; x++) {%>
                                    <%if ((message != null) && (companyManager.getProductCategory(x).productCategoryId == companyManager.getProductCategoryId())) {%>
                                    <option value="<%=companyManager.getProductCategory(x).productCategoryId%>"
                                            selected>
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
                                <label for="updateUserId" class="bmd-label-floating">Responsible User</label>
                                <select class="form-control" id="updateUserId" name="userId">
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
                            <div class="form-group">
                                <label for="updateCountry" class="bmd-label-floating">Country</label>
                                <input type="text" name="country" class="form-control" id="updateCountry"
                                       <%if (message != null)%>value="<%=companyManager.getCountry()%>"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="updateState" class="bmd-label-floating">State</label>
                                <input type="text" name="state" class="form-control" id="updateState"
                                       <%if (message != null)%>value="<%=companyManager.getState()%>"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="updateCity" class="bmd-label-floating">City</label>
                                <input type="text" maxlength="50" name="city" class="form-control" id="updateCity"
                                       <%if (message != null)%>value="<%=companyManager.getCity()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="updateZip" class="bmd-label-floating">Zip</label>
                                <input type="number" name="zip" class="form-control" id="updateZip"
                                       <%if (message != null)%>value="<%=companyManager.getZip()%>" required min="111"
                                       max="9999999999">
                            </div>
                            <div class="form-group">
                                <label for="updateAddress" class="bmd-label-floating">Address</label>
                                <input type="text" maxlength="50" name="address" class="form-control" id="updateAddress"
                                       <%if (message != null)%>value="<%=companyManager.getAddress()%>" required>
                            </div>
                            <div class="jumbotron">
                                <h1>Contact Reference</h1>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="updateFirstName" class="bmd-label-floating">First Name</label>
                                        <input type="text" maxlength="50" name="firstName" class="form-control"
                                               id="updateFirstName"
                                               <%if (message != null)%>value="<%=companyManager.getFirstName()%>"
                                               required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="updateLastName" class="bmd-label-floating">Last Name</label>
                                        <input type="text" maxlength="50" name="lastName" class="form-control"
                                               id="updateLastName"
                                               <%if (message != null)%>value="<%=companyManager.getLastName()%>"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="updatePhoneNumber" class="bmd-label-floating">Phone Number</label>
                                    <input type="tel" pattern='[\+]\d{12}' title='Phone Number (Format: +999999999999)' name="phoneNumber" class="form-control"
                                           id="updatePhoneNumber"
                                           <%if (message != null)%>value="<%=companyManager.getPhoneNumber()%>"
                                           required>
                                </div>
                                <div class="form-group">
                                    <label for="updateContactEmail" class="bmd-label-floating">Email</label>
                                    <input type="email" name="contactEmail" class="form-control" id="updateContactEmail"
                                           <%if (message != null)%>value="<%=companyManager.getcontactEmail()%>"
                                           required>
                                </div>
                            </div>
                            <input type="hidden" name="companyId" value=""/>
                            <div class="modal-footer">
                                <input type="hidden" name="status" value="updateCompany"/>
                                <button type="submit" onclick="update(this.form)" class="btn btn-primary btn-raised">
                                    Submit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Insert Company Modal -->
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
                                <input type="text" name="name" maxlength="50" class="form-control" id="name" required>
                                <%}%>
                                <%if (message != null) {%>
                                <input type="text" name="name" maxlength="50" class="form-control is-invalid" id="name"
                                       value="<%=companyManager.getName()%>" required>
                                <div class="invalid-feedback">
                                    <%=message%>
                                </div>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <label for="vat" class="bmd-label-floating">VAT</label>
                                <input type="number" name="vat" class="form-control" id="vat"
                                       <%if (message != null)%>value="<%=companyManager.getVat()%>" required
                                       min="11111111111" max="99999999999">
                            </div>
                            <div class="form-group">
                                <label for="companyStartDate" class="bmd-label-floating">Client Since</label>
                                <input type="date" name="companyStartDate" class="form-control"
                                       id="companyStartDate" required oninput="pastDate(this)"
                                       <%if (message != null)%>value="<%=companyManager.getCompanyStartDate()%>"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="companyEmail" class="bmd-label-floating">Email</label>
                                <input type="email" name="companyEmail" class="form-control" id="companyEmail"
                                       <%if (message != null)%>value="<%=companyManager.getCompanyEmail()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="clientTypeId2" class="bmd-label-floating">Client Type</label>
                                <select class="form-control" id="clientTypeId2" name="clientTypeId" required>
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
                                <label for="productCategoryId2" class="bmd-label-floating">Product Category</label>
                                <select class="form-control" id="productCategoryId2" name="productCategoryId" required>
                                    <%for (int x = 0; x < companyManager.getProductCategories().length; x++) {%>
                                    <%if ((message != null) && (companyManager.getProductCategory(x).productCategoryId == companyManager.getProductCategoryId())) {%>
                                    <option value="<%=companyManager.getProductCategory(x).productCategoryId%>"
                                            selected>
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
                            <div class="form-group">
                                <label for="country" class="bmd-label-floating">Country</label>
                                <select name="country" class="form-control" id="country"
                                        <%if (message != null)%>value="<%=companyManager.getCountry()%>"
                                        required></select>
                            </div>
                            <div class="form-group">
                                <label for="state" class="bmd-label-floating">State</label>
                                <select name="state" class="form-control" id="state"
                                        <%if (message != null)%>value="<%=companyManager.getState()%>"
                                        required></select>
                            </div>
                            <div class="form-group">
                                <label for="city" class="bmd-label-floating">City</label>
                                <input type="text" maxlength="50" name="city" class="form-control" id="city"
                                       <%if (message != null)%>value="<%=companyManager.getCity()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="zip" class="bmd-label-floating">Zip</label>
                                <input type="number" name="zip" class="form-control" id="zip"
                                       <%if (message != null)%>value="<%=companyManager.getZip()%>" required min="111"
                                       max="9999999999">
                            </div>
                            <div class="form-group">
                                <label for="address" class="bmd-label-floating">Address</label>
                                <input type="text" maxlength="50" name="address" class="form-control" id="address"
                                       <%if (message != null)%>value="<%=companyManager.getAddress()%>" required>
                            </div>
                            <div class="jumbotron">
                                <h1>Contact Reference</h1>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="firstName" class="bmd-label-floating">First Name</label>
                                        <input type="text" maxlength="50" name="firstName" class="form-control"
                                               id="firstName"
                                               <%if (message != null)%>value="<%=companyManager.getFirstName()%>"
                                               required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="lastName" class="bmd-label-floating">Last Name</label>
                                        <input type="text" maxlength="50" name="lastName" class="form-control"
                                               id="lastName"
                                               <%if (message != null)%>value="<%=companyManager.getLastName()%>"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phoneNumber" class="bmd-label-floating">Phone Number</label>
                                    <input type="tel" type='tel' pattern='[\+]\d{12}' title='Phone Number (Format: +999999999999)' name="phoneNumber" class="form-control"
                                           id="phoneNumber"
                                           <%if (message != null)%>value="<%=companyManager.getPhoneNumber()%>"
                                           required>
                                </div>
                                <div class="form-group">
                                    <label for="contactEmail" class="bmd-label-floating">Email</label>
                                    <input type="email" name="contactEmail" class="form-control" id="contactEmail"
                                           <%if (message != null)%>value="<%=companyManager.getcontactEmail()%>"
                                           required>
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

<%--export form--%>
<form name="exportForm" id="exportForm" action="ViewCompanies.jsp" method="post" target="_blank">
    <input type="hidden" name="status" value="exportCompanies"/>
</form>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
        integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
        integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script type="text/javascript" src="/js/countries.js"></script>
<script>


    $(document).ready(function () {
        $('body').bootstrapMaterialDesign();

        $('.multipleSelect').css('width', '100%');
        $('.multipleSelect').select2();
        populateCountries("country", "state");

        if ($('#modal').val() == 1) {
            $('#insertCompanyModal').modal('show');
        }

        if($('#complete').text()){

            snackbar("Company successfully added","successSnackbar")

        }

        //Inserimento delle compagnie in struttura dati JS
        let companies = [];

        <% int nOfCompanies = companyManager.getCompanies().map(t -> t.length).orElse(0);
            if (nOfCompanies != 0) {%>
        <% for(int x=0;x<nOfCompanies;x++){ %>
        companies.push({
            id: <%=companyManager.getCompany(x).companyId%>,
            name: "<%=companyManager.getCompany(x).name%>",
            vat: "<%=companyManager.getCompany(x).vat%>",
            address: "<%=companyManager.getCompany(x).address%>",
            city: "<%=companyManager.getCompany(x).city%>",
            email: "<%=companyManager.getCompany(x).email%>",
            userId: "<%=companyManager.getCompany(x).userId%>",
            productCategoryId: "<%=companyManager.getCompany(x).productCategoryId%>",
            clientTypeId: "<%=companyManager.getCompany(x).clientTypeId%>",

            contacts: [],
            tags: []
        });

        <% int nTags = companyManager.getTagsForCompany(companyManager.getCompany(x).companyId).map(t -> t.size()).orElse(0);
        if (nTags != 0) {

            ArrayList<Tag> tagsForCompany = companyManager.getTagsForCompany(companyManager.getCompany(x).companyId).get();

        %>
        <% for(Tag tag : tagsForCompany){ %>

        companies[<%=x%>].tags.push("<%=tag.tagId%>");

        <%}%>
        <%}%>



        <%}%>
        <%}%>


        let contactPeople = [];

        <% for(int x=0;x<companyManager.getCompanies().map(t -> t.length).orElse(0);x++){ %>

        contactPeople.push({

            companyId: "<%=companyManager.getContactPerson(x).companyId%>",
            fullName: "<%=companyManager.getContactPerson(x).fullName()%>"

        });

        <%}%>


        companies.forEach((company) => {

            for (let i = 0; i < contactPeople.length; i++) {

                if (contactPeople[i].companyId == company.id) {

                    company.contacts.push(contactPeople[i].fullName);

                }

            }

            //console.log(company);


        })

        let companiesByUser = companies.slice();
        let companiesByProduct = companies.slice();
        let companiesByType = companies.slice();
        let companiesByTag = companies.slice();

        //Avoid row highlighting when clicking on company name
        $('#companiesTable tr td a').click(function (event) {
            event.stopPropagation();
        });

        function snackbar(message,type){

            if($('#snackbar').length!=0){

                $('#snackbar').stop()
                $('#snackbar').remove()

            }

            $('body').append('<div id=\"snackbar\">'+message+'</div>')
            $('#snackbar').addClass(type)
            $('#snackbar').addClass('animated fadeInUp').one('animationend',function(){

                $(this).removeClass('animated fadeInUp')

                setTimeout(function(){

                    $('#snackbar').addClass('animated fadeOutDown').one('animationend',function(){

                        $(this).removeClass('animated fadeOutDown')
                        $(this).remove()

                    })

                },2000)

            });

        }

        let selectedCompanies = []
        let selectedFields = []

        //Metodo chiamato per aggiornare il contenuto della tabella in base ai filtri selezionati
        function refreshTable() {


            let filteredCompanies = []

            filteredCompanies = companiesByUser.filter(x => companiesByProduct.includes(x)).filter(y => companiesByType.includes(y)).filter(z => companiesByTag.includes(z))

            $('#companiesTable thead').show(0)

            if(filteredCompanies.length==0){

                $('#companiesTable thead').hide(0)
                snackbar("No companies matching the criteria","errorSnackbar")

            }

            $("#companiesTable tbody tr").each(function () {

                rowId = $(this).attr("value")
                isPresent = false


                for (i = 0; i < filteredCompanies.length; i++) {

                    if (filteredCompanies[i].id == rowId) {

                        isPresent = true;

                    }

                }
                if (isPresent) {

                    $(this).show(0);

                } else {

                    $(this).hide(0);

                }


            })
        }

        function empty(array) {

            while (array.length > 0) {

                array.pop();

            }

        }

        //Metodi che eseguono il filtraggio
        function filterByUserId(userId) {

            empty(companiesByUser)

            companies.forEach((company) => {

                if (company.userId == userId) {

                    companiesByUser.push(company)

                }

            })

        }

        function filterByProductId(productId) {

            empty(companiesByProduct)

            companies.forEach((company) => {

                if (company.productCategoryId == productId) {

                    companiesByProduct.push(company)

                }

            })

        }

        function filterByClientTypeId(typeId) {

            empty(companiesByType)

            companies.forEach((company) => {

                if (company.clientTypeId == typeId) {

                    companiesByType.push(company)

                }

            })


        }

        function filterByTagId(tagId) {

            empty(companiesByTag)

            companies.forEach((company) => {

                console.log(company.tags.filter(c => tagId.includes(c)))

                if (company.tags.filter(c => tagId.includes(c)).length == tagId.length) {

                    companiesByTag.push(company)

                }

            })


        }

        //Gestione delle azioni sui componenti dell'interfaccia
        $("#filterForm select[name='clientTypeId']").on("change", function (select) {

            filterByClientTypeId($("#filterForm select[name='clientTypeId'] option:selected").val());
            refreshTable();

        })

        $("#filterForm select[name='productCategoryId']").on("change", function (select) {

            filterByProductId($("#filterForm select[name='productCategoryId'] option:selected").val());
            refreshTable();

        })

        $("#filterForm select[name='userId']").on("change", function (select) {

            filterByUserId($("#filterForm select[name='userId'] option:selected").val());
            refreshTable();

        })

        $("#filterForm select[name='tagId']").on("change", function (select) {

            //console.log($("#filterForm select[name='tagId']").val());

            filterByTagId($("#filterForm select[name='tagId']").val());
            refreshTable();

        })


        $('#filterForm input:checkbox').each(function () {

            $(this).on("change", function () {


                checkbox = $(this).attr('id');

                if ($(this).val() == "false") {
                    $(this).val("true");

                    if (checkbox == "filterByType") {

                        filterByClientTypeId($("#filterForm select[name='clientTypeId'] option:selected").val())
                        refreshTable()
                        // console.log(companiesByType)
                        // console.log(companiesByUser.filter(x => companiesByProduct.includes(x)).filter(y => companiesByType.includes(y)))


                    }

                    if (checkbox == "filterByUser") {

                        filterByUserId($("#filterForm select[name='userId'] option:selected").val())
                        refreshTable()
                        // console.log(companiesByUser)
                        // console.log(companiesByUser.filter(x => companiesByProduct.includes(x)).filter(y => companiesByType.includes(y)))


                    }

                    if (checkbox == "filterByProduct") {

                        filterByProductId($("#filterForm select[name='productCategoryId'] option:selected").val())
                        refreshTable()
                        // console.log(companiesByProduct)
                        // console.log(companiesByUser.filter(x => companiesByProduct.includes(x)).filter(y => companiesByType.includes(y)))


                    }

                    if (checkbox == "filterByTag") {

                        filterByTagId($("#filterForm select[name='tagId']").val())
                        refreshTable()
                        // console.log(companiesByProduct)
                        // console.log(companiesByUser.filter(x => companiesByProduct.includes(x)).filter(y => companiesByType.includes(y)))


                    }


                } else {

                    $(this).val("false");

                    if (checkbox == "filterByType") {

                        companiesByType = companies.slice()
                        refreshTable()
                        // console.log(companiesByType)
                        // console.log(companiesByUser.filter(x => companiesByProduct.includes(x)).filter(y => companiesByType.includes(y)))


                    }

                    if (checkbox == "filterByUser") {

                        companiesByUser = companies.slice()
                        refreshTable()
                        // console.log(companiesByUser)
                        // console.log(companiesByUser.filter(x => companiesByProduct.includes(x)).filter(y => companiesByType.includes(y)))


                    }

                    if (checkbox == "filterByProduct") {

                        companiesByProduct = companies.slice()
                        //console.log(companiesByProduct)
                        refreshTable()
                        // console.log(companiesByProduct)
                        // console.log(companiesByUser.filter(x => companiesByProduct.includes(x)).filter(y => companiesByType.includes(y)))


                    }

                    if (checkbox == "filterByTag") {

                        companiesByTag = companies.slice()
                        refreshTable()


                    }
                }

                if (checkbox == "filterByType") {
                    $('#filterClientTypeGroup').slideToggle(300);
                }

                if (checkbox == "filterByUser") {
                    $('#filterUserGroup').slideToggle(300);
                }

                if (checkbox == "filterByProduct") {
                    $('#filterProductGroup').slideToggle(300);

                }

                if (checkbox == "filterByTag") {
                    $('#filterTagGroup').slideToggle(300);

                }


            })


        })

        $("#companiesTable thead tr .selectable").click(function () {

            $(this).toggleClass("highlightField")

            if (!selectedFields.includes($(this).attr("value"))) {
                selectedFields.push($(this).attr("value"))
            } else {

                selectedFields.splice(selectedFields.indexOf($(this).attr("value")), 1)

            }

            console.log(selectedFields)

        })

        $("#companiesTable tbody tr").click(function () {

            $(this).toggleClass("highlight")

            if (!selectedCompanies.includes($(this).attr("value"))) {
                selectedCompanies.push($(this).attr("value"))
            } else {

                selectedCompanies.splice(selectedCompanies.indexOf($(this).attr("value")), 1)

            }

            //console.log(selectedCompanies.length>0)
            //console.log(selectedCompanies)

            if ((selectedCompanies.length) > 0) {

                $('#tagBtn').fadeIn(300)
                $('#exportBtn').fadeIn(300)

            } else {

                $('#tagBtn').fadeOut(300)
                $('#exportBtn').fadeOut(300)


            }


        })

        $('#tagModalForm').on('submit', function (e) {

            $(this).append('<select id=\"selectedCompanies\" name=\"selectedCompanies\"multiple></select>')

            selectedCompanies.forEach(c => {

                $('#selectedCompanies').append('<option value=\"' + c + '\" selected></option>')

            })

            $('#selectedCompanies').hide(0)

        });

        $('#exportBtn').click(function () {

            console.log(selectedFields)
            console.log(selectedCompanies)
            //error animation for no fields selected
            if(selectedFields.length==0){

                $('#companiesTable thead tr .selectable').addClass('animated tada selectableError').one('animationend',function(){

                    $(this).removeClass('animated tada selectableError')

                });

                $('#exportBtn').addClass('animated pulse btn-outline-danger').one('animationend',function(){

                    $(this).removeClass('animated pulse btn-outline-danger')
                    $(this).blur()

                });

                snackbar("Select at least one field","errorSnackbar")
                $(this).blur()


            }

            else {


                $('#exportForm').append('<select id=\"selectedFields\" name=\"selectedFields\"multiple></select>')

                selectedFields.forEach(c => {

                    $('#selectedFields').append('<option value=\"' + c + '\" selected></option>')

                })


                $('#exportForm').append('<select id=\"selectedCompanies\" name=\"selectedCompanies\"multiple></select>')

                selectedCompanies.forEach(c => {

                    $('#selectedCompanies').append('<option value=\"' + c + '\" selected></option>')

                })

                $('#exportForm').submit();
                $('#exportForm select').remove()
            }

        });


    });


    $('#toggleFilterButton').click(function () {

        $('#filter').slideToggle(300);

    });

    function pastDate(input) {
        var GivenDate = input.value;
        var CurrentDate = new Date();
        GivenDate = new Date(GivenDate);

        if (GivenDate > CurrentDate) {
            input.setCustomValidity("Are you John Titor?");
            return false;
        } else {
            input.setCustomValidity('');
            return true;
        }
    }




</script>

<script language="JavaScript">


    function redirect() {

        window.location.replace("/Company/InsertCompany.jsp");

    }

    function deleteCompany(id, name) {

        r = confirm("Are you sure you want to delete : " + name + "?");

        if (r === true) {
            document.deleteCompanyForm.companyId.value = id;

            document.deleteCompanyForm.submit();
        }
        else {
            return;
        }

    }

    $('#updateCompanyModal').on('shown.bs.modal', function() {
        $('#updateName').focus();
    })


    function updateCompany(id, name, vat, companyEmail, clientTypeId, productCategoryId, userId, country, state, city, zip, address, date, firstName, lastName, contactEmail, phoneNumber) {
        $('#updateCompanyModal').modal('show', );
        document.updateCompanyForm.companyId.value = id;
        document.updateCompanyForm.name.value = name;
        document.updateCompanyForm.vat.value = vat;
        document.updateCompanyForm.companyEmail.value = companyEmail;
        document.updateCompanyForm.clientTypeId.value = clientTypeId;
        document.updateCompanyForm.productCategoryId.value = productCategoryId;
        document.updateCompanyForm.userId.value = userId;
        document.updateCompanyForm.country.value = country;
        document.updateCompanyForm.state.value = state;
        document.updateCompanyForm.city.value = city;
        document.updateCompanyForm.zip.value = zip;
        document.updateCompanyForm.companyStartDate.value = date;
        document.updateCompanyForm.address.value = address;
        document.updateCompanyForm.firstName.value = firstName;
        document.updateCompanyForm.lastName.value = lastName;
        document.updateCompanyForm.contactEmail.value = contactEmail;
        document.updateCompanyForm.phoneNumber.value = phoneNumber;
    }


    function viewCompany(id) {
        document.viewCompanyForm.companyId.value = id;
        document.viewCompanyForm.submit();
    }

    function insert(form) {

        form.action = "ViewCompanies.jsp";
        form.submit();
    }

    function update(form) {

        form.action = "ViewCompanies.jsp";
        form.submit();
    }


</script>
</body>
</html>
