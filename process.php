<?php
	require('upload.php');
	$items = array('paddle', 'testImage1');

	for ($i=0; $i < 1; $i++) { 
		uploadImage($items[i]);
	}

	
		
?>