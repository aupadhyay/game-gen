<?php

$recallData  = array();
$elements = array(0 => "titleText");


$destination = "/var/www/html/game-gen/theme1/images/";
$uploadfile = $destination . basename($_FILES['testFile']['name']);

if (move_uploaded_file($_FILES['testFile']['tmp_name'], $uploadfile)) {
    $recallData['message'] =  "File is valid, and was successfully uploaded.\n";
} else {
    $recallData['message'] = "Possible file upload attack!\n";
}



//for ($i=0; $i <= 1; $i++) { 
    $recallData[$elements[$i]] = $_POST[$elements[$i]];
//}

$recallData['success'] = true;

echo json_encode($recallData);

?>