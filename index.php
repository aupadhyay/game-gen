<?php
session_start();
?>

<html>
  <head>
    <title>Game Gen</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      
      <script src="js/realtime.js"></script>

  </head> 

<body>
    <div class="main">
      <h2>Setup</h2>
        <div class="bb">
          <button type="button" class="theme" data-toggle="collapse" data-target="#bb-collapse">Brick Breaker</button>
          <div id="bb-collapse" class="collapse out">
            <form class="form-setup" id="form" action="process.php" method="POST" enctype="multipart/form-data">
              <div class="bb-form" id="bb-form">
               <!-- Added Stuff from Javascript !-->
              </div>
              <input type="submit">
            </form>
          </div>
        </div>


        <div class="fb">
          <button type="button" class="theme" data-toggle="collapse" data-target="#fb-collapse">Flappy Bird</button>
          <div id="fb-collapse" class="collapse out">
            <form class="form-setup" id="form" action="process.php" method="POST" enctype="multipart/form-data">
              <div class="fb-form" id="fb-form">
               <!-- Added Stuff from Javascript !-->
              </div>
              <input type="submit">
            </form>
          </div>
        </div>
    </div>

    <div class="main">
      <h2>Realtime</h2>
        <div class="rt-container" id="rt-container">
          <img id="PaddleImage" class=  "rt-object" src="none.png" width="88" height="14" style="margin-left: 36px; margin-top: 393px ;">
          <img id="BallImage" src="none.png" width="20" height="20">
        </div>
    </div>
    
    <script src="js/autoHTML.js"></script>

  </body>
</html>