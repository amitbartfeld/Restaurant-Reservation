<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="style.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta charset="utf-8" />
  <title>Restaurant Reservation</title>
  <script>
    function changeClick(id) {
      document.getElementById("update").value = id;
    }
  </script>
</head>

<body>
  <form action="Controller">
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
            <button type="submit" onclick="changeClick(this.id);" id="login">
              <div class="overlap-group">
                <img class="img" src="img/person.svg" />
                <div class="text-wrapper">Login</div>
              </div>
            </button>
          </div>
          <div class="button">
            <button type="submit" onclick="changeClick(this.id);" id="signup">
              <div class="overlap">
                <img class="person-add-alt" src="img/person-add-alt-1.svg" />
                <div class="text-wrapper">Signup</div>
              </div>
            </button>
          </div>
          <div class="overlap-wrapper">
            <button type="submit" onclick="changeClick(this.id);" id="restaurantsignup">
              <div class="overlap-2">
                <div class="text-wrapper">Signup as Restaurant</div>
                <img class="img" src="img/restaurant.svg" />
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <input type="hidden" name="action" id="update" />
  </form>
</body>

</html>