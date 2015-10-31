<?php
session_start();

$elements = array(0 => "titleText");


$destination = "/var/www/html/game-gen/theme1/images/";
$uploadfile = $destination . basename($_FILES['testFile']['name']);

if (move_uploaded_file($_FILES['testFile']['tmp_name'], $uploadfile)) {
   echo "File is valid, and was successfully uploaded.\n";
} else {
    echo $_FILES['testFile']['error'];
}

$_SESSION["test"] = $uploadfile;

?>