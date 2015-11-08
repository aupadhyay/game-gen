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
          <button type="button" class="theme" data-toggle="collapse" data-target="#bb-collapse" onclick="setDivVisible('brick');">Brick Breaker</button>
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
          <button type="button" class="theme" data-toggle="collapse" data-target="#fb-collapse" onclick="setDivVisible('flappy');">Flappy Bird</button>
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
        <div class="rt-container">
          <div class="rt-container-brick" name="rt-container-brick" id="rt-container" style="visibility:hidden;">
            <img id="PaddleImage" class=  "rt-object" src="none.png" width="88" height="14" style="margin-left: 36px; margin-top: 393px ;">
            <img id="BallImage" src="none.png" width="20" height="20">
          </div>
           <div class="rt-container-flappy" name="rt-container-flappy" id="rt-container" style="visibility:hidden;">
            <img id="PaddleImage" class=  "rt-object" src="none.png" width="88" height="14" style="margin-left: 36px; margin-top: 393px ;">
            <img id="BallImage" src="none.png" width="20" height="20">
          </div>
           <div class="rt-container-cd" name="rt-container-cd" id="rt-container" style="visibility:hidden;">
            <img id="PaddleImage" class=  "rt-object" src="none.png" width="88" height="14" style="margin-left: 36px; margin-top: 393px ;">
            <img id="BallImage" src="none.png" width="20" height="20">
          </div>
        </div>
    </div>
    
    <script src="js/autoHTML.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
      function setDivVisible (selector) {
        $('rt-container-' + selector).attr('style', 'visibility:visible;'); 
      }
    }
    </script>

  </body>
</html>