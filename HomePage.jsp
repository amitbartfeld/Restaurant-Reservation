<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Reservation | Home</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <jsp:include page="header.jsp" />
    <jsp:include page="helloTitle.jsp" />
    <form action="Controller.java">
        <jsp:include page="searchBar.jsp" />
  <input type="hidden" name="action" id="update" />
    </form>
    <div class="center">
        <div class="RestaurantContainer">
            <p>Featured Restaurants:</p>
            <!-- Switch this line with a grid of RestaurantCards -->
            <jsp:include page="RestaurantCard.jsp" />
        </div>
    </div>
</body>

</html>