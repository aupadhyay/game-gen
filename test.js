$(document).ready(function() {
	$("#form").on('submit',(function(e) {
		e.preventDefault();		
		$.ajax({
			url: "process.php", // Url to which the request is send
			type: "POST",             // Type of request to be send, called as method
			data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
			contentType: false,       // The content type used when sending data to the server.
			cache: false,             // To unable request pages to be cached
			processData:false        // To send DOMDocument or non processed data file it is set to false
		});
	}));

// Function to preview image after validation
	$(function() {
		$("#testImage").change(function() {	
			var file = this.files[0];
			var imagefile = file.type;
			var reader = new FileReader();
			reader.onload = imageIsLoaded;
			reader.readAsDataURL(this.files[0]);
		});
	});

function imageIsLoaded(e) {
$("#testImage").css("color","green");
$('#testImageText').attr('src', e.target.result);
$('#testImageText').attr('width', '250px');
$('#testImageText').attr('height', '230px');
};
});