<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="style.css">
    <script>
        var isClient = true; //change this variable to false if logged in as restaurant
        $(document).ready(function(){
            if (!isClient){
                $("#search").prop("disabled", true);
                $("#search").prop("placeholder", "To search for a Reservation use ctrl+f...");
            }
        })
    </script>
</head>
<body>
    <div class="center">
        <div class="searchcontainer">
            <input type="text" id="search" placeholder="Search for a restaurant or location..." autocomplete="off" class="searchbar"/>
        </div>
    </div>
</body>
</html>