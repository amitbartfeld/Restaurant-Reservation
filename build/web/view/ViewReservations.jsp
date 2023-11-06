<%@page import="model.Reservation" %>
<jsp:useBean id="user" scope="session" class="model.auth.UserDetails"/>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Reservation | Home</title>
        <link rel="stylesheet" href="./style.css">
        <script>
            function changeClick(id) {
                document.getElementById("update").value = id;
            }
        </script>
    </head>

    <body>
        <form action='Controller'>
        <jsp:include page="Header.jsp" />
        <jsp:include page="HelloTitle.jsp" />
        <div class="RestaurantContainer">
            <p>Last Reservations:</p>
            <div></div>
            <div class="grid">
                <% request.setAttribute("reservation", new Reservation("abc", 12, 1234567654, true)); %>
                    <jsp:include page="ClientReservationView.jsp" />
            </div>
            <p>Reservations History:</p>
            <div></div>
            <div class="grid">
                <!-- add old reservations here -->
                <jsp:include page="OldClientReservationView.jsp" />
            </div>
        </div>
            <input type="hidden" name="action" id="update" />
        </form>
    </body>

    </html>