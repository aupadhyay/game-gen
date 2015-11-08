<?php
	require('uploadFlappy.php');
	$items = array('Bird', 'TopPipes', 'BottomPipes', 'Ground', 'BackgroundF');
	
	for ($i=0; $i <= 4; $i++) { 
		uploadImage($items[$i]);
	}

	$rootPath = realpath('flappyBird/');

	// Initialize archive object
	$zip = new ZipArchive();
	$zip->open('file.zip', ZipArchive::CREATE | ZipArchive::OVERWRITE);

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

header("Content-type: application/zip"); 
header("Content-Disposition: attachment; filename=file.zip"); 
header("Pragma: no-cache"); 
header("Expires: 0"); 
readfile("file.zip");
exit;
		
?>