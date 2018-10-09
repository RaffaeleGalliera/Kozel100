<%@ page info="Pagina iniziale della WebApp" %>
<%@ page session="false" %> <!--App Stateless -->
<%@ page buffer="30kb" %>
<%@ page import="services.sessionservice.*" %>
<%@ page import="global.*" %>
<%@ page import="util.*" %>
<%--<%@ page errorPage="ErrorPage.jsp"%>--%>

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

                response.addCookie(loginManager.getCookies(i)); //Aggiungo i cookies alla response http e quindi al client

            }

            isLogged=true;
        }
    }

    if (status.equals("logout")){

        loginManager.setCookies(cookies); //Setto i cookie letti dalla chiamata http all'interno del bean
        loginManager.logout(); //Li elimino

        for (i=0;i<loginManager.getCookies().length;i++){

            response.addCookie(loginManager.getCookies(i)); //Li aggiorno nella response quindi sul client (Browser)
            isLogged=false;
            status="view";
        }

    }

    if (loginManager.getResult()==-2){
        message=loginManager.getErrorMessage();
    }

%>


<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">

    <title>Kozel100 CRM</title>
    <%if(isLogged){%>
        <meta http-equiv="refresh" content="0; url=Dashboard.jsp">
    <%}%>

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
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
    <div class="container">
        <h1>Pronto a loggarti baby? :D</h1>
        <form name="loginForm" action="index.jsp" method="post">
            <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <input type="hidden" name="status" value="login"/>
            <button type="submit" class="btn btn-default" onclick="login()">Submit</button>
        </form>
    </div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>