<%@page import="model.Reservation" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Restaurant Reservation | Home</title>
        <link rel="stylesheet" href="./style.css">
    </head>

    <body>
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
    </body>

    </html>