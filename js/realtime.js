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
		$(".formObject").change(function() {	
			var $image = $(this);
			var file = this.files[0];
			var imagefile = file.type;
			var reader = new FileReader();
			reader.onload = function (e) {
				var target = $image.attr('rt-target');
				console.log(target);
				$('#' + target).attr('src', e.target.result);
			};
			alert("lolz");
			$.ajax({
					url: "../processxy.php", // Url to which the request is send
					type: "POST",             // Type of request to be send, called as method
					data: { target : $image.attr('name'), theme: $image.attr('theme') }, // Data sent to server, a set of key/value pairs (i.e. form fields and values)
					contentType: false,       // The content type used when sending data to the server.
					cache: false, 
					success:function(result){
        				console.log("test");
    					function reqListener () {
      						console.log(this.responseText);
    					}

    					var oReq = new XMLHttpRequest();
   						oReq.onload = function() {
        					alert(this.responseText);
    					};
    					oReq.open("get", "../processxy.php", true);
    					oReq.send();
       				},
       				error:function(exception){alert('Exeption:'+exception);},
					processData:false        // To send DOMDocument or non processed data file it is set to false
				});
			reader.readAsDataURL(this.files[0]);
		});
	});

});
