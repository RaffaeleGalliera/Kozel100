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
    String previousStatus = "none";
    Boolean filterByUser = false;
    Boolean filterByType = false;
    Boolean filterByProduct = false;
    String userId=null;
    String clientTypeId=null;
    String productCategoryId=null;

    if (status == null) status = "view"; //

    if (status.equals("view")) {


        if(request.getParameter("previousStatus")!=null && request.getParameter("previousStatus").equals("filter")){

            previousStatus = "filter";

        }

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
        previousStatus = request.getParameter("previousStatus");

        filterByUser = Boolean.parseBoolean(request.getParameter("filterByUser"));
        userId = request.getParameter("userId");

        if (filterByUser) {

            filters.put("userId", Integer.parseInt(userId));

        }

        filterByType = Boolean.parseBoolean(request.getParameter("filterByType"));
        clientTypeId = request.getParameter("clientTypeId");

        if (filterByType) {

            filters.put("clientTypeId", Integer.parseInt(clientTypeId));

        }

        filterByProduct = Boolean.parseBoolean(request.getParameter("filterByProduct"));
        productCategoryId = request.getParameter("productCategoryId");

        if (filterByProduct) {

            filters.put("productCategoryId", Integer.parseInt(productCategoryId));

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
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500|Material+Icons" rel="stylesheet">
    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">

    <style>

        .filter {

            background-color: #e9ecef;
            padding-top: 2%;
            padding-left: 2%;
            padding-right: 2%;
            border-radius: 7px;
            margin-bottom: 2%;


        }

        #errorCompany{

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

        #companiesTable{

            display:none;

        }

        #errorCompany{

            display:none;

        }

    </style>


    <title>Kozel100 CRM</title>

</head>

<body>
<jsp:include page="/Common/Navbar.jsp"/>

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
                <button class="btn btn-outline-secondary" data-toggle="modal" data-target="#insertCompanyModal"><i
                        class="fa fa-plus"></i>Add New
                </button>
                <button class="btn btn-outline-secondary" id="toggleFilterButton"><i class="fa fa-plus"></i>Filter</button>
            </h1>
        </div>

        <div class="container filter col-md-12" id="filter">

            <form id="filterForm" action="ViewCompanies.jsp" method="post">
                <div class="outerGroup">
                    <div class="switch">
                        <label>
                            <input class="form-check-input" type="checkbox" id="filterByType" name="filterByType"
                                   value="false">
                            Tipo Cliente
                        </label>
                    </div>
                    <div class="form-group filterGroup" id="filterClientTypeGroup">
                        <select class="form-control" id="clientTypeId" name="clientTypeId">
                            <%for (int k = 0; k < companyManager.getClientTypes().length; k++) {%>
                            <option value="<%=companyManager.getClientType(k).clientTypeId%>" <%if(status.equals("filter") && companyManager.getClientType(k).clientTypeId==Integer.parseInt(clientTypeId)){%>selected<%}%>
                            ><%=companyManager.getClientType(k).name%>
                            </option>
                            <% } %>
                        </select>
                        <input type="hidden" name="wasVisible" value=<%=filterByType%>>
                    </div>
                </div>
                <div class="outerGroup">
                    <div class="switch">
                        <label>
                            <input class="form-check-input" type="checkbox" id="filterByUser" name="filterByUser"
                                   value="false">
                            Utente
                        </label>
                    </div>
                    <div class="form-group filterGroup" id="filterUserGroup">
                        <select class="form-control" id="userId" name="userId">
                            <%for (int k = 0; k < companyManager.getUsers().length; k++) {%>
                            <option value="<%=companyManager.getUser(k).userId%>" <%if(status.equals("filter") && companyManager.getUser(k).userId==Integer.parseInt(userId)){%>selected<%}%>
                            ><%=companyManager.getUser(k).lastName%>
                            </option>
                            <% } %>
                        </select>
                        <input type="hidden" name="wasVisible" value=<%=filterByUser%>>
                    </div>
                </div>

                <div class="outerGroup">
                    <div class="switch">
                        <label>
                            <input class="form-check-input" type="checkbox" id="filterByProduct" name="filterByProduct"
                                   value="false">
                            Categoria Merceologica
                        </label>
                    </div>
                    <div class="form-group filterGroup" id="filterProductGroup">
                        <select class="form-control" id="productCategoryId" name="productCategoryId">
                            <%for (int k = 0; k < companyManager.getProductCategories().length; k++) {%>
                            <option value="<%=companyManager.getProductCategory(k).productCategoryId%>" <%if(status.equals("filter") && companyManager.getProductCategory(k).productCategoryId==Integer.parseInt(productCategoryId)){%>selected<%}%>
                            ><%=companyManager.getProductCategory(k).name%>
                            </option>
                            <% } %>
                        </select>
                        <input type="hidden" name="wasVisible" value=<%=filterByProduct%>>
                    </div>
                </div>


                <input type="hidden" name="status" value="filter">
                <input type="hidden" name="previousStatus" value=<%=previousStatus%>>
                <input type="hidden" name="wasFiltering" value=<%=status.equals("filter") || previousStatus.equals("filter")%>>
                <%--<button type="button" class="btn btn-primary btn-raised" onclick="getFiltered()">Submit</button>--%>

            </form>

        </div>

        <%int nCompanies = companyManager.getCompanies().map(companies -> companies.length ).orElse(0);
        if(nCompanies>0){%>
        <table class="col-md-12 table table-striped" id="companiesTable">
            <thead class="cf">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Country</th>
                <th scope="col">City</th>
                <th scope="col">VAT</th>
                <th scope="col">Email</th>
                <th scope="col">Contact Reference</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%for (int k = 0; k < nCompanies; k++) {%>
            <tr>
                <th scope="row"><%= k %>
                </th>

                <td><a href="JavaScript: viewCompany('<%=companyManager.getCompany(k).companyId%>');"><%=companyManager.getCompany(k).name%></a></td>
                <td><%=companyManager.getCompany(k).country%>
                </td>
                <td><%=companyManager.getCompany(k).city%>
                </td>
                <td><%=companyManager.getCompany(k).vat%>
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
        <%}else{%>
        <div class="jumbotron col-md-12" id="errorCompany">

            <h3>No companies found</h3>

        </div>
        <%}%>

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
                                    <input type="tel" maxlength="13" name="phoneNumber" class="form-control"
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
<script type="text/javascript" src="/js/countries.js"></script>
<script>

    $(document).ready(function () {
        $('body').bootstrapMaterialDesign();
            if ($('#modal').val() == 1) {
                $('#insertCompanyModal').modal('show');
            }

        //Il Selettore prende il filterGroup dei vari hidden e li mostra se erano precedentemente attivi
        $("input[name='wasVisible'][value='true']").parentsUntil($('.outerGroup')).toggle(0);

        //Questo prende tutte le checkbox che devono tornare visibili e le setta true
        $("input[name='wasVisible'][value='true']").parentsUntil($('.outerGroup')).siblings().find("input[type='checkbox']").each(function() {

            $(this).val("true");
            $(this).prop( "checked", true );

        })

        //Se filtro era gia aperto lo riapro
        f =$("#filter input[name='wasFiltering']");

        if(f.val() == "true"){


            $('#filter').fadeIn(0);


        }

        $('#companiesTable').fadeToggle(200);
        $('#errorCompany').fadeToggle(200);

        console.log($("#filter input[name='previousStatus']").val());





    });

</script>

<script language="JavaScript">
    populateCountries("country", "state");

    function redirect() {

        window.location.replace("/Company/InsertCompany.jsp");

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

    $('#toggleFilterButton').click(function(){

        $('#filter').slideToggle(300);

        if($("#filter input[name='previousStatus']").val()!="filter"){

            $("#filter input[name='previousStatus']").val("filter");

        }else{

            $("#filter input[name='previousStatus']").val("none");

        }



    });

    $('#filterForm select').on("change",function() {

        $('#filterForm').submit();

    })


    $('#filterForm input:checkbox').each(function() {

        $(this).on("change",function(){


            checkbox = $(this).attr('id');

            if($(this).val()=="false"){
                $(this).val("true");
            }else{
                $(this).val("false");
            }

            if(checkbox == "filterByType"){
                $('#filterClientTypeGroup').slideToggle(300);
            }

            if(checkbox == "filterByUser"){
                $('#filterUserGroup').slideToggle(300);
            }

            if(checkbox == "filterByProduct"){
                $('#filterProductGroup').slideToggle(300);
            }

            if($("#filterForm input[type='checkbox'][value='false']").length==3){

                $("#filterForm [name='status']").val("view");
                $("#filterForm").submit();


            }else{

                $("#filterForm [name='status']").val("filter");
                $("#filterForm").submit();

            }


        })


    })

    // $('#filterForm input:checkbox').each(function() {
    //
    //     $(this).on("change",function(){
    //
    //         checkbox = $(this).attr('id');
    //
    //         if($(this).val()=="false"){
    //             $(this).val("true");
    //         }else{
    //             $(this).val("false");
    //             if($("#filter input[name='wasFiltering']").val()=="true") {
    //                 $('#filterForm').submit();
    //             }
    //         }
    //
    //         if(checkbox == "filterByType"){
    //             $('#filterClientTypeGroup').slideToggle(300);
    //         }
    //
    //         if(checkbox == "filterByUser"){
    //             $('#filterUserGroup').slideToggle(300);
    //         }
    //
    //         if(checkbox == "filterByProduct"){
    //             $('#filterProductGroup').slideToggle(300);
    //         }
    //
    //     })
    //
    // })

</script>
</body>
</html>
