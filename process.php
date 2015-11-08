<?php
	require('upload.php');
	$items = array('Paddle', 'Ball', 'Background', 'Brick', 'PauseButton');
	
	for ($i=0; $i <= 1; $i++) { 
		uploadImage($items[$i]);
	}
		
?>