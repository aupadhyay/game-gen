<?php
session_start();
?>

<html>
  <head>
    <title>Game Gen</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="_styles.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
      
      <script src="realtime.js"></script>
  </head> 

  <body>
    <div class="main">
      <h2>Setup</h2>
        <button type="button" class="theme" data-toggle="collapse" data-target="#demo">Brick Breaker</button>
        <div id="demo" class="collapse out">
          <form class="form-setup" id="form" action="process.php" method="POST" enctype="multipart/form-data">
            <div class="test" id="test">
              <p>Title: </p>
              <input type="text" name="titleText"><br>
              <!--<p>Paddle: </p>
              <input type="file" name="paddle" class="formObject" rt-target="paddleImage"><br>
              <p>Ball: </p>
              <input type="file" name="ball" class="formObject" rt-target="testImageText1">!-->
              <input type="submit">
            </div>
          </form>
      </div>
    </div>

    <div class="main">
      <h2>Realtime</h2>
        <div class="rt-container" id="rt-container">
         	<img id="paddleImage" class="rt-object" src="none.png" width="88" height="14" style="margin-left: 36px; margin-top: 393px ;">
          <img id="ballImage" src="none.png" width="20" height="20">
        </div>
    </div>
    

  <script>
    var array = ['Paddle', 'Ball', 'Brick'];
    var div = document.getElementById('test');
    for (var i = array.length - 1; i >= 0; i--) {
      div.innerHTML = div.innerHTML + '<p>' + array[i] + ': </p>
              <input type="file" name="' + array[i] + '" class="formObject" rt-target="'+ array[i]+'Image">';
    };
    
  </script>

  </body>
</html>