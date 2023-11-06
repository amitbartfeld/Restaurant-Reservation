<%-- 
    Document   : HomePage
    Created on : Nov 5, 2023, 7:23:07 PM
    Author     : admin
--%>

<%@page import="model.auth.RestaurantDetails"%>
<%@page import="model.SearchRestaurantLogic"%>
<%@page import="model.Constants"%>
<%@page import="model.DatabaseOperationsSingleton"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="restaurants" class="model.auth.RestaurantDetails[]" scope="request" />
<jsp:useBean id="user" scope="session" class="model.auth.UserDetails"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Reservation | Home</title>
    <link rel="stylesheet" href="./style.css">
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
                integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
                crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            function changeClick(id) {
                document.getElementById("update").value = id;
            }
        </script>
</head>

<body>
    <form action="Controller">
                    <button type="submit" id="ac" value="search" class="hidden" onclick="changeClick(search);">Search</button>
    <jsp:include page="Header.jsp" />
    <jsp:include page="HelloTitle.jsp" />
    <jsp:include page="SearchBar.jsp" />
    <input type="hidden" name="action" id='update' value="search" />
    <div class="center">
        <div class="RestaurantContainer">
            <p>Featured Restaurants:</p><div></div>
            <div class="grid">
                <!-- Get data from database -->
            <%
                for (RestaurantDetails details : restaurants) {
                    request.getSession().setAttribute("restaurantName", details.name);
                    request.getSession().setAttribute("location", details.location);
                    request.getSession().setAttribute("hours", details.openingHours);
                    request.getSession().setAttribute("restaurantUserName", details.username);
            %>
            <jsp:include page="RestaurantCard.jsp" />
            <%}%>
            </div>
        </div>
    </div>
    </form>
</body>

</html>