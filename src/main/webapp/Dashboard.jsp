<%--
  Created by IntelliJ IDEA.
  User: teo
  Date: 07/10/18
  Time: 15.33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="services.tokenservice.*" %>
<%@ page import="services.sessionservice.Session" %>
<%@ page import="util.Debug" %>



<style>

    .title-container{

        width: 60%;
        text-align: center;
        font-family: 'Shadows Into Light Two', cursive;
        margin: 0 auto;
        padding: 3%;

    }

    .footer-container{

        width: 60%;
        text-align: center;
        font-family: 'Shadows Into Light Two', cursive;
        margin: 0 auto;
        padding: 3%;

    }

    h1{


        width: 60%;
        text-align: center;
        margin: 0 auto;
        padding: 3%;

    }

    #lol{

        width: 70%;
        margin: 0 auto;


    }

</style>

<html>
<head>

    <title>Dashboard</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Material Design for Bootstrap fonts and icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/common.css">



</head>



<body>
<jsp:include page="/Common/Navbar.jsp"/>


<div class="jumbotron" id="lol">
    <h1>Dashboard ╭∩╮(-_-)╭∩╮</h1>
</div>

<div class="container title-container">

    <h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A ad atque beatae consectetur deleniti dolorem error
        est eum illo laboriosam molestias neque nihil nostrum, praesentium quasi repellendus suscipit voluptas,
        voluptate.
    </h2>
    <h3>Aliquid dolorem hic ipsa mollitia tempora. Architecto cum dolores eius ex temporibus. Aperiam assumenda
        deleniti, dolores dolorum eos et exercitationem inventore molestiae nostrum perspiciatis possimus quibusdam
        tempora vitae. Aperiam, fugit!
    </h3>
    <h4>Ab accusantium autem consequatur cum debitis deleniti dolorem facere, facilis fugit numquam obcaecati odit
        officia quidem repellendus sit sunt veritatis voluptatum? At ducimus itaque nihil nobis possimus repellat
        repellendus similique!
    </h4>
    <h5>Blanditiis dicta dolorum est magni maiores nam nostrum officia, quos sit velit vero voluptate. Ab accusamus,
        adipisci corporis culpa cumque dolores doloribus dolorum eos facilis incidunt placeat possimus quisquam sunt!
    </h5>

</div>

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
<script type="text/javascript">
    $(document).ready(function () {

        $('#insertCompanyModal').modal('show');

    });
</script>
</body>
</html>
