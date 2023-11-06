<%-- 
    Document   : UserDetailsPage
    Created on : Nov 6, 2023, 2:41:52 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="subPage" class="java.lang.String" scope="request" />
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
    <jsp:include page="Header.jsp" />
    <jsp:include page="HelloTitle.jsp" />
    <%
        request.setAttribute("text", "🔑 Change Password");
        request.setAttribute("isActive", false);
        request.setAttribute("isRed", false);
    %>
    <jsp:include page="Button.jsp" />
    </body>
</html>
