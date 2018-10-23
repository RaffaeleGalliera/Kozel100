<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 10/19/18
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="services.sessionservice.Session" %>
<%@ page import="util.Debug" %>
<%@ page buffer="30kb" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>
<%

    String status = null;
    String message = null;
    int userId = 0;
    boolean complete = false;
    Cookie[] cookies = request.getCookies();
    status = request.getParameter("status");
    companyManager.setCompanyId(Integer.parseInt(request.getParameter("companyId")));

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("jwt_auth_token") && Session.isAuthorized(cookie)) {

                userId = Session.getUserID(cookie);

            }
        }
    }

    if (status.equals("view")) {
        companyManager.companyView();
    }

    if (status.equals(("addTag"))){
        companyManager.addTag();
    }

    if (status.equals(("addConversation"))){
        companyManager.addConversation();
    }

    if (status.equals("deleteTag")) {
        companyManager.deleteTag(Integer.parseInt(request.getParameter("tagId")));
    }
%>
<!doctype html>
<html>
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
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <%--<link rel="stylesheet" type="text/css" href="/css/admin_panel.css">--%>

    <title>Kozel100 CRM</title>
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<script language="JavaScript">
    function addTag(form) {
        form.action = "ViewCompany.jsp";
        form.submit();
    }

    function addConversation(form) {
        form.action = "ViewCompany.jsp";
        form.submit();
    }

    function deleteTag(id, name) {

        r = confirm("Are you sure to delete : " + name + " as  Tag");

        if (r === true) {
            document.deleteTagForm.tagId.value = id;

            document.deleteTagForm.submit();
        }
        else {
            return;
        }

    }
</script>
<div class="container">
    <div class="page-header">
        <div class="jumbotron">
            <div class="row">
                <div class="col">
                    <h1 class="display-4"><%=companyManager.getCompany().name%></h1>
                </div>
                <div class="col"><p class="lead"><button  type="button" class="btn btn-outline-secondary"  data-toggle="modal" data-target="#addTag">Tag</button>
                    <%for (int c = 0; c < companyManager.getCompanyTags().length; c++) {%>
                    <% if (c>0) {%>
                    ,
                    <% } %>
                    <%=companyManager.getCompanyTag(c).name%>
                    <%}%>
                </p></div>
            </div>
            <div class="row">
                <div class="col">
                    <button  type="button" class="btn btn-outline-secondary"  data-toggle="modal" data-target="#addConversation">Add Conversation</button>
                </div>
                <div class="col"><p class="lead"><button  type="button" class="btn btn-outline-secondary"  data-toggle="modal" data-target="#addTag">Tag</button>
                </div>
            </div>
            <hr class="my-4">
            <div class="row">
                <div class="col"><p class="lead">Contact References:<%for (int c = 0; c < companyManager.getContactPeople().length; c++) {%>
                    <br>
                    <%=companyManager.getContactPerson(c).fullName()%>
                    <%}%>
                </p></div>
                <div class="col"><p class="lead">Responsible User:  <%=companyManager.getUser().fullName()%></p></div>
            </div>
            <hr class="my-4">
            <div class="row">
                <div class="col"><p class="lead">Customer Type: <%=companyManager.getClientType().name%></p></div>
                <div class="col"><p class="lead">Product Category: <%=companyManager.getProductCategory().name%></p></div>
            </div>
            <hr class="my-4">
            <div class="row">
                <div class="col"><p class="lead">Address: <%=companyManager.getCompany().address%></p></div>
                <div class="col"><p class="lead">City: <%=companyManager.getCompany().city%></p></div>
            </div>
            <hr class="my-4">
            <p class="lead">VAT: <%=companyManager.getCompany().vat%></p>
            <hr class="my-4">
            <p class="lead">
                <div class="row">
                    <div class="col"><p class="lead"><a class="btn btn-success btn-lg" href="#" role="button">Edit</a></p></div>
                    <div class="col"><p class="lead"><a class="btn btn-danger btn-lg" href="#" role="button">Delete</a></p></div>
                </div>
            </p>
        </div>
    </div>
    <p>
    <ul class="nav nav-tabs">
        <li class="nav-item"><a class="nav-link" href="#tagCard" data-toggle="collapse"
                                data-target="#tagCard"
                                aria-expanded="false" aria-controls="tagCard">Tags</a></li>
        <li class="nav-item"><a class="nav-link" href="#clientNotesCard" data-toggle="collapse"
                                data-target="#clientNotesCard"
                                aria-expanded="false" aria-controls="clientNotesCard">Customer Notes</a></li>
        <%--<li class="nav-item"><a class="nav-link" data-toggle="collapse" data-target=".multi-collapse"--%>
        <%--aria-expanded="false"--%>
        <%--aria-controls="clientNotesCard positionCard productCategoriesCard clientTypesCard">Show--%>
        <%--All</a></li>--%>
    </ul>
    </p>

    <div class="row">
        <div class="col">
            <div class="collapse multi-collapse" id="tagCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                        <h2>Tags
                                                <button style="float: right" type="button" class="btn btn-outline-secondary"  data-toggle="modal" data-target="#addTag">Add Tag</button>
                                        </h2>
                                </div>
                            </div>

                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tag</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for (int k = 0; k < companyManager.getCompanyTags().length; k++) {%>
                                <tr>
                                    <td><%= k + 1 %>
                                    </td>
                                    <td><%=companyManager.getCompanyTag(k).name%></td>
                                    <td>
                                        <a class="delete" title="Delete" data-toggle="tooltip"
                                           href="JavaScript:deleteTag('<%=companyManager.getCompanyTag(k).tagId%>','<%=companyManager.getCompanyTag(k).name%>');"><i
                                                class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                            <form name="deleteTagForm" action="ViewCompany.jsp" method="post">
                                <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
                                <input type="hidden" name="tagId" value=""/>
                                <input type="hidden" name="status" value="deleteTag"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse multi-collapse" id="clientNotesCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="Setup/InsertWorkField.jsp">
                                        <h2>Work Fields
                                            <button style="float:right" type="submit" value="InsertWorkField"
                                                    class="btn btn-default">
                                                +
                                            </button>
                                        </h2>
                                    </form>
                                </div>
                            </div>

                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--<%for (int k = 0; k < adminPanelManager.getWorkFields().length; k++) {%>--%>
                                <%--<tr>--%>
                                    <%--<td><%= k + 1 %>--%>
                                    <%--</td>--%>
                                    <%--<td><%=adminPanelManager.getWorkField(k).name%>--%>
                                    <%--</td>--%>
                                    <%--<td>--%>
                                        <%--<a class="edit" title="Edit" data-toggle="tooltip"><i--%>
                                                <%--class="material-icons">&#xE254;</i></a>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                                <%--<%}%>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
    <input type="hidden" name="status" value="view"/>

    <!-- Tag Modal -->
    <div class="modal fade" id="addTag" tabindex="-1" role="dialog" aria-labelledby="addTagLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addTagLabel">Add Tag</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="companyManager" action="" method="post">
                    <div class="form-group">
                        <label for="tagId" class="bmd-label-floating">Tags</label>
                        <select class="form-control" id="tagId" name="tagId">
                            <%for (int k = 0; k < companyManager.getTags().length; k++) {%>
                            <option value="<%=companyManager.getTag(k).tagId%>">
                                <%=companyManager.getTag(k).name%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                        <div class="modal-footer">
                            <button class="btn btn-default">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-raised" onclick="addTag(this.form)">
                                Submit
                            </button>
                            <input type="hidden" name="status" value="addTag"/>
                            <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--Conversation Modal -->
    <div class="modal fade" id="addConversation" tabindex="-1" role="dialog" aria-labelledby="addConversationLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addConversationLabel">Add Conversation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="companyManager" action="" method="post">
                        <div class="form-group">
                            <label for="reason" class="bmd-label-floating">Reason</label>
                            <input type="text" name="reason" class="form-control" id="reason">
                        </div>
                        <div class="form-group">
                            <label for="conversationDate" class="bmd-label-floating">Date</label>
                            <input type="date" name="conversationDate" class="form-control" id="conversationDate">
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-default">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-raised" onclick="addConversation(this.form)">
                                Submit
                            </button>
                            <input type="hidden" name="status" value="addConversation"/>
                            <input type="hidden" name="companyId" id = "companyId" value="<%=companyManager.getCompany().companyId%>"/>
                            <input type="hidden" name="userId" id="userId" value="<%= userId %>"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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