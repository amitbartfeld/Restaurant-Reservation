<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="style.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta charset="utf-8" />
  <title>Restaurant Reservation</title>
</head>

<body>
  <div class="home-page-logged-out">
    <div class="div">
      <div class="center">
        <div class="logo">
          <img class="food-bank" src="img/food-bank.svg" />
          <div class="title">Restaurant Reservation</div>
        </div>
      </div>
      <div class="center">
        <div class="buttons-grid">
          <div class="button">
            <!-- \/ SWITCH TO LOGIN URL \/ -->
            <a href="LoginPage.jsp">
              <div class="overlap-group">
                <img class="img" src="img/person.svg" />
                <div class="text-wrapper">Login</div>
              </div>
            </a>
          </div>
          <div class="button">
            <!-- \/ SWITCH TO SIGNUP URL \/ -->
            <a href="Signup.jsp">
              <div class="overlap">
                <img class="person-add-alt" src="img/person-add-alt-1.svg" />
                <div class="text-wrapper">Signup</div>
              </div>
            </a>
          </div>
          <div class="overlap-wrapper">
            <!-- \/ SWITCH TO BROWSE/HOME URL \/ -->
            <a href="Home.jsp">
              <div class="overlap-2">
                <div class="text-wrapper">Browse Restaurants</div>
                <img class="img" src="img/restaurant.svg" />
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>