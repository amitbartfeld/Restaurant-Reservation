<%-- 
    Document   : RestaurantCard
    Created on : Nov 5, 2023, 7:28:31 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script>
        function changeClick(id) {
            document.getElementById("update").value = id;
        }
    </script>
</head>
<body>
    <form action="Controller">
        <div class="card">
            <p class="rname" id="rname">Restaurant Name</p>
            <p class="rloc" id="rloc">-- Location --</p>
            <!-- Make sure that the button opens the restaurant page for the currect restaurant, the id is openRestaurant, might need to be changed -->
            <%request.setAttribute("text", "🍽️ View Restaurant");%>
            <button type="submit" onclick="changeClick(id)" id="openRestaurant"><jsp:include page="button.jsp" /></button>
        </div>
  <input type="hidden" name="action" id="update" />
    </form>    
</body>
</html>
