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

    for(Cookie cookie : cookies){

        if(cookie.getName().equals("jwt_auth_token") && Session.isAdmin(cookie)){

            isAdmin = true;

        }

    }


%>

<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light" style="background-color: #27C46B;">
    <a class="navbar-brand" href="#">Kozel100</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <a class="nav-link active" href="/Dashboard.jsp">Dashboard <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="companyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Companies
                </a>
                <div class="dropdown-menu" aria-labelledby="companyDropdown">
                    <a class="dropdown-item" href="/Company/ViewCompanies.jsp">View</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/Company/InsertCompany.jsp">Insert Company</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/Company/InsertContactPerson.jsp">Insert Contact Person</a>
                </div>
            </li>
            <%if(isAdmin){%>
                <li class="nav-item">
                    <a class="nav-link" href="/Admin/AdminPanel.jsp">Admin Panel</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="setupDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Insert Setup
                    </a>
                    <div class="dropdown-menu" aria-labelledby="setupDropdown">
                        <a class="dropdown-item" href="/Admin/InsertUser.jsp">User</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/Admin/InsertClientType.jsp">Client Type</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/Admin/InsertPosition.jsp">Position</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/Admin/InsertWorkField.jsp">Work Field</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/Admin/InsertProductCategory.jsp">Product Category</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/Admin/InsertTag.jsp">Tag</a>
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

	function logout(){


		f.submit();

	}

</script>
