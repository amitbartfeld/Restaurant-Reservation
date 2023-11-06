<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Reservation | Home</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <form action="Controller">
        <div class="card">
            <p class="rname" id="rname"><%=date%> • <%=time%></p>
            <p class="rloc" id="rloc"><%=restaurantName%></p>
            <p class="rloc" id="rloc"><%=number%> people</p>
            <%request.setAttribute("text", "📞 Ask to cancel");%>
            <!-- Make the button click call the resturant (you can use "tel:") -->
            <button type="submit" onclick="changeClick(id)" id="openRestaurant"><jsp:include page="Button.jsp" /></button>
        </div>
  <input type="hidden" name="action" id="update" />
    </form>    
</body>

</html>