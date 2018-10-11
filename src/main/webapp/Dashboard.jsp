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

    for(int i=0;i<cookies.length;i++){

        if(JWTService.parseAndVerifyJWT(cookies[i].getValue()) && cookies[i].getName().equals("jwt_auth_token")) {

            authorized = true;
            break;

        }else{

            authorized=false;

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

            String redirectURL = "index.jsp";
            response.sendRedirect(redirectURL);

        }

    %>

    <title>Dashboard</title>
</head>

<body>

<div class="container title-container">

    <h1>Dashboard ╭∩╮(-_-)╭∩╮</h1>

</div>

<div class="container footer-container">

    <h4>Authorized: <%=authorized%></h4>

</div>





</body>
</html>
