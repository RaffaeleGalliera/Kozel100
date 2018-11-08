<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="services.sessionservice.Session" %>
<%@ page import="util.Debug" %>
<%@ page buffer="30kb" %>

<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 10/8/18
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    Cookie[] cookies = request.getCookies();
    Boolean isAdmin = false;

    for (Cookie cookie : cookies) {

        if (cookie.getName().equals("jwt_auth_token") && Session.isAdmin(cookie)) {

            isAdmin = true;

        }

    }


%>

<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light" style="font-family: 'Montserrat', sans-serif; font-size: xx-large">
    <a class="navbar-brand" href="/Dashboard.jsp">
        <img src="../resources/logoSmall.png" width="101" height="50" class="d-inline-block align-top" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="companyDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Companies
                </a>
                <div class="dropdown-menu" aria-labelledby="companyDropdown">
                    <a class="dropdown-item" href="/Company/ViewCompanies.jsp">View</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/Company/InsertContactPerson.jsp">Insert Contact Person</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../Agenda.jsp">Agenda</a>
            </li>
            <%if (isAdmin) {%>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button"
                                             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Admin
            </a>
                <div class="dropdown-menu" aria-labelledby="adminDropdown">
                    <a class="dropdown-item" href="/Admin/AdminPanel.jsp">Panel</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/Admin/Audit.jsp">Audit Logging</a>
                </div>
            </li>
            <%}%>
        </ul>
        <%--<form class="form-inline my-2 my-lg-0">--%>
        <%--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
        <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
        <%--</form>--%>
        <form class="form-inline my-2 my-lg-0" action="/index.jsp" method="post">
            <input type="hidden" name="status" value="logout"/>
            <button class="btn btn-outline-danger my-2 my-sm-0" onclick="logout()">Logout</button>
        </form>
    </div>
</nav>
<div class="container col-lg-12 spacer"></div>

<script language="javascript">

    function logout() {


        f.submit();

    }

</script>
