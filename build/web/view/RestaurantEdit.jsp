<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <link rel="stylesheet" href="./style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="utf-8" />
        <title>Restaurant Reservation | Update</title>
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
                    <form action="Controller">
                        <div class="center">
                        <!-- Change the button's text to "Go to Homepage" as written on the text prop -->
                        <button type="submit" onclick="changeClick(id)" id="homepage">
                            <%
                                request.setAttribute("text", "Back to Homepage");
                                request.setAttribute("isActive", false);
                                request.setAttribute("isRed", false);
                            %>
                            <jsp:include page="Button.jsp" />
                        </button>
                        </div>
                    <div>
                        <h1 style="text-align: center;">Update Restaurant Page</h1>
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

                                <div class="center">
                                    <% request.setAttribute("text", "Update Restaurant" ); request.setAttribute("isActive", false);
                                        request.setAttribute("isRed", false); %>
                                        <button type="submit" onclick="changeClick(this.id);" id="update">
                                            <jsp:include page="Button.jsp" />
                                        </button>
                                </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="action" id="update" />
        </form>
    </body>