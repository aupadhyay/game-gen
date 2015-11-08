var array = new Array(	new Array("Title", 0),
						new Array("Author", 0)
						new Array("Paddle", 1),
					  	new Array("Ball", 1),
					  	new Array("Brick", 1),
					  	new Array("Background", 1));
var div = document.getElementById('bb-form');
for (var i = 0; i <= array.length - 1; i++) {
	if(array[i][1] == 0) { //Text Ex.Title
		div.innerHTML = div.innerHTML + '<p style="width:20px;">' + array[i][0] + ': </p>  <input type="file" name="' + array[i][0]+ '" class="formObject" rt-target="'+ array[i][0]+'Image"> <br>';
	}else if(array[i][1] == 1) { //Image Ex. Paddle
		div.innerHTML = div.innerHTML + '<p style="width:20px;">' + array[i][0] + ': </p>  <input type="text" name="' + array[i][0]+ '" class="formObject"> <br>';
	}
	
};