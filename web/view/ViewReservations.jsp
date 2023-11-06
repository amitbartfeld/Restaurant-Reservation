<%@page import="java.util.LinkedList"%>
<%@page import="model.Constants"%>
<%@page import="model.DatabaseOperationsSingleton"%>
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
            $(document).ready(function(){
                $("#search").prop("disabled", true);
                $("#search").prop("placeholder", "To search for a Reservation use ctrl+f...");
            });
            </script>
    </head>

    <body>
        <form action='Controller'>
        <jsp:include page="Header.jsp" />
        <jsp:include page="HelloTitle.jsp" />
        <jsp:include page="SearchBar.jsp" />
        <div class="RestaurantContainer">
            <p>Last Reservations:</p>
            <div></div>
            <div class="grid">
                <%
                    if ((boolean)request.getSession().getAttribute("isClient")) {
                        DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.reservationTable);
                        LinkedList<Object[]> rows = databaseOperations.getAllRows();
                        for (Object[] row : rows) {
                            Reservation r = new Reservation(Long.parseLong(row[0].toString()), row[1].toString(), row[4].toString(), Integer.parseInt(row[2].toString()), Long.parseLong(row[5].toString()), Boolean.parseBoolean(row[3].toString()));
                            if (r.isRelevant() && r.getClientUserName().equals(user.username)) {
                                request.setAttribute("reservation", r);
                                %>
                                   <jsp:include page="ClientReservationView.jsp" />
                                <%
                            }
                        }
                    } else {
                        DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.reservationTable);
                        LinkedList<Object[]> rows = databaseOperations.getAllRows();
                        for (Object[] row : rows) {
                            Reservation r = new Reservation(Long.parseLong(row[0].toString()), row[1].toString(), row[4].toString(), Integer.parseInt(row[2].toString()), Long.parseLong(row[5].toString()), Boolean.parseBoolean(row[3].toString()));
                            if (!r.isRelevant() && r.getClientUserName().equals(user.username)) {
                                request.setAttribute("reservation", r);
                                %>
                                   <jsp:include page="ClientOldReservationView.jsp" />
                                <%
                            }
                        }
                    %>
            </div>
            <p>Reservations History:</p>
            <div></div>
            <div class="grid">
                <!-- add old reservations here -->
                <%
                    if ((boolean)request.getSession().getAttribute("isClient")) {
                        databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.reservationTable);
                        rows = databaseOperations.getAllRows();
                        for (Object[] row : rows) {
                            Reservation r = new Reservation(Long.parseLong(row[0].toString()), row[1].toString(), row[4].toString(), Integer.parseInt(row[2].toString()), Long.parseLong(row[5].toString()), Boolean.parseBoolean(row[3].toString()));
                            if (r.isRelevant() && r.getRestaurantUserName().equals(user.username)) {
                                request.setAttribute("reservation", r);
                                %>
                                   <jsp:include page="RestaurantReservationView.jsp" />
                                <%
                            }
                        }
                    } else {
                        databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.reservationTable);
                        rows = databaseOperations.getAllRows();
                        for (Object[] row : rows) {
                            Reservation r = new Reservation(Long.parseLong(row[0].toString()), row[1].toString(), row[4].toString(), Integer.parseInt(row[2].toString()), Long.parseLong(row[5].toString()), Boolean.parseBoolean(row[3].toString()));
                            if (!r.isRelevant() && r.getRestaurantUserName().equals(user.username)) {
                                request.setAttribute("reservation", r);
                                %>
                                   <jsp:include page="RestaurantOldReservationView.jsp" />
                                <%
                            }
                        }
                    %>
            </div>
        </div>
            <input type="hidden" name="action" id="update" />
            <input type="hidden" name="res" id="res"/>
        </form>
    </body>

    </html>