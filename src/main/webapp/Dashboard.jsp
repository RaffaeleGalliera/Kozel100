<%--
  Created by IntelliJ IDEA.
  User: teo
  Date: 07/10/18
  Time: 15.33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="services.tokenservice.*" %>

<%

    Cookie[] cookies = request.getCookies();
    boolean authorized=false;

    //Ciclo di verifica --> se token non presente o non verificato setto a false authorized

    //TODO Is this the best way to verify a User?

    if(cookies!=null) {

        for (int i = 0; i < cookies.length; i++) {

            if (JWTService.parseAndVerifyJWT(cookies[i].getValue()) && cookies[i].getName().equals("jwt_auth_token")) {

                authorized = true;
                break;

            } else {

                authorized = false;

            }

        }
    }


%>

<style>

    .title-container{

        width: 60%;
        text-align: center;
        font-family: 'Shadows Into Light Two', cursive;
        margin: 0 auto;
        padding: 3%;

    }

    .footer-container{

        width: 60%;
        text-align: center;
        font-family: 'Shadows Into Light Two', cursive;
        margin: 0 auto;
        padding: 3%;

    }

</style>

<html>
<head>


    <%

        //If the user isn't providing a valid token i'll send him back to login page
        if(!authorized){

            String redirectURL = "/index.jsp";
            response.sendRedirect(redirectURL);

        }

    %>

    <title>Dashboard</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">

    <title>Kozel100 CRM</title>


</head>

<body>
<jsp:include page="/Common/Navbar.jsp"/>


<div class="container title-container">

    <h1>Dashboard ╭∩╮(-_-)╭∩╮</h1>

</div>

<div class="container footer-container">

    <h4>Authorized: <%=authorized%></h4>

</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>
