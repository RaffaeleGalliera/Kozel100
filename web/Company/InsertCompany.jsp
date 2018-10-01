<%@ page info="Inserimento nuova Compagnia" %>
<%@ page session="false" %>
<%@ page buffer="30kb" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>
<!doctype html>
<html lang="en">
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

    <title>Kozel100</title>
    <style>
        body {
            padding-top: 50px;
        }

        .spacer {
            margin-top: 2%;
            margin-bottom: 2%;
        }

        .block {
            min-height: 160px;
            padding-top: 15px;
        }

        .center {
            position: absolute;
            /*  top: 0;
              bottom: 0; */
            left: 0;
            right: 0;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container col-lg-12 spacer"> </div>
    <div class="container col-lg-12">
    <div class="col-sm-10 form-group-lg block center">
        <h1>New Company</h1>
        <form name="companyManager" action="" method="post">
            <div class="form-group">
                <label for="name" class="bmd-label-floating">Name</label>
                <input type="text" name="name" class="form-control" id="name">
                <span class="bmd-help">We'll never share your email with anyone else.</span>
            </div>
            <div class="form-group">
                <label for="vat" class="bmd-label-floating">VAT</label>
                <input type="text" name="vat" class="form-control" id="vat">
            </div>
            <div class="form-group">
                <label for="address" class="bmd-label-floating">Address</label>
                <input type="text" name="address" class="form-control" id="address">
            </div>
            <div class="form-group">
                <label for="city" class="bmd-label-floating">City</label>
                <input type="text" name="city" class="form-control" id="city">
            </div>
            <div class="form-group">
                <label for="companyEmail" class="bmd-label-floating">Email</label>
                <input type="email" name="companyEmail" class="form-control" id="companyEmail">
            </div>
            <div class="jumbotron">
                <h1>Contact Reference</h1>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="firstName" class="bmd-label-floating">First Name</label>
                        <input type="text" name="firstName" class="form-control" id="firstName">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="lastName" class="bmd-label-floating">Last Name</label>
                        <input type="text" name="lastName" class="form-control" id="lastName">
                    </div>
                </div>
                <div class="form-group">
                    <label for="phoneNumber" class="bmd-label-floating">Phone Number</label>
                    <input type="text" name="phoneNumber" class="form-control" id="phoneNumber">
                </div>
                <div class="form-group">
                    <label for="contactEmail" class="bmd-label-floating">Email</label>
                    <input type="email" name="contactEmail" class="form-control" id="contactEmail">
                </div>
            </div>
            <button class="btn btn-default">Cancel</button>
            <button type="submit" class="btn btn-primary btn-raised" onclick="insert(this.form)">Submit</button>
        </form>
    </div>
</div>
</body>
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
</html>
<%companyManager.insertCompany();%>

<script>

    function insert(form) {

        form.action = "InsertCompany.jsp";
        form.submit();
    }

</script>