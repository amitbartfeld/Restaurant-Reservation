<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <link rel="stylesheet" href="./style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="utf-8" />
        <title>Restaurant Reservation | Signup</title>
        <script>
            function changeClick(id) {
                document.getElementById("update").value = id;
            }

            $(document).ready(function () {
            $("#password").on('change keydown paste input', function (e) {
                console.log(e.target.value);
                if ($("#password").val() !== $("#repeatPassword").val()) {
                    console.log("Passwords do not match");
                    $("#repeatPassword").css("border-color", "red");
                    $("#updatePassword").prop("disabled", true);
                }
                else{
                    $("#repeatPassword").css("border-color", "black");
                    $("#updatePassword").prop("disabled", false);
                }
            });
            $("#repeatPassword").on('change keydown paste input', function (e) {
                console.log(e.target.value);
                if ($("#password").val() !== $("#repeatPassword").val()) {
                    console.log("Passwords do not match");
                    $("#repeatPassword").css("border-color", "red");
                    $("#updatePassword").prop("disabled", true);
                }
                else{
                    $("#repeatPassword").css("border-color", "black");
                    $("#updatePassword").prop("disabled", false);
                }
            });
        });

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
                            
                            <p class="inputTitle">Phone Number:</p>
                            <% request.setAttribute("placeholder", "Phone Number" );
                                request.setAttribute("textFieldName", "phone" );
                                request.setAttribute("textFieldType", "phone" ); %>
                                <jsp:include page="TextField.jsp" />       
                                
                            <p class="inputTitle">Email Address:</p>
                            <% request.setAttribute("placeholder", "Email Address" );
                                request.setAttribute("textFieldName", "email" );
                                request.setAttribute("textFieldType", "email" ); %>
                                <jsp:include page="TextField.jsp" />

                            <p class="inputTitle">Password:</p>
                            <% request.setAttribute("placeholder", "Password" );
                                request.setAttribute("textFieldName", "password" );
                                request.setAttribute("textFieldType", "password" ); %>
                                <jsp:include page="TextField.jsp" />

                                <p class="inputTitle">Repeat password:</p>
                                <% request.setAttribute("placeholder", "Repeat password" );
                                  request.setAttribute("textFieldName", "repeatPassword" );
                                  request.setAttribute("textFieldType", "password" ); %>
                                  <jsp:include page="TextField.jsp" />

                                <div class="center">
                                    <% request.setAttribute("text", "Signup" ); request.setAttribute("isActive", false);
                                        request.setAttribute("isRed", false); %>
                                        <button type="submit" onclick="changeClick(this.id);" id="signup">
                                            <jsp:include page="Button.jsp" />
                                        </button>
                                </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="action" id="update" />
        </form>
    </body>