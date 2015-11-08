<?php
require('upload.php');
uploadImage("testing");
?>
<form action="test.php" method="POST">
	<input type="file" name="testing">
	<input type="submit">
</form>