<%@ page import="blogics.ConsultingService" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 10/19/18
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="services.tokenservice.JWTService" %>
<%@ page import="services.sessionservice.Session" %>
<%@ page import="util.Debug" %>
<%@ page import="blogics.Tag" %>
<%@ page buffer="30kb" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>
<%

    String status = null;
    String message = null;
    int userId = 0;
    boolean isAdmin = false;
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
    for (Cookie cookie : cookies) {

        if (cookie.getName().equals("jwt_auth_token") && Session.isAdmin(cookie)) {

            isAdmin = true;

        }

    }

    if (status.equals("view")) {
        companyManager.companyView();
    }

    if (status.equals(("addTag"))) {
        companyManager.addTag();
    }

    if (status.equals(("addConversation"))) {
        companyManager.addConversation();
    }

    if (status.equals(("addConversationNote"))) {
        companyManager.addConversationNote();
    }

    if (status.equals(("addAppointment"))) {
        companyManager.addAppointment();
    }

    if (status.equals("deleteTag")) {
        companyManager.deleteTag(Integer.parseInt(request.getParameter("tagId")));
    }

    if (status.equals("deleteNote")) {
        companyManager.deleteCompanyNote(Integer.parseInt(request.getParameter("companyNoteId")));
    }

%>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500|Material+Icons" rel="stylesheet">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" href="https://storage.googleapis.com/non-spec-apps/mio-icons/latest/twotone.css">
    <%--<link rel="stylesheet" type="text/css" href="/css/admin_panel.css">--%>

    <%--Bootstrap multiselect css--%>
    <link rel="stylesheet" href="../css/bootstrap-multiselect.css" type="text/css">

    <title>Kozel100 CRM</title>
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
<script language="JavaScript">

    function deleteNote(id) {

        r = confirm("Are you sure to delete this Note?");

        if (r === true) {
            document.deleteNoteForm.companyNoteId.value = id;

            document.deleteNoteForm.submit();
        }
        else {
            return;
        }

    }

    function updateNote(id) {
        document.updateNoteForm.companyNoteId.value = id;
        document.updateNoteForm.submit();
    }

    function addTag(form) {
        form.action = "ViewCompany.jsp";
        form.submit();
    }

    function addConversation(form) {
        form.action = "ViewCompany.jsp";
        form.submit();
    }

    function addConversationNote(form) {
        form.action = "ViewCompany.jsp";
        form.submit();
    }

    function addAppointment(form) {
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
        <h1 class="text-center display-2"><%=companyManager.getCompany().name%>
        </h1>
        <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#overview" role="tab"
                   aria-controls="overview" aria-selected="true">Overview</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="appointments-tab" data-toggle="tab" href="#appointments" role="tab"
                   aria-controls="appointments" aria-selected="false">Appointments</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="notes-tab" data-toggle="tab" href="#notes" role="tab" aria-controls="notes"
                   aria-selected="false">Notes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="conversations-tab" data-toggle="tab" href="#conversations" role="tab"
                   aria-controls="conversations" aria-selected="false">Conversations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="consultingServices-tab" data-toggle="tab" href="#consultingServices" role="tab"
                   aria-controls="consultingServices" aria-selected="false">Consulting Services</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="commercialProposals-tab" data-toggle="tab" href="#commercialProposals"
                   role="tab"
                   aria-controls="commercialProposals" aria-selected="false">Commercial Proposals</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="tags-tab" data-toggle="tab" href="#tags" role="tab"
                   aria-controls="tags" aria-selected="false">Tags</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                <div class="jumbotron">
                    <div class="row">
                        <div class="col">
                            <h1 class="text-center display-3">Overview</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <button style="width: 33%" type="button" class="btn btn-outline-secondary"
                                    data-toggle="modal"
                                    data-target="#addConversation">Add Conversation
                            </button>
                            <button style="width: 33%" type="button" class="btn btn-outline-secondary"
                                    data-toggle="modal"
                                    data-target="#addNote">
                                Add Note
                            </button>
                            <button style="width: 33%" type="button" class="btn btn-outline-secondary"
                                    data-toggle="modal"
                                    data-target="#addAppointment">
                                Add Appointment
                            </button>
                        </div>
                    </div>
                    <hr class="my-4">
                    <div class="row">
                        <div class="col"><p class="lead">Contact
                            References:<%for (int c = 0; c < companyManager.getContactPeople().length; c++) {%>
                            <br>
                            <%=companyManager.getContactPerson(c).fullName()%>
                            <%}%>
                        </p></div>
                        <div class="col"><p class="lead">Responsible User:  <%=companyManager.getUser().fullName()%>
                        </p></div>
                    </div>
                    <hr class="my-4">
                    <div class="row">
                        <div class="col"><p class="lead">Customer Type: <%=companyManager.getClientType().name%>
                        </p></div>
                        <div class="col"><p class="lead">Product Category: <%=companyManager.getProductCategory().name%>
                        </p></div>
                    </div>
                    <hr class="my-4">
                    <div class="row">
                        <div class="col"><p class="lead">Address: <%=companyManager.getCompany().address%>
                        </p></div>
                        <div class="col"><p class="lead">City: <%=companyManager.getCompany().city%>
                        </p></div>
                    </div>
                    <hr class="my-4">
                    <div class="row">
                        <div class="col"><p class="lead">VAT: <%=companyManager.getCompany().vat%>
                        </p>
                        </div>
                        <div class="col">
                            <p class="lead">
                                <button type="button" class="btn btn-outline-secondary" data-toggle="modal"
                                        data-target="#addTag">Tag
                                </button>
                                <% int nTag = companyManager.getCompanyTags().map(t -> t.length).orElse(0);
                                    for (int c = 0; c < nTag; c++) {%>
                                <% if (c > 0) {%>
                                ,
                                <% } %>
                                <%=companyManager.getCompanyTag(c).name%>
                                <%}%>
                                <% if (nTag == 0) {%>
                                Nessun Tag Assegnato
                                <%}%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="appointments" role="tabpanel" aria-labelledby="appointments-tab">
                <%--Appointments Tab--%>
                <div class="table-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2>Appointments
                                <a style="float: right" class="add" title="Edit" data-toggle="modal"
                                   data-target="#addAppointment"><i
                                        class="material-icons md-48">add_box</i>
                                </a>
                            </h2>
                        </div>
                    </div>
                    <% int nAppointments = companyManager.getCompanyAppointments().map(t -> t.length).orElse(0);
                        if (nAppointments == 0) {%>
                    <div class="jumbotron">
                        <h1 class="display-4"> There is no Appointment Yet</h1>
                    </div>
                    <%} else {%>
                    <table class="col-md-12 table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Note</th>
                            <%--<th>User</th>--%>
                            <th>Date</th>
                            <th>At</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < nAppointments; k++) {%>
                        <tr>
                            <td><%= k + 1 %>
                            </td>
                            <td><%=companyManager.getCompanyAppointment(k).note%>
                            </td>
                            <%--<td><%=companyManager.getConversationUserName(companyManager.getCompanyNote(k).userId)%></td>--%>
                            <td><%=companyManager.getCompanyAppointment(k).date%>
                            </td>
                            <td><%=companyManager.getCompanyAppointment(k).time%>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <%}%>
                </div>
            </div>

            <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
            <input type="hidden" name="status" value="view"/>

            <div class="tab-pane fade" id="conversations" role="tabpanel" aria-labelledby="conversations-tab">
                <%--Conversations Tab--%>
                <div class="table-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2>Conversations
                                <a style="float: right" class="add" title="Edit" data-toggle="modal"
                                   data-target="#addConversation"><i
                                        class="material-icons md-48">add_box</i>
                                </a>
                            </h2>

                        </div>
                    </div>
                    <% int nConversation = companyManager.getConversations().map(t -> t.length).orElse(0);
                        if (nConversation == 0) {%>
                    <div class="jumbotron">
                        <h1 class="display-4"> There is no Conversation Yet</h1>
                    </div>
                    <%} else {%>
                    <table class="col-md-12 table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Reason</th>
                            <th>Date</th>
                            <th>User</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < nConversation; k++) {%>
                        <tr>
                            <td><%= k + 1 %>
                            </td>
                            <td><%=companyManager.getConversation(k).reason%>
                            </td>
                            <td><%=companyManager.getConversation(k).date%>
                            </td>
                            <td><%=companyManager.getConversationUserName(companyManager.getConversation(k).userId)%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <%}%>
                </div>
            </div>
            <div class="tab-pane fade" id="notes" role="tabpanel" aria-labelledby="notes-tab">
                <%--Customer Notes Tab--%>
                <div class="table-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2>Customer Notes
                                <a style="float: right" class="add" title="Edit" data-toggle="modal"
                                   data-target="#addNote"><i
                                        class="material-icons md-48">add_box</i>
                                </a>
                            </h2>
                        </div>
                    </div>
                    <% int nNote = companyManager.getCompanyNotes().map(t -> t.length).orElse(0);
                        if (nNote == 0) {%>
                    <div class="jumbotron">
                        <h1 class="display-4"> There is no Note Yet</h1>
                    </div>
                    <%} else {%>
                    <table class="col-md-12 table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Note</th>
                            <th>Author</th>
                            <th>Conversation Referred</th>
                            <th>Posted at</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < nNote; k++) {%>
                        <tr>
                            <td><%= k + 1 %>
                            </td>
                            <td><%=companyManager.getCompanyNote(k).title%>
                            </td>
                            <td><%=companyManager.getCompanyNote(k).note%>
                            </td>
                            <td><%=companyManager.getConversationUserName(companyManager.getCompanyNote(k).userId)%>
                            </td>
                            <td><%=companyManager.getCompanyNoteConversation(companyManager.getCompanyNote(k).conversationId)%>
                            </td>
                            <td><%=companyManager.getCompanyNote(k).timestamp%>
                            </td>
                            <%if ((isAdmin) && (userId == companyManager.getCompanyNote(k).userId)) {%>
                            <td><a class="edit" title="Edit" data-toggle="tooltip"
                                   href="JavaScript: updateNote('<%=companyManager.getCompanyNote(k).conversationNoteId%>');"><i
                                    class="material-icons">&#xE254;</i>
                            </a>
                                <a class="delete" title="Delete" data-toggle="tooltip"
                                   href="JavaScript:deleteNote('<%=companyManager.getCompanyNote(k).conversationNoteId%>');"><i
                                        class="material-icons">&#xE872;</i>
                                </a>
                            </td>
                            <%} else {%>
                            <a class="highlight_off" title="noPermission" data-toggle="tooltip"><i
                                    class="material-icons">highlight_off</i>
                            </a>
                            <%}%>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <%}%>
                    <form name="deleteNoteForm" action="ViewCompany.jsp" method="post">
                        <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
                        <input type="hidden" name="companyNoteId" value=""/>
                        <input type="hidden" name="status" value="deleteNote"/>
                    </form>
                    <form name="updateNoteForm" action="ViewCompany.jsp" method="post">
                        <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
                        <input type="hidden" name="companyNoteId" value=""/>
                        <input type="hidden" name="status" value="updateNote"/>
                    </form>
                </div>
            </div>
            <div class="tab-pane fade" id="consultingServices" role="tabpanel" aria-labelledby="consultingServices-tab">
                <%--Consulting Services Tab--%>
                <div class="table-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="">
                                <h2>Consulting Services
                                    <a style="float: right" class="add" title="Edit" data-toggle="modal"
                                       data-target="#addAppointment"><i
                                            class="material-icons md-48">add_box</i>
                                    </a>
                                </h2>
                            </form>
                        </div>
                    </div>
                    <% int nService = companyManager.getConsultingServices().map(t -> t.length).orElse(0);
                        if (nService == 0) {%>
                    <div class="jumbotron">
                        <h1 class="display-4"> There is no Consulting Service Yet</h1>
                    </div>
                    <%} else {%>
                    <table class="col-md-12 table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < nService; k++) {%>
                        <tr>
                            <td><%= k + 1 %>
                            </td>
                            <td><%=companyManager.getConsultingService(k).name%>
                            </td>
                            <td>
                                <a class="edit" title="Edit" data-toggle="tooltip"><i
                                        class="material-icons">&#xE254;</i></a>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <%}%>
                </div>
            </div>
            <div class="tab-pane fade" id="commercialProposals" role="tabpanel"
                 aria-labelledby="commercialProposals-tab">
                <%--Commercial Proposal Tab--%>
                <div class="table-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="">
                                <h2>Commercial Proposals
                                    <a style="float: right" class="add" title="Edit" data-toggle="modal"
                                       data-target="#addAppointment"><i
                                            class="material-icons md-48">add_box</i>
                                    </a>
                                </h2>
                            </form>
                        </div>
                    </div>
                    <% int nProposal = companyManager.getCommercialProposals().map(t -> t.length).orElse(0);
                        if (nProposal == 0) {%>
                    <div class="jumbotron">
                        <h1 class="display-4"> There is no Commercial Proposal Yet</h1>
                    </div>
                    <%} else {%>
                    <table class="col-md-12 table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Services</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < nProposal; k++) {%>
                        <tr>
                            <td><%= k + 1 %>
                            </td>
                            <td><%=companyManager.getCommercialProposal(k).name%>
                            </td>
                            <td><%=companyManager.getCommercialProposal(k).description%>
                            </td>
                            <%
                                int nProposed = companyManager.getConsultingServicesProposedTo(companyManager.getCommercialProposal(k).commercial_proposal_id).map(p -> p.size()).orElse(0);
                                if (nProposed == 0) {
                            %>
                            None
                            <%} else {%>
                            <%ArrayList<ConsultingService> services = companyManager.getConsultingServicesProposedTo(companyManager.getCommercialProposal(k).commercial_proposal_id).get();%>
                            <td>
                                <%for (ConsultingService s : services) {%>
                                <%=s.name%>
                                <%}%>
                            </td>
                            <td>
                                <a class="edit" title="Edit" data-toggle="tooltip"><i
                                        class="material-icons">&#xE254;</i></a>
                            </td>
                            <%}%>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <%}%>
                </div>
            </div>
            <div class="tab-pane fade" id="tags" role="tabpanel" aria-labelledby="tags-tab">
                <%--TAG TAB--%>
                <div class="container">
                    <div class="table-wrapper">
                        <div class="row">
                            <div class="col-sm-12">
                                <h2>Tags
                                    <a style="float: right" class="add" title="Edit" data-toggle="modal"
                                       data-target="#addTag"><i
                                            class="material-icons md-48">add_box</i>
                                    </a>
                                </h2>
                            </div>
                        </div>
                        <% if (nTag == 0) {%>
                        <div class="jumbotron">
                            <h1 class="display-4"> There is no Tag Yet</h1>
                        </div>
                        <%} else {%>
                        <table class="col-md-12 table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Tag</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (int k = 0; k < nTag; k++) {%>
                            <tr>
                                <td><%= k + 1 %>
                                </td>
                                <td><%=companyManager.getCompanyTag(k).name%>
                                </td>
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
                            <input type="hidden" name="companyId"
                                   value="<%=companyManager.getCompany().companyId%>"/>
                            <input type="hidden" name="tagId" value=""/>
                            <input type="hidden" name="status" value="deleteTag"/>
                        </form>
                        <%}%>
                    </div>
                </div>
            </div>
            <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
            <input type="hidden" name="status" value="view"/>
        </div>
    </div>
</div>


<!-- Tag Modal -->
<div class="modal fade" id="addTag" tabindex="-1" role="dialog" aria-labelledby="addTagLabel"
     aria-hidden="true">
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
                        <label for="tagIds" class="bmd-label-floating">Tags</label>
                        <select class="form-control" multiple="multiple" id="tagIds" name="tagIds">
                            <%for (int k = 0; k < companyManager.getTags().length; k++) {%>
                            <option value="<%=companyManager.getTag(k).tagId%>">
                                <%=companyManager.getTag(k).name%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised"
                                onclick="addTag(this.form)">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="addTag"/>
                        <input type="hidden" name="cTag" value="addTag"/>
                        <input type="hidden" name="companyId"
                               value="<%=companyManager.getCompany().companyId%>"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Conversation Modal -->
<div class="modal fade" id="addConversation" tabindex="-1" role="dialog"
     aria-labelledby="addConversationLabel"
     aria-hidden="true">
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
                        <input type="date" name="conversationDate" class="form-control"
                               id="conversationDate">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised"
                                onclick="addConversation(this.form)">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="addConversation"/>
                        <input type="hidden" name="companyId" id="companyId"
                               value="<%=companyManager.getCompany().companyId%>"/>
                        <input type="hidden" name="conversationUserId" id="conversationUserId"
                               value="<%= userId %>"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Note Modal -->
<div class="modal fade" id="addNote" tabindex="-1" role="dialog" aria-labelledby="addNoteLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addNoteLabel">Add Note</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%if (nConversation == 0) {%>
                <div class="jumbotron">
                    <h1 class="display-4"> There is no Conversation Yet</h1>
                </div>
                <%} else {%>
                <form name="companyManager" action="" method="post">
                    <label for="conversationId" class="bmd-label-floating">Conversation</label>
                    <select class="form-control" id="conversationId" name="conversationId">
                        <%for (int k = 0; k < nConversation; k++) {%>
                        <option value="<%=companyManager.getConversation(k).conversationId%>">
                            <%=companyManager.getConversation(k).date%>
                            : <%=companyManager.getConversation(k).reason%>
                            : <%=companyManager.getConversationUserName(companyManager.getConversation(k).userId)%>
                        </option>
                        <% } %>
                    </select>
                    <div class="form-group">
                        <label for="Title" class="bmd-label-floating">Title</label>
                        <input type="text" name="title" class="form-control" id="title">
                    </div>
                    <div class="form-group">
                        <label for="note" class="bmd-label-floating">Note</label>
                        <textarea class="form-control" rows="5" id="note" name="note"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised"
                                onclick="addConversationNote(this.form)">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="addConversationNote"/>
                        <input type="hidden" name="companyId" id="companyId"
                               value="<%=companyManager.getCompany().companyId%>"/>
                        <input type="hidden" name="conversationNoteUserId" id="conversationNoteUserId"
                               value="<%= userId %>"/>
                    </div>
                </form>
                <%}%>
            </div>
        </div>
    </div>
</div>
<!--Appointment Modal -->
<div class="modal fade" id="addAppointment" tabindex="-1" role="dialog"
     aria-labelledby="addAppointmentLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAppointmentLabel">Add Appointment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="companyManager" action="" method="post">
                    <div class="form-group">
                        <label for="appointmentDate" class="bmd-label-floating">Date</label>
                        <input type="date" name="appointmentDate" class="form-control"
                               id="appointmentDate">
                    </div>
                    <div class="form-group">
                        <label for="appointmentTime" class="bmd-label-floating">Time</label>
                        <input type="time" name="appointmentTime" class="form-control"
                               id="appointmentTime">
                    </div>
                    <div class="form-group">
                        <label for="appointmentNote" class="bmd-label-floating">Note</label>
                        <textarea class="form-control" rows="5" id="appointmentNote"
                                  name="appointmentNote"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="userIds" class="bmd-label-floating">Share this Appointment with other
                            Users</label>
                        <select class="form-control" multiple="multiple" id="userIds" name="userIds">
                            <%for (int k = 0; k < companyManager.getUsers().length; k++) {%>
                            <%if (userId != companyManager.getUser(k).userId) {%>
                            <option value="<%=companyManager.getUser(k).userId%>">
                                <%=companyManager.getUser(k).fullName()%>
                            </option>
                            <% } %>
                            <% } %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised"
                                onclick="addAppointment(this.form)">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="addAppointment"/>
                        <input type="hidden" name="companyId" id="companyId"
                               value="<%=companyManager.getCompany().companyId%>"/>
                        <input type="hidden" name="appointmentUserId" id="appointmentUserId"
                               value="<%= userId %>"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--VUE JS--%>
<%--<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>--%>
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
<script type="text/javascript" src="../js/bootstrap-multiselect.js"></script>

<script>$(document).ready(function () {
    $(document).ready(function () {
        $('#tagIds').multiselect({
            enableFiltering: true
        });
        $('#userIds').multiselect({
            enableFiltering: true
        });
    });
    $('body').bootstrapMaterialDesign();
});</script>

</body>
</html>