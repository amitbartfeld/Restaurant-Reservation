<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <jsp:useBean id="message" class="java.lang.String" scope="request" />

    <!DOCTYPE html>
    <html>

    <head>
        <link rel="stylesheet" href="./style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="utf-8" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <title>Restaurant Reservation | Signup | Restaurant</title>
        <script>
                        <%
                if (!message.isEmpty()) {
            %>
                alert("<%=message%>");
                <%}%>
            function changeClick(id) {
                document.getElementById("update").value = id;
            }

            $(document).ready(function () {
            $("#password").on('change keydown paste input', function (e) {
                console.log(e.target.value);
                if ($("#password").val() !== $("#repeatPassword").val()) {
                    console.log("Passwords do not match");
                    $("#repeatPassword").css("border-color", "red");
                    $("#restaurantsignup").prop("disabled", true);
                }
                else{
                    $("#repeatPassword").css("border-color", "black");
                    $("#restaurantsignup").prop("disabled", false);
                }
            });
            $("#repeatPassword").on('change keydown paste input', function (e) {
                console.log(e.target.value);
                if ($("#password").val() !== $("#repeatPassword").val()) {
                    console.log("Passwords do not match");
                    $("#repeatPassword").css("border-color", "red");
                    $("#restaurantsignup").prop("disabled", true);
                }
                else{
                    $("#repeatPassword").css("border-color", "black");
                    $("#restaurantsignup").prop("disabled", false);
                }
            });
            jQuery(document).on('focus click', 'input',  function(e){
                    if ($("#username").val() === "" || $("#phone").val() === "" || $("#email").val() === "" || $("#password").val() === "") {
                        $("#restaurantsignup").prop("disabled", true);
                    }
                    else{
                        $("#restaurantsignup").prop("disabled", false);
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
                        <h1 style="text-align: center;">Signup as Restaurant</h1>
                        <div class="space"></div>
                        <p class="inputTitle">Restaurant Name:</p>
                        <% request.setAttribute("placeholder", "Restaurant Name" );
                            request.setAttribute("textFieldName", "restaurantName" );
                            request.setAttribute("textFieldType", "name" ); %>
                            <jsp:include page="TextField.jsp" />    

                            <p class="inputTitle">Restaurant Location:</p>
                            <% request.setAttribute("placeholder", "Restaurant Location" );
                                request.setAttribute("textFieldName", "location" );
                                request.setAttribute("textFieldType", "text" ); %>
                                <jsp:include page="TextField.jsp" /> 
                                
                                <!-- Opening Hours -->
                            <p class="inputTitle">Opening Hours:</p>
                            <div class="inline">
                                <p class="day">Sunday:</p>
                                <% request.setAttribute("textFieldName", "sundayO" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" />  
                                <p>-</p>
                                <% request.setAttribute("textFieldName", "sundayC" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" /> 
                            </div>
                            <div class="inline">
                                <p class="day">Monday:</p>
                                <% request.setAttribute("textFieldName", "mondayO" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" />  
                                <p>-</p>
                                <% request.setAttribute("textFieldName", "mondayC" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" /> 
                            </div>
                            <div class="inline">
                                <p class="day">Tuesday:</p>
                                <% request.setAttribute("textFieldName", "tuesdayO" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" />  
                                <p>-</p>
                                <% request.setAttribute("textFieldName", "tuesdayC" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" /> 
                            </div>
                            <div class="inline">
                                <p class="day">Wednesday:</p>
                                <% request.setAttribute("textFieldName", "wednesdayO" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" />  
                                <p>-</p>
                                <% request.setAttribute("textFieldName", "wednesdayC" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" /> 
                            </div>
                            <div class="inline">
                                <p class="day">Thursday:</p>
                                <% request.setAttribute("textFieldName", "thursdayO" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" />  
                                <p>-</p>
                                <% request.setAttribute("textFieldName", "thursdayC" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" /> 
                            </div>
                            <div class="inline">
                                <p class="day">Friday:</p>
                                <% request.setAttribute("textFieldName", "fridayO" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" />  
                                <p>-</p>
                                <% request.setAttribute("textFieldName", "fridayC" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" /> 
                            </div>
                            <div class="inline">
                                <p class="day">Saturday:</p>
                                <% request.setAttribute("textFieldName", "saturdayO" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" />  
                                <p>-</p>
                                <% request.setAttribute("textFieldName", "saturdayC" ); %>
                                <jsp:include page="TimeFieldForRestaurant.jsp" /> 
                            </div>


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
                                        <button type="submit" onclick="changeClick(this.id);" id="restaurantsignup" disabled="true">
                                            <jsp:include page="Button.jsp" />
                                        </button>
                                </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="action" id="update" />
        </form>
    </body>