<%@ page info="Pagina iniziale della WebApp" %>
<%@ page session="false" %> <!--App Stateless -->
<%@ page buffer="30kb" %>
<%@ page import="services.sessionservice.*" %>
<%@ page import="global.*" %>
<%@ page import="util.*" %>
<%@ page import="services.errorservice.EService" %>
<%@ page errorPage="ErrorPage.jsp"%>

<jsp:useBean id="loginManager" scope="page" class="bflows.LoginManager" />
<jsp:setProperty name="loginManager" property="*" />

<%

    //Leggo i cookies dalla request
    Cookie[] cookies=request.getCookies();

    //Leggo il parametro status
    String status=request.getParameter("status");
    String message=null;
    int i;
    boolean isLogged=false;

    if (status==null) status="view"; //Stato che si preconfigura alla prima chiamata alla pagina, quando il parametro status della request non e' settato

    if (status.equals("login")){

        loginManager.login(); //Effettua il login, crea i cookies e li memorizza nel bean

        if(loginManager.getCookies()!=null){

            cookies=loginManager.getCookies(); //Mi copio localmente i cookies, di norma si leggono dalla request ma alla prima chiamata non li ho disponibili quindi li prendo dal bean

            for(i=0;i<loginManager.getCookies().length;i++){

                if(loginManager.getCookies(i)!=null) {
                    response.addCookie(loginManager.getCookies(i)); //Aggiungo i cookies alla response http e quindi al client
                }
            }

            isLogged=true;
        }
    }

    if(loginManager.getResult()==EService.RECOVERABLE_ERROR){

        message = loginManager.getErrorMessage();

    }

    if (status.equals("logout") && cookies!=null){

        loginManager.setCookies(cookies); //Setto i cookie letti dalla chiamata http all'interno del bean
        loginManager.logout(); //Li elimino

        for (i=0;i<loginManager.getCookies().length;i++){

            response.addCookie(loginManager.getCookies(i)); //Li aggiorno nella response quindi sul client (Browser)
            isLogged=false;
            status="view";
        }

    }else{

        status="view";

    }

    if (loginManager.getResult()==-2){
        message=loginManager.getErrorMessage();
    }

    //If login successful, sends the user to his dashboard
    if(isLogged){

        String redirectURL = "Dashboard.jsp";
        response.sendRedirect(redirectURL);

    }


%>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="resources/logoS.png">
    <link rel="icon" type="image/png" href="resources/logoS.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Kozel100 CRM
    </title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700|Material+Icons">

    <style>

        img {
            display: block;
            max-width: 30%;
            height: auto;
            margin: 0 auto;
        }

        .error{

            width: 60%;
            text-align: center;
            color: crimson;
            font-family: 'Shadows Into Light Two', cursive;
            margin: 0 auto;
            padding-top: 1%;


        }

        .form-container{

            background-color: white;
            box-shadow: -1px 18px 26px 1px rgba(173,168,173,1);
            border-radius: 4px;
            margin-left: 35%;
            margin-right: 35%;
            padding-right: 3%;
            padding-left: 3%;
            padding-bottom: 1%;
            padding-top: 1%;


        }

        .title-container{

            width: 60%;
            text-align: center;
            font-family: 'Shadows Into Light Two', cursive;
            margin: 0 auto;
            padding: 1%;

        }

        .footer-container{

            width: 60%;
            text-align: center;
            font-family: 'Shadows Into Light Two', cursive;
            margin: 0 auto;
            padding: 3%;

        }

    </style>


    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">

    <script language="javascript">

        function isEmpty(value) {

            if (value === null || value.length === 0)
                return true;

            for (var count = 0; count < value.length; count++) {
                if (value.charAt(count) !== " ") return false;
            }
            return true;
        }

        function login(){

            f=document.loginForm;

            //Mail
            if (isEmpty(f.email.value)) {
                f.email.style.boxShadow= "0px 0px 3px 1px #FF0000";
                f.email.style.border="0px solid red";

                return;
            }
            else{
                f.email.style.boxShadow="";
                f.email.style.border="";
            }

            f.submit();

        }

    </script>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light+Two" rel="stylesheet">

    <title>Kozel100 CRM</title>

</head>
<body>

    <div class="container title-container">

        <img src="resources/logo.png" class="img-responsive">

    </div>

    <div class="form-container">
        <form name="loginForm" action="index.jsp" method="post">
            <div class="form-group">
                <label for="email" class="bmd-label-floating">Email</label>
                <input type="email" class="form-control" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="password" class="bmd-label-floating">Password:</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <input type="hidden" name="status" value="login"/>
            <button type="submit" class="btn btn-outline-success  btn-block" onclick="login()">Login</button>
        </form>

    </div>

    <%if (message!=null){%>
    <div class="error" role="alert">
        <%=message%>
    </div>
    <%}%>


    <div class="container footer-container">

        <h4>Made with <font color=#83b441>&hearts;</font> by Rafu and Teu</h4>

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