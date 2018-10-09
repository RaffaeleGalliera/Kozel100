<%@ page info="Pagina iniziale della WebApp" %>
<%@ page session="false" %> <!--App Stateless -->
<%@ page buffer="30kb" %>
<%@ page import="services.sessionservice.*" %>
<%@ page import="global.*" %>
<%@ page import="util.*" %>
<%--<%@ page errorPage="ErrorPage.jsp"%>--%>

<jsp:useBean id="signupManager" scope="page" class="bflows.SignupManager" />
<jsp:setProperty name="signupManager" property="*" />



<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>Hey there, wanna add some users? :D</title>
</head>
<body>


<div class="container">
    <h1>New User :)</h1>
    <form>
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" class="form-control" id="email" name="email">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="form-group">
            <label for="fName">First Name:</label>
            <input type="text" class="form-control" id="fName" name="firstName">
        </div>
        <div class="form-group">
            <label for="lName">Last Name:</label>
            <input type="text" class="form-control" id="lName" name="lastName">
        </div>
        <div class="form-group">
            <label for="position">Position:</label>
            <input type="text" class="form-control" id="position" name="positionId">
        </div>
        <div class="form-group">
            <label for="wField">Work Field:</label>
            <input type="text" class="form-control" id="wField" name="workFieldId">
        </div>
        <button type="submit" class="btn btn-default" onclick="insert(this.form)">Submit</button>
    </form>
</div>

<%signupManager.insertUser();%>

<script>


    function insert(form){


        form.action="NewUser.jsp";
        form.submit();
    }

</script>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>