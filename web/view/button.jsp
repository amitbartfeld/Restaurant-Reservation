<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="text" class="java.lang.String" scope="request" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <div class="buttonStyle">
        <p class="buttonText"><%=text%></p>
    </div>
</body>
</html>