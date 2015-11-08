var brickArray = new Array(	new Array("Title", 0),
						new Array("Author", 0),
						new Array("Paddle", 1),
					  	new Array("Ball", 1),
					  	new Array("Brick", 1),
					  	new Array("Background", 1),
					  	new Array("PauseButton", 1));
var div = document.getElementById('bb-form');
for (var i = 0; i <= brickArray.length - 1; i++) {
	if(brickArray[i][1] == 1) { //Image Ex. Paddle
		div.innerHTML = div.innerHTML + '<p class="form-label">' + brickArray[i][0] + ': </p>  <input type="file" theme="brick" name="' + brickArray[i][0]+ '"id="'+ brickArray[i][0]+'" class="formObject" rt-target="'+ brickArray[i][0]+'Image"> <br>';
	}else if(brickArray[i][1] == 0) { //Text Ex.Title
		div.innerHTML = div.innerHTML + '<p class="form-label">' + brickArray[i][0] + ': </p>  <input type="text" name="' + brickArray[i][0]+ '" class="formObject"> <br>';
	}
	
};


var flappyArray = new Array(new Array("Title", 0),
						new Array("Author", 0),
						new Array("Bird", 1),
					  	new Array("TopPipes", 1),
					  	new Array("BottomPipes", 1),
					  	new Array("Ground", 1),
					  	new Array("BackgroundF", 1),
					  	new Array("Distance-Between-Pipes", 0),
					  	new Array("Gravity", 0));
var div = document.getElementById('fb-form');
for (var i = 0; i <= flappyArray.length - 1; i++) {
	if(flappyArray[i][1] == 1) { //Image Ex. Paddle
		div.innerHTML = div.innerHTML + '<p class="form-label">' + flappyArray[i][0] + ': </p>  <input type="file" theme="brick" name="' + flappyArray[i][0]+ '"id="'+ flappyArray[i][0]+'" class="formObject" rt-target="'+ flappyArray[i][0]+'Image"> <br>';
	}else if(flappyArray[i][1] == 0) { //Text Ex.Title
		div.innerHTML = div.innerHTML + '<p class="form-label">' + flappyArray[i][0] + ': </p>  <input type="text" name="' + flappyArray[i][0]+ '" class="formObject"> <br>';
	}
	
};




