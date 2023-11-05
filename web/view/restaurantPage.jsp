<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
    <!-- Change the title to Restaurant Name -->
    <title>Restaurant Name</title>
    <script>
        function changeClick(id) {
            document.getElementById("update").value = id;
        }
    </script>
</head>

<body class="page">
    <jsp:include page="header.jsp" />
    <jsp:include page="helloTitle.jsp" />
    <form action="Controller">
        <!-- Change the button's text to "Go to Homepage" as written on the text prop -->
        <button type="submit" onclick="changeClick(id)" id="homepage">
            <%request.setAttribute("text", "Back to Homepage");%>
            <jsp:include page="button.jsp" />
        </button>
        <input type="hidden" name="action" id="update" />
    </form>
    <!-- Change the Restaurant Name to the name of the restaurant -->
    <p class="rname" id="rname">Restaurant Name</p>
    <!-- Change the Location to the location of the restaurant -->
    <p class="rloc" id="rloc">-- Location --</p>
    <!-- Change the Hours to the hours of the restaurant -->
    <p class="rday" id="days">Sunday: <span class="rhour">00:00-00:00</span>
        <br>Monday: <span class="rhour">00:00-00:00</span>
        <br>Tuesday: <span class="rhour">00:00-00:00</span>
        <br>Wednesday: <span class="rhour">00:00-00:00</span>
        <br>Thursday: <span class="rhour">00:00-00:00</span>
        <br>Friday: <span class="rhour">00:00-00:00</span>
        <br>Saturday: <span class="rhour">00:00-00:00</span>
    </p>
    <div class="center">
        <div class="formcard">

        </div>
    </div>
</body>

</html>