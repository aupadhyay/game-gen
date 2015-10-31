<?php

$recallData  = array();
$elements = array(0 => "firstname", 1 => "lastname" );

for ($i=0; $i <= 1; $i++) { 
    $recallData[$elements[$i]] = $_POST[$elements[$i]];
}

$recallData['success'] = true;

echo json_encode($data);

?>