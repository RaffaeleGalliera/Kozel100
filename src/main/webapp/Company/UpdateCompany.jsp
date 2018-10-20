<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 18/10/18
  Time: 11.09
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

    if (status.equals("view")){
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">

    <title>Kozel100</title>

</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<script>

    function insert(form) {

        form.action = "UpdateCompany.jsp";
        form.submit();
    }

</script>
<div class="container col-lg-12">
    <%if (complete){%>
    <div class="jumbotron">
        <h2>Company successfully updated!</h2>
    </div>
    <%}%>
    <div class="col-sm-10 form-group-lg block center">
        <h1 class="text-center">
            <%=companyManager.getCompany().name%>
        </h1>
        <form action="ViewCompanies.jsp">
            <button style="float:right" type="submit" value="InsertCompany" class="btn btn-default">
                Back To List
            </button>

            </h1>
        </form>
        <form name="companyManager" action="" method="post">
            <div class="form-group">
                <label for="name" class="bmd-label-floating">Name</label>
                <%if(message==null) {%>
                <input type="text" name="name" class="form-control" id="name" value="<%=companyManager.getCompany().name%>">
                <%}%>
                <%if(message!=null) {%>
                <input type="text" name="name" class="form-control is-invalid" id="name" value="<%=companyManager.getCompany().name%>">
                <div class="invalid-feedback">
                    <%=message%>
                </div>
                <%}%>
            </div>
            <div class="form-group">
                <label for="vat" class="bmd-label-floating">VAT</label>
                <input type="text" name="vat" class="form-control" id="vat" value="<%=companyManager.getCompany().vat%>">
            </div>
            <div class="form-group">
                <label for="address" class="bmd-label-floating">Address</label>
                <input type="text" name="address" class="form-control" id="address" value="<%=companyManager.getCompany().address%>">
            </div>
            <div class="form-group">
                <label for="city" class="bmd-label-floating">City</label>
                <input type="text" name="city" class="form-control" id="city" value="<%=companyManager.getCompany().city%>">
            </div>
            <div class="form-group">
                <label for="companyEmail" class="bmd-label-floating">Email</label>
                <input type="email" name="companyEmail" class="form-control" id="companyEmail" value="<%=companyManager.getCompany().email%>">
            </div>
            <div class="form-group">
                <label for="clientTypeId" class="bmd-label-floating">Client Type</label>
                <select class="form-control" id="clientTypeId" name="clientTypeId">
                    <%for (int k = 0; k < companyManager.getClientTypes().length; k++) {%>
                    <%if (companyManager.getClientType(k).clientTypeId==companyManager.getClientType().clientTypeId) {%>
                    <option value="<%=companyManager.getClientType(k).clientTypeId%>" selected>
                        <%=companyManager.getClientType(k).name%>
                    </option>
                    <% } %>
                    <%if (companyManager.getClientType(k).clientTypeId!=companyManager.getClientTypeId()) {%>
                    <option value="<%=companyManager.getClientType(k).clientTypeId%>">
                        <%=companyManager.getClientType(k).name%>
                    </option>
                    <% } %>
                    <% } %>
                </select>
            </div>
            <button class="btn btn-default">Cancel</button>
            <button type="submit" class="btn btn-primary btn-raised" onclick="insert(this.form)">Submit</button>
            <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
            <input type="hidden" name="status" value="updateCompany"/>
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
</body>
</html>
