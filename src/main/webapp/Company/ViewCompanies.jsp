<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 04/10/18
  Time: 9.28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>
<%@ page import="services.tokenservice.JWTService" %>


<%

    Cookie[] cookies = request.getCookies();
    String status = request.getParameter("status");
    boolean authorized=false;

    //Ciclo di verifica --> se token non presente o non verificato setto a false authorized

    //TODO Is this the best way to verify a User?

    if(cookies!=null) {

        for (int i = 0; i < cookies.length; i++) {

            if (JWTService.parseAndVerifyJWT(cookies[i].getValue()) && cookies[i].getName().equals("jwt_auth_token")) {

                authorized = true;
                break;

            } else {

                authorized = false;

            }

        }
    }

    if (status==null) status="view"; //

    if (status=="view"){

        companyManager.companiesView();

    }

    if (status=="filter"){

        request.getParameter("filterByUser");

        //TODO Determine the kind of filtering requested by the user, decide how to deal with getFilteredCompanies parameters and implement the Queries

        companyManager.getFilteredCompanies(1,1,1);

    }

%>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/view_companies.css">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">

    <style>

        .filter{

            background-color: whitesmoke;
            margin-left: 10%;
            margin-right: 10%;
            padding: 3%;
            border-radius: 7px;
            padding-bottom: 1%;
            margin-bottom: 3%;
            
        }
        
        .filterGroup{

            display: none;
            
        }

    </style>


    <title>Kozel100 CRM</title

    <%

        //If the user isn't providing a valid token i'll send him back to login page
        if(!authorized){

            String redirectURL = "/index.jsp";
            response.sendRedirect(redirectURL);

        }

    %>

</head>
<body>
<jsp:include page="/Common/Navbar.jsp"/>


<script>

    function toggle() {

			var x = document.getElementById("filter");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}

		}

    function redirect() {

			window.location.replace("/Company/InsertCompany.jsp");

            }

    function getFiltered() {


            f=document.getElementById("filterForm");

            if(f.filterByType.checked || f.filterByUser.checked || f.filterByProduct.checked){

                f.submit();

            }else{

            	alert("Cazzo filtri?!");

            }


		}

    function track(checkbox){


        if(checkbox.id == "filterByType"){


            if(!checkbox.checked){

              checkbox.value="false";
              document.getElementById("filterClientTypeGroup").style.display = "none";

            }else {

              checkbox.value="true";
              document.getElementById("filterClientTypeGroup").style.display = "block";

            }

        }

        if(checkbox.id == "filterByUser"){


            if(!checkbox.checked){

              checkbox.value="false";
              document.getElementById("filterUserGroup").style.display = "none";

            }else {

              checkbox.value="true";
              document.getElementById("filterUserGroup").style.display = "block";

            }

        }

			if(checkbox.id == "filterByProduct"){


				if(!checkbox.checked){

                    checkbox.value="false";
					document.getElementById("filterProductGroup").style.display = "none";

				}else {

                    checkbox.value="true";
					document.getElementById("filterProductGroup").style.display = "block";

				}

			}


    }

</script>


<div class="container">
    <div class="row">
        <div class="col-md-12">
                <h1 class="text-center">
                    Companies
                    <button class="btn btn-raised btn-primary" onclick="redirect()"><i class="fa fa-plus"></i>Add New</button>
                    <button class="btn btn-raised btn-primary" onclick="toggle()"><i class="fa fa-plus"></i>Filter</button>
                </h1>
        </div>

        <div class="container filter" id="filter">

            <form id="filterForm" action="ViewCompanies.jsp">

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByType" name="filterByType" value="false" onchange="track(this)">
                        Tipo Cliente
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterClientTypeGroup">
                    <select class="form-control" id="clientTypeId" name="clientTypeId">
                        <%for (int k = 0; k < companyManager.getClientTypes().length; k++) {%>
                        <option value="<%=companyManager.getClientType(k).clientTypeId%>"><%=companyManager.getClientType(k).name%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByUser" name="filterByUser" value="false" onchange="track(this)">
                        Utente
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterUserGroup">
                    <select class="form-control" id="userId" name="userId">
                        <%for (int k = 0; k < companyManager.getUsers().length; k++) {%>
                        <option value="<%=companyManager.getUser(k).userId%>"><%=companyManager.getUser(k).lastName%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <div class="switch">
                    <label>
                        <input class="form-check-input" type="checkbox" id="filterByProduct" name="filterByProduct" value="false" onchange="track(this)">
                        Categoria Merceologica
                    </label>
                </div>
                <div class="form-group filterGroup" id="filterProductGroup">
                    <select class="form-control" id="productCategoryId" name="productCategoryId">
                        <%for (int k = 0; k < companyManager.getProductCategories().length; k++) {%>
                        <option value="<%=companyManager.getProductCategory(k).productCategoryId%>"><%=companyManager.getProductCategory(k).name%>
                        </option>
                        <% } %>
                    </select>
                </div>

                <input type="hidden" name="status" value="filter"/>
                <button type="button" class="btn btn-primary btn-raised" onclick="getFiltered()">Submit</button>

            </form>

        </div>



            <table class="col-md-12 table table-bordered">
                <thead class="cf">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">VAT</th>
                    <th scope="col">Address</th>
                    <th scope="col">City</th>
                    <th scope="col">Email</th>
                    <th scope="col">Contact Reference</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <%for (int k = 0; k < companyManager.getCompanies().length; k++) {%>
                <tr>
                    <th scope="row"> <%= k %> </th>

                    <td><%=companyManager.getCompany(k).name%>
                    </td>
                    <td><%=companyManager.getCompany(k).vat%>
                    </td>
                    <td><%=companyManager.getCompany(k).address%>
                    </td>
                    <td><%=companyManager.getCompany(k).city%>
                    </td>
                    <td><%=companyManager.getCompany(k).email%>
                    </td>
                    <td>
                        <%for (int c = 0; c < companyManager.getContactPeople(companyManager.getCompany(k).companyId).length; c++) {%>
                        <%=companyManager.getContactPeople(companyManager.getCompany(k).companyId)[c].fullName()%>
                        <%}%>
                    </td>
                    <td>
                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                class="material-icons">&#xE872;</i></a>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
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
