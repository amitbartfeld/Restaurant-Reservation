<%-- Document : UserDetailsPage Created on : Nov 6, 2023, 2:41:52 PM Author : admin --%>

  <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <jsp:useBean id="subPage" class="java.lang.String" scope="request" />
    <jsp:useBean id="user" scope="session" class="model.auth.UserDetails"/>
    <!DOCTYPE html>
    <html>

    <head>
      <link rel="stylesheet" href="./style.css" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <meta charset="utf-8" />
      <title>Restaurant Reservation</title>
      <script>
        function changeClick(id) {
          document.getElementById("update").value = id;
        }
        
        function changeparam(id) {
          document.getElementById("param").value = id;
        }

        $(document).ready(function () {
            $("#newPassword").on('change keydown paste input', function (e) {
                console.log(e.target.value);
                if ($("#newPassword").val() !== $("#repeatPassword").val()) {
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
                if ($("#newPassword").val() !== $("#repeatPassword").val()) {
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

      <!-- Sub Menu -->
      <form action="Controller">
      <jsp:include page="Header.jsp" />
      <jsp:include page="HelloTitle.jsp" />
          <div class="center">
          <div class="editmenu">
        <!-- Password menu item - will be active if subPage == "password" -->

          <button type="submit" onclick="changeClick(this.id);" id="password">
                      <% request.setAttribute("text", "🔑 Change Password" ); request.setAttribute("isActive",
          !subPage.equals("password")); request.setAttribute("isRed", false); request.setAttribute("buttonName", "passwordButton"); %>
            <jsp:include page="Button.jsp" />
          </button>
          <!-- Phone menu item - will be active if subPage == "phone" -->
            <button type="submit" onclick="changeClick(this.id);" id="phone">
            <% request.setAttribute("text", "📞 Change Phone Number" ); request.setAttribute("isActive",
            !subPage.equals("phone")); request.setAttribute("isRed", false); request.setAttribute("buttonName", "phoneButton"); %>
              <jsp:include page="Button.jsp" />
            </button>
            <!-- Email menu item - will be active if subPage == "email" -->
            
              <button type="submit" onclick="changeClick(this.id);" id="email">
                  <% request.setAttribute("text", "✉️ Change Email Address" ); request.setAttribute("isActive",
              !subPage.equals("email")); request.setAttribute("isRed", false); request.setAttribute("buttonName", "emailButton"); %>
                <jsp:include page="Button.jsp" />
              </button>
              <!-- Delete menu item - will be active if subPage == "delete" -->
                <button type="submit" onclick="changeClick(this.id);" id="delete">
                    <% request.setAttribute("text", "🗑️ Delete Account" ); request.setAttribute("isActive",
                !subPage.equals("delete")); request.setAttribute("isRed", true); request.setAttribute("buttonName", "deleteButton"); %>
                  <jsp:include page="Button.jsp" />
                </button>
          </div>
      </div>

      <!-- Change Password -->
      <%
          if (subPage.equals("password")) {
      %>
        <div class="center">
          <div>
            <p class="inputTitle">Type new password:</p>
            <% request.setAttribute("placeholder", "New password" ); request.setAttribute("textFieldName", "newPassword"
              ); request.setAttribute("textFieldType", "password" ); %>
              <jsp:include page="TextField.jsp" />
              <p class="inputTitle">Repeat new password:</p>
              <% request.setAttribute("placeholder", "Repeat password" );
                request.setAttribute("textFieldName", "repeatPassword" );
                request.setAttribute("textFieldType", "password" ); %>
                <jsp:include page="TextField.jsp" />
          </div>
          <div>
            <% request.setAttribute("text", "Change Password" ); request.setAttribute("isActive", false);
              request.setAttribute("isRed", false); %>
              <button type="submit" onclick="changeClick(id);" id="updatePassword">
                <jsp:include page="Button.jsp" />
              </button>
          </div>
        </div>
        <%}%>

      <!-- Change Phone Number -->
      <%if (subPage.equals("phone")) {%>
        <div class="center">
          <div>
            <p>Your phone number is: <b>
                <%=user.phone%>
              </b></p>
            <p class="inputTitle">Type new phone number:</p>
            <% request.setAttribute("placeholder", "Enter a new phone number" );
              request.setAttribute("textFieldName", "newPhone" ); request.setAttribute("textFieldType", "phone" ); %>
              <jsp:include page="TextField.jsp" />
              </div>
              <div>
                <% request.setAttribute("text", "Change Phone Number" ); request.setAttribute("isActive", false); request.setAttribute("isRed", false); %>
                <button type="submit" onclick="changeClick(id);" id="updatePhone">
                  <jsp:include page="Button.jsp" />
                </button>
              </div>
          </div>
        </div>
        <%}%>

      <!-- Change Email -->
        <%if (subPage.equals("email")) {%>
        <div class="center">
          <div>
            <p>Your email address is: <b>
                <%=user.email%>
              </b></p>
            <p class="inputTitle">Type new email address:</p>
            <% request.setAttribute("placeholder", "Enter a new email address" );
              request.setAttribute("textFieldName", "newEmail" ); request.setAttribute("textFieldType", "email" ); %>
              <jsp:include page="TextField.jsp" />
              </div>
              <div>
                <% request.setAttribute("text", "Change Email Address" ); request.setAttribute("isActive", false); request.setAttribute("isRed", false); %>
                <button type="submit" onclick="changeClick(id);" id="updateEmail">
                  <jsp:include page="Button.jsp" />
                </button>
              </div>
          </div>
        </div>
        <%}%>
        
      <!-- Delete Account -->
      <%if (subPage.equals("delete")) {%>
        <div class="center">
          <div>
            <p class="inputTitle">Type your password to confirm deletion:</p>
            <% request.setAttribute("placeholder", "Password" ); request.setAttribute("textFieldName", "password"
              ); request.setAttribute("textFieldType", "password" ); %>
              <jsp:include page="TextField.jsp" />
          </div>
          <div>
            <% request.setAttribute("text", "Delete Account" );
              request.setAttribute("isActive", false); 
              request.setAttribute("textFieldName", "delete");
              request.setAttribute("isRed", true); %>
              <button type="submit" onclick="changeClick(id);" id="deleteAccount">
                <jsp:include page="Button.jsp" />
              </button>
          </div>
        </div>
        <input type="hidden" name="param" id="param" />


        <%}%>
        <input type="hidden" name="action" id="update" />
    </form>

    </body>

    </html>
