<?php
session_start();

$elements = array(0 => "titleText");


$destination = "/var/www/html/game-gen/theme1/images/";
$uploadfile = $destination . basename($_FILES['testFile']['name']);

foreach($_FILES as $file) { 
            $n = $file['name']; 
            $s = $file['size']; 

            echo $n;
        } 

if (move_uploaded_file($_FILES['testFile']['tmp_name'], $uploadfile)) {
   echo "File is valid, and was successfully uploaded.\n";
} else {
    echo "error :(";
}

echo $_POST['titleText'];

?>