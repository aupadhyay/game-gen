<?php
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
          <button type="button" class="btn btn-danger" id="theme1" data-toggle="collapse" data-target="#bb-collapse" onclick="setBrickVisible()">Brick Breaker</button>
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
          <button type="button" class="btn btn-danger" id="theme2" data-toggle="collapse" data-target="#fb-collapse" onclick="setFlappyVisible()">Flappy Bird</button>
          <div id="fb-collapse" class="collapse out">
            <form class="form-setup" id="formFB" action="processFlappy.php" method="POST" enctype="multipart/form-data">
              <div class="fb-form" id="fb-form">
               <!-- Added Stuff from Javascript !-->
              </div>
              <input type="submit">
            </form>
          </div>
        </div>

        <div class="cd">
          <button type="button" class="btn btn-danger" id="theme3" data-toggle="collapse" data-target="#cd-collapse" onclick="setCDVisible()">Fall N' Tap</button>
          <div id="cd-collapse" class="collapse out">
            <form class="form-setup" id="formCD" action="processCD.php" method="POST" enctype="multipart/form-data">
              <div class="cd-form" id="cd-form">
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
          <div class="rt-container-brick" name="rt-container-brick" id="rt-container-brick" style="visibility:hidden;">
            <img id="BackgroundImage" class="rt-object" src="none.png" width="320" height="480" style="margin-left: 0px; margin-top: 0px;">
            <img id="PaddleImage" class="rt-object" src="none.png" width="60" height="12" style="margin-left: 130px; margin-top: 424px;">
            <img id="BallImage" class="rt-object" src="none.png" width="12" height="12" style="margin-left: 155px; margin-top: 409px;">
            <img id="BrickImage" class="rt-object" src="none.png" width="33" height="18" style="margin-left: 144px; margin-top: 231px;">
            <img id="PauseButtonImage" class="rt-object" src="none.png" width="20" height="20" style="margin-left: 280px; margin-top: 20px;">
          </div>
           <div class="rt-container-flappy" name="rt-container-flappy" id="rt-container-flappy" style="visibility:hidden;">
            <img id="BackgroundFImage" class="rt-object" src="none.png" width="320" height="480" style="margin-left: 0px; margin-top: 0px;">
            <img id="BirdImage" class="rt-object" src="none.png" width="40" height="40" style="margin-left: 30px; margin-top: 220px;">
            <img id="TopPipesImage" class="rt-object" src="none.png" width="60" height="150" style="margin-left: 200px; margin-top: 0px;">
            <img id="BottomPipesImage" class="rt-object" src="none.png" width="60" height="180" style="margin-left: 200px; margin-top: 250px;">
            <img id="GroundImage" class="rt-object" src="none.png" width="320" height="50" style="margin-left: 0px; margin-top: 430px;">
          </div>
           <div class="rt-container-cd" name="rt-container-cd" id="rt-container-cd" style="visibility:hidden;">
            <img id="BGImage" class="rt-object" src="none.png" width="320" height="480" style="margin-left: 0px; margin-top: 0px;">
            <img id="Pause-ButtonImage" class="rt-object" src="none.png" width="20" height="20" style="margin-left: 280px; margin-top: 20px;">
            <img id="Enemy1Image" class="rt-object" src="none.png" width="50" height="50" style="margin-left: 35px; margin-top: 60px;">
            <img id="Enemy2Image" class="rt-object" src="none.png" width="50" height="50" style="margin-left: 235px; margin-top: 60px;">
            <img id="Man1Image" class="rt-object" src="none.png" width="40" height="80" style="margin-left: 30px; margin-top: 360px;">
            <img id="Man2Image" class="rt-object" src="none.png" width="40" height="80" style="margin-left: 140px; margin-top: 360px;">
            <img id="Man3Image" class="rt-object" src="none.png" width="40" height="80" style="margin-left: 250px; margin-top: 360px;">
          </div>
        </div>
    </div>
    
    <script src="js/autoHTML.js"></script>
    <script type="text/javascript">
    
      function setFlappyVisible () {
        $('#rt-container-flappy').attr('style', 'visibility:visible;'); 
        $('#theme1').attr('style', 'visibility:hidden;'); 
        $('#theme3').attr('style', 'visibility:hidden;'); 
      }

      function setCDVisible () {
        $('#rt-container-cd').attr('style', 'visibility:visible;'); 
        $('#theme1').attr('style', 'visibility:hidden;');
        $('#theme2').attr('style', 'visibility:hidden;'); 
      }

      function setBrickVisible () {
        $('#rt-container-brick').attr('style', 'visibility:visible;'); 
        $('#theme2').attr('style', 'visibility:hidden;'); 
        $('#theme3').attr('style', 'visibility:hidden;'); 
      }
    </script>

  </body>
</html>