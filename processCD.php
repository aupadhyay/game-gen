<?php
	require('uploadCD.php');
	$items = array('Bird', 'TopPipes', 'BottomPipes', 'Ground', 'BackgroundF');
	
	for ($i=0; $i <= 4; $i++) { 
		uploadImage($items[$i]);
	}
	$customValues = fopen("cd/customValues.lua", "w");

	$data = "scrollSpeed_int =" . $_POST['Scroll-Speed'] . ";
distanceBetweenPipes_x =" . $_POST['Distance-Between-Pipes'] .
";firstIntervalPipeGap = 110;
secondIntervalPipeGap = 145;" ;

	fwrite($customValues, $data);
	fclose($customValues);

	$rootPath = realpath('cd/');

	// Initialize archive object
	$zip = new ZipArchive();
	$zip->open('cd.zip', ZipArchive::CREATE | ZipArchive::OVERWRITE);

	// Create recursive directory iterator
	/** @var SplFileInfo[] $files */
	$files = new RecursiveIteratorIterator(
    	new RecursiveDirectoryIterator($rootPath),
    	RecursiveIteratorIterator::LEAVES_ONLY
	);

	foreach ($files as $name => $file){
    // Skip directories (they would be added automatically)
    if (!$file->isDir()){
        // Get real and relative path for current file
        $filePath = $file->getRealPath();
        $relativePath = substr($filePath, strlen($rootPath) + 1);

        // Add current file to archive
        $zip->addFile($filePath, $relativePath);
    }
}

// Zip archive will be created only after closing object
$zip->close();

$file = 'cd.zip';

if (file_exists($file)) {
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="'.basename($file).'"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($file));
    readfile($file);
    exit;
}
		
?>