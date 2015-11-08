<?php
	if($_POST['theme'] == "flappy"){
		$readFile = "flappy/xy.lua";
		$open = fopen($readFile, "r") or die("Unable to open file!");
		echo json_encode(fgets($open));
		fclose($open);


	}
	if($_POST['theme'] == "brick"){


	}
?>