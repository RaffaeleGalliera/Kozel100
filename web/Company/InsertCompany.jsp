<%@ page info="Inserimento nuovo Menù" %>
<%@ page session="false"%>
<%@ page buffer="30kb" %>

<jsp:useBean id="companyManager" scope="page" class="bflows.CompanyManager"/>
<jsp:setProperty name="companyManager" property="*"/>

<html>

    <form name="companyManager" action="" method="post">

        <table>

            <tr>
                <td>ID</td> <td><input type="text" name="companyId" size="30"/></td>
            </tr>

            <tr>
                <td>Name</td> <td><input type="text" name="name" size="30"/></td>
            </tr>

            <tr>
                <td>Vat</td> <td><input type="text" name="vat" size="30"/></td>
            </tr>

            <tr>
                <td>Address</td> <td><input type="text" name="address" size="30"/></td>
            </tr>

            <tr>
                <td>City</td> <td><input type="text" name="city" size="30"/></td>
            </tr>

            <tr>
                <td>Email</td> <td><input type="text" name="email" size="30"/></td>
            </tr>

            <input type="button" value="Inserisci" onClick="insert(this.form)"/>

        </table>

    </form>

</html>

<script>


    function insert(form){


        form.action="InsertCompany.jsp";
        form.submit();
    }

</script>