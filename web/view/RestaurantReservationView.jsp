<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <jsp:useBean id="reservation" class="model.Reservation" scope="request" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./style.css">
        <script>
            function changeClick(id) {
                document.getElementById("update").value = id;
            }
        </script>
    </head>

    <body>
        <div class="card">
            <p class="rname" id="rname">
                <jsp:getProperty name="reservation" property="reservationDate" /> •
                <jsp:getProperty name="reservation" property="reservationTime" />
            </p>
            <p class="rloc" id="rloc">
                <jsp:getProperty name="reservation" property="userName" />
            </p>
            <p class="rloc" id="rloc">
                <jsp:getProperty name="reservation" property="numOfPeople" /> people
            </p>
            <form action="Controller" />">
            <%request.setAttribute("text", "🗑️ Cancel" );%>
                <!-- Cancel the reservation (move to history) -->
                <button type="submit" onclick="changeClick(id)" id="cancel">
                    <jsp:include page="Button.jsp" />
                </button>
                <input type="hidden" name="action" id="update" />

                </form>
        </div>
    </body>

    </html>