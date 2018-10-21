<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 10/19/18
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page info="Inserimento nuova Compagnia" %>
<%@ page session="false" %>
<%@ page buffer="30kb" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>
<%

    String status = null;
    String message = null;
    boolean complete = false;
    status = request.getParameter("status");
    companyManager.setCompanyId(Integer.parseInt(request.getParameter("companyId")));

    if (status.equals("view")) {
        companyManager.companyView();
    }

    if (status.equals(("addProductCategory"))){
        companyManager.addProductCategory();
    }

    if (status.equals("deleteProductCategory")) {
        companyManager.deleteProductCategory(Integer.parseInt(request.getParameter("productCategoryId")));
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
    function addProductCategory(form) {
        form.action = "ViewCompany.jsp";
        form.submit();
    }

    function deleteProductCategory(id, name) {

        r = confirm("Are you sure to delete : " + name + " as  Product Category");

        if (r === true) {
            document.deleteProductCategoryForm.productCategoryId.value = id;

            document.deleteProductCategoryForm.submit();
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
            </div>
            <hr class="my-4">
            <div class="row">
                <div class="col"><p class="lead">Contact References:<%for (int c = 0; c < companyManager.getContactPeople().length; c++) {%>
                    <br>
                    <%=companyManager.getContactPerson(c).fullName()%>
                    <%}%>
                </p></div>
                <div class="col"><p class="lead">Responsible User: </p></div>
            </div>
            <hr class="my-4">
            <div class="row">
                <div class="col"><p class="lead">Customer Type: <%=companyManager.getClientType().name%></p></div>
                <div class="col"><p class="lead">Product Categories:<%for (int c = 0; c < companyManager.getCompanyProducts().length; c++) {%>
                    <br>
                    <%=companyManager.getCompanyProduct(c).name%>
                    <%}%>
                </p></div>
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
        <li class="nav-item"><a class="nav-link" href="#productCategoryCard" data-toggle="collapse"
                                data-target="#productCategoryCard"
                                aria-expanded="false" aria-controls="productCategoryCard">Product Categories</a></li>
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
            <div class="collapse multi-collapse" id="productCategoryCard">
                <div class="card card-body">
                    <div class="container">
                        <div class="table-wrapper">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form action="Setup/InsertUser.jsp">
                                        <h2>Product Categories
                                                <button style="float: right" type="button" class="btn btn-outline-secondary"  data-toggle="modal" data-target="#addProductCategory">Add Product Category</button>
                                        </h2>
                                    </form>
                                </div>
                            </div>

                            <table class="col-md-12 table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Service</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for (int k = 0; k < companyManager.getCompanyProducts().length; k++) {%>
                                <tr>
                                    <td><%= k + 1 %>
                                    </td>
                                    <td><%=companyManager.getCompanyProduct(k).name%></td>
                                    <td>
                                        <a class="delete" title="Delete" data-toggle="tooltip"
                                           href="JavaScript:deleteProductCategory('<%=companyManager.getCompanyProduct(k).productCategoryId%>','<%=companyManager.getCompanyProduct(k).name%>');"><i
                                                class="material-icons">&#xE872;</i></a>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                            <form name="deleteProductCategoryForm" action="ViewCompany.jsp" method="post">
                                <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
                                <input type="hidden" name="productCategoryId" value=""/>
                                <input type="hidden" name="status" value="deleteProductCategory"/>
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

    <!-- Modal -->
    <div class="modal fade" id="addProductCategory" tabindex="-1" role="dialog" aria-labelledby="addProductCategoryLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductCategoryLabel">Add Service</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="companyManager" action="" method="post">
                    <div class="form-group">
                        <label for="productCategoryId" class="bmd-label-floating">Consulting Services</label>
                        <select class="form-control" id="productCategoryId" name="productCategoryId">
                            <%for (int k = 0; k < companyManager.getProductCategories().length; k++) {%>
                            <option value="<%=companyManager.getProductCategory(k).productCategoryId%>">
                                <%=companyManager.getProductCategory(k).name%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                        <div class="modal-footer">
                            <button class="btn btn-default">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-raised" onclick="addProductCategory(this.form)">
                                Submit
                            </button>
                            <input type="hidden" name="status" value="addProductCategory"/>
                            <input type="hidden" name="companyId" value="<%=companyManager.getCompany().companyId%>"/>
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