<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 22/09/18
  Time: 21.48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page info="Inserimento nuovo Contatto" %>
<%@ page session="false"%>
<%@ page buffer="30kb" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>
<%

    String status = null;
    String message = null;
    boolean complete = false;

    status = request.getParameter("status");

    if (status == null) {
        status = "view";
        companyManager.companiesView();
    }

    if (status.equals("insertContactPerson")) {
        companyManager.insertContactPerson();

        if (companyManager.getResult() == 0) {
            complete = true;
        } else {
            status = "view";
        }
    }

    if (companyManager.getResult() == -2) {
        message = companyManager.getErrorMessage();
    }
%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="/css/common.css">


    <!-- Material Design for Bootstrap fonts and icons -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500|Material+Icons" rel="stylesheet">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">

    <title>Kozel100</title>

</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<div class="container col-lg-12">
    <%if (complete){%>
    <div class="jumbotron">
        <h2>Contact Person successfully added!</h2>
    </div>
    <%}%>
    <div class="col-sm-10 form-group-lg block center">
        <h1 class="text-center">
            New Contact Person
        </h1>
        <form action="ViewCompanies.jsp">
            <button style="float:right" type="submit" value="InsertContactPerson" class="btn btn-default">
                Back To List
            </button>

            </h1>
        </form>
        <form name="companyManager" action="InsertContactPerson.jsp" method="post">
            <div class="form-group">
                <label for="firstName" class="bmd-label-floating">First Name</label>
                <input type="text" name="firstName" class="form-control" id="firstName">
            </div>
            <div class="form-group">
                <label for="lastName" class="bmd-label-floating">Last Name</label>
                <input type="text" name="lastName" class="form-control" id="lastName">
            </div>
            <div class="form-group">
                <label for="phoneNumber" class="bmd-label-floating">Phone Number</label>
                <input type="text" name="phoneNumber" class="form-control" id="phoneNumber">
            </div>
            <div class="form-group">
                <label for="contactEmail" class="bmd-label-floating">Email</label>
                <input type="email" name="contactEmail" class="form-control" id="contactEmail">
            </div>
            <div class="form-group">
                <label for="companyId" class="bmd-label-floating">Company</label>
                <select class="form-control" id="companyId" name="companyId">
                    <%for (int k = 0; k < companyManager.getCompanies().length; k++) {%>
                    <option value="<%=companyManager.getCompany(k).companyId%>"><%=companyManager.getCompany(k).name%>
                    </option>
                    <% } %>
                </select>
            </div>
            <button class="btn btn-default">Cancel</button>
            <button type="submit" class="btn btn-primary btn-raised">Submit</button>
            <input type="hidden" name="status" value="insertContactPerson"/>
        </form>
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
});</script>