<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="text" class="java.lang.String" scope="request" />
<jsp:useBean id="isActive" class="java.lang.Boolean" scope="request" />
<jsp:useBean id="isRed" class="java.lang.Boolean" scope="request" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
    <script>
        var isRed = <%=isRed%>;
        var isActive = <%=isActive%>;
        $(document).ready(function(){
            if(isActive){
                $(#b).addClass("disabledButton");
            }
            if(isRed){
                $(#b).addClass("redButton");
            }
        })
    </script>
</head>
<body>
    <div class="buttonStyle" id="b">
        <p class="buttonText"><%=text%></p>
    </div>
</body>
</html>