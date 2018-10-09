<%--
  Created by IntelliJ IDEA.
  User: raffaele
  Date: 22/09/18
  Time: 21.48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page info="Inserimento nuovo Contatto" %>
<%@ page session="false"%>
<%@ page buffer="30kb" %>

<jsp:useBean id="contactPersonManager" scope="page" class="bflows.ContactPersonManager"/>
<jsp:setProperty name="contactPersonManager" property="*"/>


<html>
    <head>
        <title>Kozel100</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </head>

    <form class="form-horizontal" name="contactPersonManager" action="" method="post">
        <fieldset>
            <legend>Contact Person</legend>
            <!-- Text input-->
            <div class="row">
                <div class="col">
                        <input id="firstName" name="firstName" type="text" class="form-control input-md">
                 </div>
                <div class="col">
                            <input id="lastName" name="lastName" type="text" class="form-control input-md">
                </div>
            </div>
            <div class="form-group">
                        <label class="col-md-4 control-label" for="email">Email</label>
                        <div class="col-md-4">
                            <input id="email" name="email" type="text" class="form-control input-md">
                        </div>
            </div>

            <div class="form-group">
                        <label class="col-md-4 control-label" for="phoneNumber">Phone Number</label>
                        <div class="col-md-4">
                            <input id="phoneNumber" name="phoneNumber" type="text" placeholder="Prefix Must Be Added" class="form-control input-md">
                        </div>
            </div>

            <!-- Button -->
            <div class="form-group">
                <div class="col-md-4">
                    <button id="singlebutton" name="singlebutton" class="btn btn-primary" value="inserisci" onclick="insert(this.form)">Inserisci</button>
                </div>
            </div>

        </fieldset>
    </form>
</html>

<%contactPersonManager.insertContactPerson();%>

<script>

    function insert(form){

        form.action="InsertContactPerson.jsp";
        form.submit();
    }

</script>
