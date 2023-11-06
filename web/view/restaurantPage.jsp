<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="restaurantName" class="java.lang.String" scope="request" />
<jsp:useBean id="location" class="java.lang.String" scope="request" />
<jsp:useBean id="hours" class="model.OpeningHours" scope="request" />
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
    <jsp:include page="Header.jsp" />
    <jsp:include page="HelloTitle.jsp" />
    <form action="Controller">
        <!-- Change the button's text to "Go to Homepage" as written on the text prop -->
        <button type="submit" onclick="changeClick(id)" id="homepage">
            <%request.setAttribute("text", "Back to Homepage");%>
            <jsp:include page="Button.jsp" />
        </button>
        <input type="hidden" name="action" id="update" />
    </form>
    <!-- Change the Restaurant Name to the name of the restaurant -->
    <p class="rname" id="rname"><%=restaurantName%></p>
    <!-- Change the Location to the location of the restaurant -->
    <p class="rloc" id="rloc"><%=location%></p>
    <!-- Change the Hours to the hours of the restaurant -->
    <p class="rday" id="days">Sunday: <span class="rhour"><%=hours.getStartingHours()[0]%>:00-<%=hours.getEndingHours()[0]%>:00</span>
        <br>Monday: <span class="rhour"><%=hours.getStartingHours()[1]%>:00-<%=hours.getEndingHours()[1]%>:00</span>
        <br>Tuesday: <span class="rhour"><%=hours.getStartingHours()[2]%>:00-<%=hours.getEndingHours()[2]%>:00</span>
        <br>Wednesday: <span class="rhour"><%=hours.getStartingHours()[3]%>:00-<%=hours.getEndingHours()[3]%>:00</span>
        <br>Thursday: <span class="rhour"><%=hours.getStartingHours()[4]%>:00-<%=hours.getEndingHours()[4]%>:00</span>
        <br>Friday: <span class="rhour"><%=hours.getStartingHours()[5]%>:00-<%=hours.getEndingHours()[5]%>:00</span>
        <br>Saturday: <span class="rhour"><%=hours.getStartingHours()[6]%>:00-<%=hours.getEndingHours()[6]%>:00</span>
    </p>
    <div class="center">
        <div class="formcard">
            <form action="Controller">
                <jsp:include page="DateField.jsp" />
                <jsp:include page="TimeField.jsp" />
                <!-- \/ Make sure the input in this text box is set to numbers only! \/ -->
                <jsp:include page="TextField.jsp" />
                <button type="submit" onclick="changeClick(id)" id="book">
                    <%request.setAttribute("text", "✅ Book a place");%>
                    <jsp:include page="Button.jsp" />
                </button>
                <input type="hidden" name="action" id="update" />
            </form>
        </div>
    </div>
</body>

</html>