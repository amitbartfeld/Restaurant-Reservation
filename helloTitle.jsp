<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="style.css">
    <script>
        var isClient = true; //change this variable to false if logged in as restaurant
        var username = "changeme"; //change this variable to the current user
        $(document).ready(function(){
            if (isClient){
                $("#details").addClass("hidden");
            }
            $(".name").html(username);
        })
    </script>
</head>
<body>
    <p class="helloTitle">Hello <span class="name">User</span>! <a href="editRestaurant.jsp"><img id="details" src="img/edit.svg" /></a></p>
    
</body>
</html>