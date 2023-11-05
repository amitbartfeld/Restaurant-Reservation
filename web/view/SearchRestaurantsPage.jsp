<%-- 
    Document   : HomePage
    Created on : Nov 5, 2023, 7:23:07 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Reservation | Home</title>
    <link rel="stylesheet" href="./style.css">
</head>

<body>
    <jsp:include page="Header.jsp" />
    <jsp:include page="HelloTitle.jsp" />
    <form action="Controller">
        <jsp:include page="SearchBar.jsp" />
        <input type="hidden" name="action" id="update" />
    </form>
    <div class="center">
        <div class="RestaurantContainer">
            <p>Featured Restaurants:</p><div></div>
            <div class="grid">
            <%
                request.setAttribute("restaurantName", "Papa Joe");
                request.setAttribute("location", "Mama Joe");
            %>
            <jsp:include page="RestaurantCard.jsp" />
            </div>
        </div>
    </div>
</body>

</html>