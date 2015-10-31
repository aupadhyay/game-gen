<html>
  <head>
    <title>Game Gen</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="_styles.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
      <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
      <script src="test.js"></script>
      <script src="jquery.form.min.js"></script>
  </head> 

  <body>
    <div class="main">
      <h2>Setup</h2>
        <button type="button" class="theme" data-toggle="collapse" data-target="#demo">Brick Breaker</button>
        <div id="demo" class="collapse out">
          <form class="form-setup" id="form" action="process.php" method="POST" enctype="multipart/form-data">
            <div class="test">
              <p>Title: </p>
              <input type="text" name="titleText"><br>
              <p>Your Name: </p>
              <input type="file" name="testImage">
              <input type="submit">
            </div>
          </form>
      </div>
    </div>

    <div class="main">
      <h2>Realtime</h2>
        <div class="rt-container" id="rt-container">
         	<div id="titleText"><?php echo "Test"; ?></div>
         	<div id="testImage"></div>
        </div>
    </div>

  </body>
</html>