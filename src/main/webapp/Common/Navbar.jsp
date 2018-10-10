<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 10/8/18
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light" style="background-color: #27C46B;">
    <a class="navbar-brand" href="#">Kozel100</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/Dashboard.jsp">Dashboard <span class="sr-only">(current)</span></a>
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
            <li class="nav-item">
                <a class="nav-link" href="/AdminPanel.jsp">Admin Panel</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="setupDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Insert Setup
                </a>
                <div class="dropdown-menu" aria-labelledby="setupDropdown">
                    <a class="dropdown-item" href="/Setup/InsertUser.jsp">User</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/Setup/InsertClientType.jsp">Client Type</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/Setup/InsertPosition.jsp">Position</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/Setup/InsertWorkField.jsp">Work Field</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/Setup/InsertProductCategory.jsp">Product Category</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
        </ul>
        <%--<form class="form-inline my-2 my-lg-0">--%>
            <%--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
            <%--<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
        <%--</form>--%>
        <form class="form-inline my-2 my-lg-0">
            <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
        </form>
    </div>
</nav>
<div class="container col-lg-12 spacer"></div>

