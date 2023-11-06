<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <jsp:useBean id="reservation" class="model.Reservation" scope="request" />
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./style.css">
    </head>

    <body>
        <div class="card">
            <p class="rname" id="rname">
                <jsp:getProperty name="reservation" property="reservationDate" /> •
                <jsp:getProperty name="reservation" property="reservationTime" />
            </p>
            <p class="rloc" id="rloc">
                <jsp:getProperty name="reservation" property="restaurantName" />
            </p>
            <p class="rloc" id="rloc">
                <jsp:getProperty name="reservation" property="numOfPeople" /> people
            </p>
            <%request.setAttribute("text", "📞 Ask to cancel" );%>
                <!-- Make the button click call the resturant (you can use "tel:") -->
                <form action="tel:<jsp:getProperty name=" reservation" property="restaurantPhone" />">
                <button type="submit">
                    <jsp:include page="Button.jsp" />
                </button>
                </form>
        </div>
    </body>

    </html>