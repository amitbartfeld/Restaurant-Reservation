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
            <!-- Change the button's text to "🍽️ View Restaurant" as written on the text prop -->
            <!-- Make sure that the button opens the restaurant page for the currect restaurant, the id is openRestaurant, might need to be changed -->
            <button type="submit" onclick="changeClick(id)" id="openRestaurant"><jsp:include page="button.jsp" text="🍽️ View Restaurant" /></button>
        </div>
  <input type="hidden" name="action" id="update" />
    </form>    
</body>
</html>