<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>

        var page = "changeme"; //change this variable to the current page
        var isClient = true; //change this variable to false if logged in as restaurant

        $(document).ready(function(){
            if (!isClient){
                $("#home").addClass("hidden");
            }
            if (page == "home") {
                $("#home").addClass("active");
            }
            if (page == "res") {
                $("#reservation").addClass("active");
            }
            if (page == "edit") {
                $("#edit").addClass("active");
            }
        })
    </script>
</head>
<body style="margin: 0; padding: 0;">
    <div class="header-frame">
        <div class="head-layout">
            <div class="logo">
                <img class="food-bank" src="img/Food-bank.svg" />
                <div class="title">Restaurant Reservation</div>
            </div>
            <div class="nevigation">
                <span id="home">
                    <a> Home </a>  •
                </span>
                <span id="reservation">
                    View Reservations  •  
                </span>
                <span id="edit">
                    Edit Profile  •
                </span>
                <span style="color: rgba(189, 44, 44, 1);">
                    Logout
                </span>
            </div>
        </div>
    </div>
</body>

</html>