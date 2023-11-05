<%-- 
    Document   : textField
    Created on : Nov 5, 2023, 9:29:45 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="placeHolder" class="java.lang.String" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <input type="text" placeholder="<%=placeHolder%>"/>
    </body>
</html>
