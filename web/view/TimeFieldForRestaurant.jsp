<%-- Document : TimeField Created on : Nov 6, 2023, 12:05:45 PM Author : admin --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <jsp:useBean id="textFieldName" class="java.lang.String" scope="request" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="./style.css">

        </head>

        <body>
            <input type="time" name="<%=textFieldName%>" id="<%=textFieldName%>" step="3600" />
        </body>

        </html>