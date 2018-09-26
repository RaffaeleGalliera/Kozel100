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

<form name="contactPersonManager" action="" method="post">

    <table>

        <tr>
            <td>First Name</td> <td><input type="text" name="firstName" size="30"/></td>
        </tr>

        <tr>
            <td>Last_name</td> <td><input type="text" name="lastName" size="30"/></td>
        </tr>

        <tr>
            <td>Phone_number</td> <td><input type="text" name="phoneNumber" size="30"/></td>
        </tr>

        <tr>
            <td>Email</td> <td><input type="text" name="email" size="30"/></td>
        </tr>

        <input type="button" value="Inserisci" onClick="insert(this.form)"/>

    </table>

</form>

Dati nel bean: <br><br><br>
first name: <%=contactPersonManager.getFirstName()%><br><br>
last name: <%=contactPersonManager.getLastName()%><br><br>
email: <%=contactPersonManager.getEmail()%><br><br>
phone number: <%=contactPersonManager.getPhoneNumber()%><br><br>

<%contactPersonManager.insertContactPerson();%>

</html>


<script>

    function insert(form){

        form.action="InsertContactPerson.jsp";
        form.submit();
    }

</script>
