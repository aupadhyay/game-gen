var cdFileReader;
var bFileReader;
var fbFileReader;
var divcd = document.getElementById('rt-container-cd');
var divfb = document.getElementById('rt-container-flappy');
var divb = document.getElementById('rt-container-brick');
var cdXYArray = new Array();
var bXYArray = new Array();
var fbXYArray = new Array();

if (window.XMLHttpRequest) {
    cdFileReader = new XMLHttpRequest();
    bFileReader = new XMLHttpRequest();
    fbFileReader = new XMLHttpRequest();
} else if (window.ActiveXObject) {
    cdFileReader = new ActiveXObject("Microsoft.XMLHTTP");
    bFileReader = new ActiveXObject("Microsoft.XMLHTTP");
    fbFileReader = new ActiveXObject("Microsoft.XMLHTTP");
}

cdFileReader.onreadystatechange = function(){
	if (cdFileReader.readyState == 4 && cdFileReader.status == 200) {
    	cdText = cdFileReader.responseText;
    	createFinalArray(cdText, cdXYArray); //call after all files are loaded
    	addElements(cdXYArray, divcd);
  	}
};
cdFileReader.open("GET","cd/xy.lua");
cdFileReader.send();

bFileReader.onreadystatechange = function(){
	if (bFileReader.readyState == 4 && bFileReader.status == 200) {
    	bText = bFileReader.responseText;
    	createFinalArray(bText, bXYArray ); //call after all files are loaded
    	addElements(bXYArray, divb);
    }
};
bFileReader.open("GET","brick/xy.lua");
bFileReader.send();

fbFileReader.onreadystatechange = function(){
	if (fbFileReader.readyState == 4 && fbFileReader.status == 200) {
		fbText = fbFileReader.responseText;
    	createFinalArray(fbText, fbXYArray); //call after all files are loaded
    	addElements(fbXYArray, divfb);
  	}
};
fbFileReader.open("GET","flappyBird/xy.lua");
fbFileReader.send();

function createFinalArray (input, array) {
	var counter = 1;
	var finalCounter = 0;
	var lines = input.split("\n");
	
	for (var i = 0; i <= lines.length - 1; i++) {
		var temp_array = lines[i].split("_");
		temp_array[1] = temp_array[1].split("=");
		temp_array[1] = parseFloat(temp_array[1][1]);
		
		if(counter == 1){
			array[finalCounter] = temp_array;
		}else{
			array[finalCounter][counter] = temp_array[1];
		}

		if(counter < 6){
			counter = counter + 1; 
		}else{
			array[finalCounter][1] = array[finalCounter][1] - (array[finalCounter][5] * array[finalCounter][3]);
			array[finalCounter][2] = array[finalCounter][2] - (array[finalCounter][6] * array[finalCounter][4]);
			counter = 1;
			finalCounter = finalCounter + 1;
		}
	};

	
}


var brickArray = new Array(
						new Array("paddle", 1, "Paddle"),
					  	new Array("ball", 1, "Ball"),
					  	new Array("brick", 1, "Brick"),
					  	new Array("background", 1, "Background"));
var div = document.getElementById('bb-form');
for (var i = 0; i <= brickArray.length - 1; i++) {
	if(brickArray[i][1] == 1) { //Image Ex. Paddle
		div.innerHTML = div.innerHTML + '<p class="form-label">' + brickArray[i][2] + ': </p>  <input type="file" theme="brick" name="' + brickArray[i][0]+ '"id="'+ brickArray[i][0]+'" class="formObject" rt-target="'+ brickArray[i][0]+'Image"> <br>';
	}else if(brickArray[i][1] == 0) { //Text Ex.Title
		div.innerHTML = div.innerHTML + '<p class="form-label">' + brickArray[i][2] + ': </p>  <input type="text" name="' + brickArray[i][2]+ '" class="formObject"> <br>';
	}
	
};


var flappyArray = new Array(
						new Array("player", 1, "Bird"),
					  	new Array("pipesTop", 1, "Top Pipes"),
					  	new Array("pipesBottom", 1, "Bottom Pipes"),
					  	new Array("ground", 1, "Ground"),
					  	new Array("backgroundf", 1, "Background"));
var div = document.getElementById('fb-form');
for (var i = 0; i <= flappyArray.length - 1; i++) {
	if(flappyArray[i][1] == 1) { //Image Ex. Paddle
		div.innerHTML = div.innerHTML + '<p class="form-label">' + flappyArray[i][2] + ': </p>  <input type="file" theme="brick" name="' + flappyArray[i][0]+ '"id="'+ flappyArray[i][0]+'" class="formObject" rt-target="'+ flappyArray[i][0]+'Image"> <br>';
	}else if(flappyArray[i][1] == 0) { //Text Ex.Title
		div.innerHTML = div.innerHTML + '<p class="form-label">' + flappyArray[i][2] + ': </p>  <input type="text" name="' + flappyArray[i][2]+ '" class="formObject"> <br>';
	}
	
};


var cdArray = new Array(new Array("pauseBtn", 1, "Pause Button"),
					  	new Array("cat", 1, "Enemy 1"),
					  	new Array("dog", 1, "Enemy 2"),
					  	new Array("man1", 1, "Man 1"),
					  	new Array("man2", 1, "Man 2"),
					  	new Array("man3", 1, "Man 3"),
					  	new Array("backgroundcd", 1, "Background"),
					  	new Array("groundcd", 1, "Ground"));
var div = document.getElementById('cd-form');

for (var i = 0; i <= cdArray.length - 1; i++) {
	if(cdArray[i][1] == 1) { //Image Ex. Paddle
		div.innerHTML = div.innerHTML + '<p class="form-label">' + cdArray[i][2] + ': </p>  <input type="file" theme="brick" name="' + cdArray[i][0]+ '"id="'+ cdArray[i][0]+'" class="formObject" rt-target="'+ cdArray[i][0]+'Image"> <br>';
		
	}else if(cdArray[i][1] == 0) { //Text Ex.Title
		div.innerHTML = div.innerHTML + '<p class="form-label">' + cdArray[i][2] + ': </p>  <input type="text" name="' + cdArray[i][2]+ '" class="formObject"> <br>';
	}
	
};

function addElements (array,div) {
	console.log(array.length)
	for (var j = 0; j <= array.length - 1; j++) {
		console.log("lmao");
		div.innerHTML = div.innerHTML + '<img onerror="this.src=\'Default.png\'" id="'+ array[j][0] +'Image" class="rt-object" width=' + array[j][5] + '" height="' + array[j][6] + '" style="margin-left:'+ array[j][1] +'px; margin-top: '+ array[j][2] +'px;">';
	};
}






