<%-- 
    Document   : textField
    Created on : Nov 5, 2023, 9:29:45 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="placeholder" class="java.lang.String" scope="request" />
<jsp:useBean id="textFieldType" class="java.lang.String" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <input class="text" type="<%=textFieldType%>" placeholder="<%=placeholder%>"/>
    </body>
</html>
