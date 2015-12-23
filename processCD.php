<?php
	require('uploadCD.php');
	$items = array('cat', 'dog', 'man1', 'man2', 'man3', 'backgroundcd', 'groundcd');
	
	for ($i=0; $i <= 4; $i++) { 
		uploadImage($items[$i]);
	}

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