<%-- 
    Document   : helloTitle
    Created on : Nov 5, 2023, 3:18:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="isClient" scope="request" class="java.lang.Boolean"/>
<jsp:useBean id="user" scope="request" class="model.auth.UserDetails"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="./style.css">
    <script>
        var isClient = <%=isClient%>; //change this variable to false if logged in as restaurant
        var username = "<jsp:getProperty name="user" property="username" />"; //change this variable to the current user
        $(document).ready(function(){
            if (isClient){
                $("#details").addClass("hidden");
            }
            $(".name").html(username);
        });
    </script>
</head>
<body>
    <p class="helloTitle">Hello <span class="name">User</span>! <img id="details" src="img/edit.svg" /></p>
    
</body>
</html>