<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <link rel="stylesheet" href="./style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="utf-8" />
        <title>Restaurant Reservation</title>
        <script>
            function changeClick(id) {
                document.getElementById("update").value = id;
            }
        </script>
    </head>

    <body>
        <form action="Controller">
            <div class="home-page-logged-out">
                <div class="center">
                    <div class="center">
                        <div class="logo">
                            <img class="food-bank" src="img/food-bank.svg" />
                            <div class="title">Restaurant Reservation</div>
                        </div>
                    </div>
                    <div>
                        <h1 style="text-align: center;">Login</h1>
                        <div class="space"></div>
                        <p class="inputTitle">Username:</p>
                        <% request.setAttribute("placeholder", "Username" );
                            request.setAttribute("textFieldName", "username" );
                            request.setAttribute("textFieldType", "name" ); %>
                            <jsp:include page="TextField.jsp" />

                            <p class="inputTitle">Password:</p>
                            <% request.setAttribute("placeholder", "Password" );
                                request.setAttribute("textFieldName", "password" );
                                request.setAttribute("textFieldType", "password" ); %>
                                <jsp:include page="TextField.jsp" />
                                <div>
                                    <% request.setAttribute("text", "Login" ); request.setAttribute("isActive", false);
                                        request.setAttribute("isRed", false); %>
                                        <button type="submit" onclick="changeClick(this.id);" id="login">
                                            <jsp:include page="Button.jsp" />
                                        </button>
                                </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="action" id="update" />
        </form>
    </body>