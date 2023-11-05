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
    <form action="Controller.java">
        <div class="card">
            <p class="rname" id="rname">Restaurant Name</p>
            <p class="rloc" id="rloc">-- Location --</p>
            <!-- Change the button's text to "🍽️ View Restaurant" as written on the text prop -->
            <button type="submit" onclick="changeClick(id)" id="name"><jsp:include page="button.jsp" text="🍽️ View Restaurant" /></button>
        </div>
  <input type="hidden" name="action" id="update" />
    </form>    
</body>
</html>