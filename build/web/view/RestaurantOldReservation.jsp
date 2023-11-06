<%@page import="model.auth.DatabaseClientCreator"%>
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
                <jsp:getProperty name="reservation" property="clientUserName" />
            </p>
            <p class="rloc" id="rloc">
                <jsp:getProperty name="reservation" property="numOfPeople" /> people
            </p>
        <p class="rloc" id="rloc">
            <%=new DatabaseClientCreator().create(reservation.getClientUserName()).getDetails().email%> • <%=new DatabaseClientCreator().create(reservation.getClientUserName()).getDetails().phone%> 
    </p>
        </div>
    </body>

    </html>