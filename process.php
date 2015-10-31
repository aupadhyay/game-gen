<?php
session_start();

$elements = array(0 => "titleText");


$destination = "/var/www/html/game-gen/theme1/images/";
$uploadfile = $destination . basename($_FILES['testFile']['name']);

foreach($_FILES as $file) { 
            $n = $file['name'];
            $k = $file['tmp_name']; 
            $l = $file['error'];
            $s = $file['size']; 

            echo $n;
            $uploadfile = $destination . $n;
        } 

if (move_uploaded_file($k, $uploadfile)) {
   echo "File is valid, and was successfully uploaded.\n";
} else {
    echo "error :( \n";
    echo $uploadfile;
    echo $k;
    echo $l;
}

?>