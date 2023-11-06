<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="./style.css">
    <script>
        var input = document.getElementById("search");
        input.addEventListener("keydown", function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                $("#ac").click();
                
            }
            
        });
    </script>
</head>
<body>
    <div class="center">
        <div class="searchcontainer">
            <input type="text" name="search" id="search" placeholder="Search for a restaurant or location..." class="searchbar"/>
        </div>
    </div>
</body>
</html>