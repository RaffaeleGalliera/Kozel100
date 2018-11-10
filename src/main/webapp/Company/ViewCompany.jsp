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
<%@ page import="global.Status" %>
<%@ page import="blogics.User" %>
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

    if (status.equals(("addNote"))) {
        companyManager.addConversationNote();
    }

    if (status.equals(("addAppointment"))) {
        companyManager.addAppointment();
    }

    if (status.equals(("addCommercialProposal"))) {
        companyManager.addCommercialProposal();
    }

    if (status.equals("purchaseService")) {

        companyManager.purchaseService();

    }

    if (status.equals("deleteTag")) {
        companyManager.deleteTag(Integer.parseInt(request.getParameter("tagId")));
    }

    if (status.equals("deleteNote")) {
        companyManager.deleteCompanyNote(Integer.parseInt(request.getParameter("companyNoteId")));
    }
    if (status.equals("updateCompanyNote")) {
        companyManager.updateCompanyNote();
    }
    if (status.equals("updateCommercialProposal")) {
        companyManager.updateCommercialProposal();
    }

%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="../resources/logoS.png">
    <link rel="icon" type="image/png" href="../resources/logoS.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>
        Kozel100 CRM
    </title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>

    <!-- Material Design for Bootstrap fonts and icons -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500|Material+Icons" rel="stylesheet">
    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" href="https://storage.googleapis.com/non-spec-apps/mio-icons/latest/twotone.css">
    <%--Bootstrap multiselect css--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <%--TimePicker css--%>
    <link href="https://cdn.jsdelivr.net/npm/timepicker@1.11.14/jquery.timepicker.min.css" rel="stylesheet"/>
<%--Common CSS--%>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>
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
                            <button style="width: 32%" type="button" class="btn btn-outline-secondary"
                                    data-toggle="modal"
                                    data-target="#addNote">
                                Add Note
                            </button>
                            <button style="width: 32%" type="button" class="btn btn-outline-secondary"
                                    data-toggle="modal"
                                    data-target="#addAppointment">
                                Add Appointment
                            </button>
                            <button style="width: 32%" type="button" class="btn btn-outline-secondary"
                                    data-toggle="modal"
                                    data-target="#addCommercialProposal">
                                Add Proposal
                            </button>
                        </div>
                    </div>
                    <hr class="my-4">
                    <div class="row">
                        <div class="col"><p class="lead">
                            <b>Contact References:</b>
                            <br>
                            <%=companyManager.getContactPerson().fullName()%>
                            <br>
                            Email: <%=companyManager.getContactPerson().email%>
                            <br>
                            Phone Number: <%=companyManager.getContactPerson().phoneNumber%>
                        </p></div>
                        <div class="col"><p class="lead">
                            <b>Responsible User:</b><%=companyManager.getUser().fullName()%>
                            <br>
                            <b>Client Since: </b><%=companyManager.getCompany().startDate%>
                        </p></div>
                    </div>
                    <hr class="my-4">
                    <div class="row">
                        <div class="col"><p class="lead"><b>Customer Type:</b> <%=companyManager.getClientType().name%>
                        </p></div>
                        <div class="col"><p class="lead"><b>Product Category:</b> <%=companyManager.getProductCategory().name%>
                        </p></div>
                    </div>
                    <hr class="my-4">
                    <div class="row">
                        <div class="col"><p class="lead"><b>Country:</b> <%=companyManager.getCompany().country%>
                            <br>
                            <b>State:</b> <%=companyManager.getCompany().state%>
                        </p></div>
                        <div class="col"><p class="lead">
                            <b>Address:</b><%=companyManager.getCompany().address%>
                            <br>
                            <b>City:</b> <%=companyManager.getCompany().city%>
                            <br>
                            <b>Zip:</b><%=companyManager.getCompany().zip%>
                        </p>
                        </div>
                    </div>
                    <hr class="my-4">
                    <div class="row">
                        <div class="col"><p class="lead"><b>VAT:</b> <%=companyManager.getCompany().vat%>
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
                                <button style="float:right" type="submit" data-toggle="modal"
                                        data-target="#addAppointment"
                                        class="btn btn-default">
                                    <i class="material-icons md-36">add</i>
                                </button>
                            </h2>
                        </div>
                    </div>
                    <% int nAppointments = companyManager.getCompanyAppointments().map(t -> t.length).orElse(0);
                        if (nAppointments == 0) {%>
                    <div class="jumbotron">
                        <h6 class="display-4"> There is no Appointment Yet</h6>
                    </div>
                    <%} else {%>
                    <table class="col-md-12 table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Note</th>
                            <th>Date</th>
                            <th>Partecipants</th>
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
                            <td><%=companyManager.getCompanyAppointment(k).date%>
                            </td>
                            <td>
                            <%for(User partecipatingUser : companyManager.getPartecipatingUsers(companyManager.getCompanyAppointment(k).appointmentId)){%>
                            <%=partecipatingUser.fullName()%>
                                <br>
                            <%}%>
                            </td>
                            <td><%=companyManager.getCompanyAppointment(k).time%>
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
                                <button style="float:right" type="submit" data-toggle="modal"
                                        data-target="#addConversation"
                                        class="btn btn-default">
                                    <i class="material-icons md-36">add</i>
                                </button>
                            </h2>

                        </div>
                    </div>
                    <% int nConversation = companyManager.getConversations().map(t -> t.length).orElse(0);
                        if (nConversation == 0) {%>
                    <div class="jumbotron">
                        <h6 class="display-4"> There is no Conversation Yet</h6>
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
                            <td><%=companyManager.getUserById(companyManager.getConversation(k).userId).fullName()%>
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
                                <button style="float:right" type="submit" data-toggle="modal"
                                        data-target="#addNote"
                                        class="btn btn-default">
                                    <i class="material-icons md-36">add</i>
                                </button>
                            </h2>
                        </div>
                    </div>
                    <% int nNote = companyManager.getCompanyNotes().map(t -> t.length).orElse(0);
                        if (nNote == 0) {%>
                    <div class="jumbotron">
                        <h6 class="display-4"> There is no Note Yet</h6>
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
                            <th>Posted</th>
                            <th>Last Update</th>
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
                            <td><%=companyManager.getUserById(companyManager.getCompanyNote(k).userId).fullName()%>
                            </td>
                            <td><%=companyManager.getCompanyNoteConversation(companyManager.getCompanyNote(k).conversationId)%>
                            </td>
                            <td><%=companyManager.getCompanyNote(k).createdAt%>
                            </td>
                            <td><%=companyManager.getCompanyNote(k).updatedAt%>
                            </td>
                            <%if ((isAdmin) || (userId == companyManager.getCompanyNote(k).userId)) {%>
                            <td><a style=" color:#34373b" class="edit" title="Add" data-toggle="tooltip"
                                   href="JavaScript: updateNoteModal('<%=companyManager.getCompanyNote(k).conversationNoteId%>', '<%=companyManager.getCompanyNote(k).conversationId%>', '<%=companyManager.getCompanyNote(k).title%>', '<%=companyManager.getCompanyNote(k).note%>');"><i
                                    class="material-icons md-24">&#xE254;</i>
                            </a>
                                <a style=" color:#34373b" class="delete" title="Delete" data-toggle="tooltip"
                                   href="JavaScript:deleteNote('<%=companyManager.getCompanyNote(k).conversationNoteId%>');"><i
                                        class="material-icons md-24">&#xE872;</i>
                                </a>
                            </td>
                            <%} else {%>
                            <td>
                            <a class="highlight_off" title="That's Not your Note" data-toggle="tooltip"><i
                                    class="material-icons md-24">highlight_off</i>
                            </a>
                            </td>
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
                </div>
            </div>

            <div class="tab-pane fade" id="consultingServices" role="tabpanel" aria-labelledby="consultingServices-tab">
                <%--Consulting Services Tab--%>
                <div class="table-wrapper">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2>Consulting Services
                                <button style="float:right" type="submit" data-toggle="modal"
                                        data-target="#addServicePurchase"
                                        class="btn btn-default">
                                    <i style=" color:#34373b" class="material-icons md-36">add</i>
                                </button>
                            </h2>
                        </div>
                    </div>
                    <% int nService = companyManager.getConsultingServicesPurchased().map(t -> t.length).orElse(0);
                        if (nService == 0) {%>
                    <div class="jumbotron">
                        <h6 class="display-4"> There is no Consulting Service Yet</h6>
                    </div>
                    <%} else {%>
                    <table class="col-md-12 table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Purchase Date</th>
                            <th>Service Date</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (int k = 0; k < nService; k++) {%>
                        <tr>
                            <td><%= k + 1 %>
                            </td>
                            <td><%=companyManager.getServiceByPurchase(companyManager.getConsultingServicePurchased(k).consultingServiceId).name%>
                            </td>
                            <td><%=companyManager.getConsultingServicePurchased(k).purchaseDate%>
                            </td>
                            <td><%=companyManager.getConsultingServicePurchased(k).startDate%>
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
                            <h2>Commercial Proposals
                                <a style="float: right" class="add" title="Add" data-toggle="modal"
                                   data-target="#addCommercialProposal"><i
                                        class="material-icons md-36">add</i>
                                </a>
                            </h2>
                        </div>
                    </div>
                    <% int nProposal = companyManager.getCommercialProposals().map(t -> t.length).orElse(0);
                        if (nProposal == 0) {%>
                    <div class="jumbotron">
                        <h6 class="display-4"> There is no Commercial Proposal Yet</h6>
                    </div>
                    <%} else {%>
                    <table class="col-md-12 table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Services</th>
                            <th>User</th>
                            <th>Status</th>
                            <th>Last Update</th>
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
                            <td>
                                None
                            </td>
                            <%} else {%>
                            <%ArrayList<ConsultingService> services = companyManager.getConsultingServicesProposedTo(companyManager.getCommercialProposal(k).commercial_proposal_id).get();%>
                            <td>
                                <%for (ConsultingService s : services) {%>
                                <%=s.name%>
                                <br>
                                <%}%>
                            </td>
                            <%}%>
                            <td><%=companyManager.getUserById(companyManager.getCommercialProposal(k).user_id).fullName()%>
                            <td><%=companyManager.getCommercialProposal(k).status.name()%>
                            </td>
                            <td><%=companyManager.getCommercialProposal(k).updatedAt%>
                            </td>
                            <td>
                                <a style=" color:#34373b" class="edit" title="Add" data-toggle="tooltip"
                                   href="JavaScript: updateProposalModal('<%=companyManager.getCommercialProposal(k).commercial_proposal_id%>', '<%=companyManager.getCommercialProposal(k).name%>', '<%=companyManager.getCommercialProposal(k).description%>','<%=companyManager.getCommercialProposal(k).status%>');"><i
                                        class="material-icons md-24">&#xE254;</i>
                                </a>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <%}%>
                </div>
            </div>

            <div class="tab-pane fade" id="tags" role="tabpanel" aria-labelledby="tags-tab">
                <%--Tag Tab--%>
                <div class="container">
                    <div class="table-wrapper">
                        <div class="row">
                            <div class="col-sm-12">
                                <h2>Tags
                                    <button style="float:right" type="submit" data-toggle="modal"
                                            data-target="#addTag"
                                            class="btn btn-default">
                                        <i class="material-icons md-36">add</i>
                                    </button>
                                </h2>
                            </div>
                        </div>
                        <% if (nTag == 0) {%>
                        <div class="jumbotron">
                            <h6 class="display-4"> There is no Tag Yet</h6>
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
                                    <a style="color:#34373b" class="delete" title="Delete" data-toggle="tooltip"
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
                        <select class="form-control multipleSelect" name="tagIds" id="tagIds" multiple="multiple"
                                required>
                            <%for (int k = 0; k < companyManager.getTags().length; k++) {%>
                            <option value="<%=companyManager.getTag(k).tagId%>">
                                <%=companyManager.getTag(k).name%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised">
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

<!-- Purchase Service Modal -->
<div class="modal fade" id="addServicePurchase" tabindex="-1" role="dialog" aria-labelledby="addTagLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="purchaseServiceLabel">Add a Purchase</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <%--TODO i used get() to retrieve Optionals here and there because my balls were exploding--%>

                <form name="companyManager" action="" method="post">
                    <div class="form-group">
                        <label for="purchasedServiceId" class="bmd-label-floating">Consulting Service</label>
                        <select class="form-control" id="purchasedServiceId" name="purchasedServiceId" required>
                            <%for (int k = 0; k < companyManager.getConsultingServices().get().length; k++) {%>
                            <option value="<%=companyManager.getConsultingService(k).get().consulting_service_id%>">
                                <%=companyManager.getConsultingService(k).get().name%>
                            </option>
                            <% } %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="purchaseDate" class="bmd-label-floating">Purchase Date</label>
                        <input type="date" placeholder="false" name="purchaseDate" class="form-control"
                               id="purchaseDate" oninput="pastDate(this)" required>
                    </div>

                    <div class="form-group">
                        <label for="startDate" class="bmd-label-floating">Start Date</label>
                        <input type="date" name="startDate" class="form-control"
                               id="startDate" oninput="futureDate(this)">
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="purchaseService"/>
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
                <form name="addConversationForm" action="" method="post">
                    <div class="form-group">
                        <label for="reason" class="bmd-label-floating">Reason</label>
                        <input type="text" name="reason" class="form-control" id="reason" required>
                    </div>
                    <div class="form-group">
                        <label for="conversationDate" class="bmd-label-floating">Date</label>
                        <input type="date" name="conversationDate" class="form-control"
                               id="conversationDate" required oninput="pastDate(this)">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="addConversation"/>
                        <input type="hidden" name="companyId" id="companyIdByConversation"
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
                    <h6 class="display-4"> There is no Conversation Yet</h6>
                </div>
                <%} else {%>
                <form name="companyManager" action="" method="post">
                    <label for="conversationId" class="bmd-label-floating">Conversation</label>
                    <select class="form-control" id="conversationId" name="conversationId" required>
                        <%for (int k = 0; k < nConversation; k++) {%>
                        <option value="<%=companyManager.getConversation(k).conversationId%>">
                            <%=companyManager.getConversation(k).date%>
                            : <%=companyManager.getConversation(k).reason%>
                            : <%=companyManager.getUserById(companyManager.getConversation(k).userId).fullName()%>
                        </option>
                        <% } %>
                    </select>
                    <div class="form-group">
                        <label for="Title" class="bmd-label-floating">Title</label>
                        <input type="text" name="title" class="form-control" id="title" value="" required>
                    </div>
                    <div class="form-group">
                        <label for="note" class="bmd-label-floating">Note</label>
                        <textarea class="form-control" rows="5" id="note" name="note" value="" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised">
                            Submit
                        </button>
                    </div>
                    <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
                    <input type="hidden" name="companyNoteId" value=""/>
                    <input type="hidden" name="status" value="addNote"/>
                    <input type="hidden" name="conversationNoteUserId" id="conversationNoteUserId"
                           value="<%= userId %>"/>
                </form>
                <%}%>
            </div>
        </div>
    </div>
</div>
<!--Update Note Modal -->
<div class="modal fade" id="updateNoteModal" tabindex="-1" role="dialog" aria-labelledby="updateNoteTitle"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateNoteLabel">Update Note</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="updateNoteForm" action="" method="post">
                    <label for="updatedConversationId" class="bmd-label-floating">Conversation</label>
                    <select class="form-control" id="updatedConversationId" name="conversationId" required>
                        <%for (int k = 0; k < nConversation; k++) {%>
                        <option value="<%=companyManager.getConversation(k).conversationId%>">
                            <%=companyManager.getConversation(k).date%>
                            : <%=companyManager.getConversation(k).reason%>
                            : <%=companyManager.getUserById(companyManager.getConversation(k).userId).fullName()%>
                        </option>
                        <% } %>
                    </select>
                    <div class="form-group">
                        <label for="updatedTitle" class="bmd-label-floating">Title</label>
                        <input type="text" name="title" class="form-control" id="updatedTitle" required>
                    </div>
                    <div class="form-group">
                        <label for="updatedNote" class="bmd-label-floating">Note</label>
                        <textarea class="form-control" rows="5" id="updatedNote" name="note" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="updateCompanyNote"/>
                        <input type="hidden" name="companyId" id="companyIdByNote"
                               value="<%=companyManager.getCompany().companyId%>"/>
                        <input type="hidden" name="companyNoteId" id="updateCompanyNoteId"
                               value=""/>
                    </div>
                </form>
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
                               id="appointmentDate" oninput="futureDate(this)" required>
                    </div>
                    <div class="form-group">
                        <label for="appointmentTime" class="bmd-label-floating">Time</label>
                        <input type="text"  name="appointmentTime" class="form-control timePicker"
                               id="appointmentTime">
                    </div>
                    <div class="form-group">
                        <label for="appointmentNote" class="bmd-label-floating">Note</label>
                        <textarea class="form-control" rows="5" id="appointmentNote"
                                  name="appointmentNote" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="userIds" class="bmd-label-floating">Share this Appointment with other
                            Users</label>
                        <select class="form-control multipleSelect" name="userIds" id="userIds" multiple="multiple">
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
                        <button type="submit" class="btn btn-primary btn-raised">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="addAppointment"/>
                        <input type="hidden" name="companyId" id="companyIdByAppointment"
                               value="<%=companyManager.getCompany().companyId%>"/>
                        <input type="hidden" name="appointmentUserId" id="appointmentUserId"
                               value="<%= userId %>"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--Commercial Proposal Modal-->
<div class="modal fade" id="addCommercialProposal" tabindex="-1" role="dialog"
     aria-labelledby="addAppointmentLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCommercialProposalLabel">Add Commercial Proposal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="companyManager" action="" method="post">
                    <div class="form-group">
                        <label for="proposalName" class="bmd-label-floating">Name</label>
                        <input type="text" name="proposalName" class="form-control"
                               id="proposalName" required>
                    </div>
                    <div class="form-group">
                        <label for="proposalDescription" class="bmd-label-floating">Description</label>
                        <input type="textarea" name="proposalDescription" class="form-control"
                               id="proposalDescription" required>
                    </div>

                    <div class="form-group">
                        <label for="consultingServiceIds" class="bmd-label-static">Related Consulting Services</label>
                        <select class="form-control multipleSelect" name="consultingServiceIds" multiple="multiple"
                                id="consultingServiceIds">
                            <%for (int k = 0; k < companyManager.getConsultingServices().get().length; k++) {%>
                            <option value="<%=companyManager.getConsultingService(k).get().consulting_service_id%>">
                                <%=companyManager.getConsultingService(k).get().name%>
                            </option>
                            <% } %>
                        </select>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised">
                            Submit
                        </button>
                        <input type="hidden" name="status" value="addCommercialProposal"/>
                        <input type="hidden" name="commercialProposalUserId" value="<%=userId%>"/>
                        <input type="hidden" name="companyId" id="companyId"
                               value="<%=companyManager.getCompany().companyId%>"/>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Update Proposal Modal -->
<div class="modal fade" id="updateProposalModal" tabindex="-1" role="dialog" aria-labelledby="updateProposalModal"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateProposalTitle">Update Proposal Status</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="updateProposalForm" action="" method="post">
                    <div class="form-group">
                        <label for="proposalStatus" class="bmd-label-static">Related Consulting Services</label>
                        <select class="form-control" name="proposalStatus"
                                id="proposalStatus">
                            <option value="<%=Status.PENDING%>">
                            Pending
                            </option>
                            <option value="<%=Status.ACCEPTED%>">
                            Accepted
                            </option>
                            <option value="<%=Status.REJECTED%>">
                            Refused
                            </option>
                        </select>
                    </div>
                    <input type="hidden" name="status" value="updateCommercialProposal"/>
                    <input type="hidden" name="proposalName" value=""/>
                    <input type="hidden" name="proposalDescription" value=""/>
                    <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
                    <input type="hidden" name="commercialProposalId" id="updateCommercialProposalId"
                           value=""/>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-raised">
                            Update
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

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
<%--Multiselect javascript--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/timepicker@1.11.14/jquery.timepicker.min.js"></script>



<script>
    $('#updateNoteModal').on('shown.bs.modal', function() {
        $('#updatedTitle').focus();
    })

    $(document).ready(function () {
        $('.multipleSelect').css('width', '100%');
        $('.multipleSelect').select2();
        $('.timePicker').timepicker({
            'disableTextInput':true,
            'minTime': "07:00am",
            'maxTime': "08:00pm"
        });
        $('body').bootstrapMaterialDesign();
    });


    let today = new Date().toISOString().substr(0, 10);
    $('input[type="date"]').val(today)

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

    function updateNoteModal(id, conversationId, title, note) {
        $('#updateNoteModal').modal('show');
        document.updateNoteForm.companyNoteId.value = id;
        document.updateNoteForm.conversationId.value = conversationId;
        document.updateNoteForm.title.value = title;
        document.updateNoteForm.note.value = note;
    }

    function updateProposalModal(id, name, description, status) {
        $('#updateProposalModal').modal('show');
        document.updateProposalForm.commercialProposalId.value = id;
        document.updateProposalForm.proposalName.value = name;
        document.updateProposalForm.proposalDescription.value = description;
        document.updateProposalForm.proposalStatus.value = status;
    }


    function pastDate(input) {
        var GivenDate = input.value;
        var CurrentDate = new Date();
        GivenDate = new Date(GivenDate);

        if (GivenDate > CurrentDate) {
            input.setCustomValidity("Are you John Titor?");
            return false;
        } else {
            input.setCustomValidity('');
            return true;
        }
    }

    function futureDate(input) {
        var GivenDate = input.value;
        var CurrentDate = new Date();
        GivenDate = new Date(GivenDate);

        if (GivenDate < CurrentDate) {
            input.setCustomValidity("You can't insert past appointments");
            return false;
        } else {
            input.setCustomValidity('');
            return true;
        }
    }

    // function validateAppointmentTime(input) {
    // //     var time = input.value;
    // //     givenTime = new Date("01/01/2000"+time);
    // //     startWorkingTime = new Date("01/01/2000"+"08:00:00");
    // //     endWorkingTime= new Date("01/01/2000"+"20:00:00");
    // //
    // //     if (givenTime > endWorkingTime ) {
    // //         input.setCustomValidity("Appointments After 20:00 are not accepted");
    // //         return false;
    // //     }
    // //     if (givenTime < startWorkingTime) {
    // //         input.setCustomValidity("Appointments Before 08:00 are not accepted");
    // //         return false;
    // //     } else {
    // //         input.setCustomValidity('');
    // //         return true;
    // //     }
    // // }

    function deleteTag(id, name) {

        r = confirm("Are you sure you want to delete the " + name + "  Tag?");

        if (r === true) {
            document.deleteTagForm.tagId.value = id;

            document.deleteTagForm.submit();
        }
        else {
            return;
        }

    }
</script>
</body>
</html>