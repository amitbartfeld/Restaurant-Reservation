<%-- 
    Document   : RestaurantCard
    Created on : Nov 5, 2023, 7:28:31 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="restaurantName" class="java.lang.String" scope="session"/>
<jsp:useBean id="location" class="java.lang.String" scope="session"/>
<jsp:useBean id="hours" class="model.OpeningHours" scope="session" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
    <script>
        function changeClick(id) {
            document.getElementById("update").value = id;
            console.log(id);
            return false;
        }
    </script>
</head>
<body>
    <form action="Controller">
        <div class="card">
            <p class="rname" id="rname"><%=restaurantName%></p>
            <p class="rloc" id="rloc"><%=location%></p>
            <!-- Make sure that the button opens the restaurant page for the currect restaurant, the id is openRestaurant, might need to be changed -->
            <%
                request.setAttribute("text", "🍽️ View Restaurant");
                request.setAttribute("isActive", false);
                request.setAttribute("isRed", false);
            %>
            <button type="submit"><jsp:include page="Button.jsp" /></button>
        </div>
        <input type="hidden" name="action" id="update" value="restaurant"/>
        <input type="hidden" name="restaurantName" value="<%=restaurantName%>" />
        <input type="hidden" name="location" value="<%=location%>" />
        <input type="hidden" name="hours" value="<%=hours%>" />
    </form>    
</body>
</html>
