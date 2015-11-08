<?php
	require('upload.php');
	$items = array('Bird', 'TopPipes', 'BottomPipes', 'Ground', 'BackgroundF');
	
	for ($i=0; $i <= 4; $i++) { 
		uploadImage($items[$i]);
	}
		
?>