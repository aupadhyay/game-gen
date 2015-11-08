<?php
function uploadImage($selector){
$target_dir = "brick/images/";
$imageFileType = pathinfo($target_dir . basename($_FILES[$selector]["name"]),PATHINFO_EXTENSION);
$target_file = $target_dir . $selector . "." . $imageFileType;
$uploadOk = 1;
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES[$selector]["tmp_name"]);
    if($check !== false) {
        //echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        //echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Allow certain file formats
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    //echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES[$selector]["tmp_name"], $target_file)) {
        //echo "The file ". basename( $_FILES[$selector]["name"]). " has been uploaded." . "<br>";
    } else {
        //echo "Sorry, there was an error uploading your file." . "<br>";
    }
}
}
?>