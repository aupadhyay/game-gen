<?php
		$readFile = "flappy/xy.lua";
		$open = fopen($readFile, "r") or die("Unable to open file!");
		$counter = 0;
		while (!feof($open)){
			$line = fgets($open);
			$temp = explode("_",$line);
			print_r($temp);
			$temp1 = explode(" = ", $temp[1]);
			print_r($temp1);
			//$tempFinal[$counter] = array($temp[0], $temp1[0], $temp1[1]);
			print_r($tempFinal[$counter]);
			$counter = $counter + 1;
		}
		print_r($tempFinal . "\n");
		fclose($open);
?>