_W = display.contentWidth
_H = display.contentHeight

math.randomseed(os.time())

display.setStatusBar(display.HiddenStatusBar)
local physics = require('physics')
require("xy")
require("customValues")
physics.start()
physics.setGravity( 0, 30 )

local score = 0 
local scoreText
local pipesTop = {}
local pipesBottom = {}
gameOverBool = false
local tapToPlay
local ground
local addScoreBool = false
local scrollSpeed = scrollSpeed_int
local distanceBetweenPipes = distanceBetweenPipes_x
local player
local pipeGap = math.random(firstIntervalPipeGap,secondIntervalPipeGap)
local group = display.newGroup()

function init()
	--/*************CYRUS PLAYER/BG STUFF****************//
	player= display.newImageRect("images/player.png",40,40)
	player.x = player_x
	player.y = player_y
	player.name = "player"


	local options = 
	{
		text = score,
		x = _W,
		y = 60,
		width = _W,
		font = native.systemFontBold,
		fontSize = 40
	}

	scoreText = display.newText(options)
	

	background =display.newImageRect("images/bg.png",_W,_H)
	background.x = background_x
	background.y = background_y
	

	ground1 = display.newImageRect("images/groundFB.png", _W, 50)
	ground1.anchorX = ground_anchor_x
	ground1.anchorY = ground_anchor_y
	physics.addBody(ground1, "static")
	ground1.x = ground_x
	ground1.y = ground_y
	ground1.name = "ground"

	ground2 = display.newImageRect("images/groundFB.png", _W, 50)
	ground2.anchorX = 0
	ground2.anchorY = ground_anchor_y
	ground2.x = (ground1.width * 2) - ground1.width
	ground2.y = ground_y
	ground2.name = "ground"
	physics.addBody(ground2, "static")

	ground3 = display.newImageRect("images/groundFB.png", _W, 50)
	ground3.anchorX = 0
	ground3.anchorY = ground_anchor_y
	ground3.x = (ground1.width * 3) - ground1.width
	ground3.y = ground_y
	physics.addBody(ground3, "static")
	ground3.name = "ground"


	tapToPlay = display.newImageRect("images/tapToPlayFB.png", _W + 30, _H )
	tapToPlay.x = tapToPlay_x
	tapToPlay.y = tapToPlay_y
	tapToPlay.alpha = 0.7
	tapToPlay:addEventListener('tap', startGame)
	
	group:insert(background)
	group:insert(ground1)
	group:insert(ground2)
	group:insert(ground3)
	group:insert(player)
	
	--/*************PIPES****************//
	for i=1,3 do
		pipeGap = math.random(firstIntervalPipeGap,secondIntervalPipeGap)
		pipesTop[i] = display.newImageRect("images/pipe.png", 60, math.random(20,_H-pipeGap-20-ground1.height))
		pipesTop[i].anchorY = pipesTop_anchor_y
		pipesTop[i].x = i * distanceBetweenPipes
		pipesTop[i].y = pipesTop_y
		group:insert(pipesTop[i])
		physics.addBody(pipesTop[i], "static")
		pipesTop[i].name = "pipe"

		pipesBottom[i] = display.newImageRect("images/pipe.png", 60, _H - pipeGap - pipesTop[i].height - ground1.height)
		pipesBottom[i].anchorY = pipesBottom_anchor_y
		pipesBottom[i].x = i * distanceBetweenPipes
		pipesBottom[i].y = pipesBottom_y
		group:insert(pipesBottom[i])
		physics.addBody(pipesBottom[i], "static")
		pipesBottom[i].name = "pipe"
	end
	group:insert(tapToPlay)

end


function startGame(e)
	physics.addBody(player)
	tapToPlay:removeSelf()
	tapToPlay:removeEventListener('tap', startGame)

	updateEventListeners("add")
end


function update(e)
	for i=1,3 do
		pipesTop[i].x = pipesTop[i].x - scrollSpeed;
		pipesBottom[i].x = pipesBottom[i].x - scrollSpeed;

		if(pipesTop[i].x <= -1 * (pipesTop[i].width))then
			pipeGap = math.random(firstIntervalPipeGap,secondIntervalPipeGap)
			pipesTop[i].height = math.random(20,_H-pipeGap-20-ground1.height)
			pipesTop[i].x = (distanceBetweenPipes*3) + pipesTop[i].width
			physics.removeBody(pipesTop[i])
			physics.addBody(pipesTop[i], "static")
		end

		if(pipesBottom[i].x <= -1 * (pipesBottom[i].width))then
			pipeGap = math.random(firstIntervalPipeGap,secondIntervalPipeGap)
			pipesBottom[i].height = _H - pipeGap - pipesTop[i].height - ground1.height
			pipesBottom[i].x = (distanceBetweenPipes*3)  + pipesBottom[i].width
			physics.removeBody(pipesBottom[i])
			physics.addBody(pipesBottom[i], "static")
		end
		
		if (pipesTop[i].x + 30 < player.x-20) then
			
			score = score + 1
			score = math.ceil(score)
			scoreText.text = math.ceil(score/13)
		end


	end

	ground1.x = ground1.x - scrollSpeed
	ground2.x = ground2.x - scrollSpeed
	ground3.x = ground3.x - scrollSpeed

	if (ground1.x <= -1 * (ground1.width)) then
		ground1.x = ground3.x + ground3.width
	end
	if (ground2.x <= -1 * (ground2.width)) then
		ground2.x = ground1.x + ground1.width
	end
	if (ground3.x <= -1 * (ground3.width)) then
		ground3.x = ground2.x + ground2.width
	end

end

function gameOver()
	if(gameOverBool == true)then
		gameOverBool = false
		score = 0
		timer.performWithDelay(1, function()
			updateEventListeners("remove")
			physics.removeBody(player)
			
		end)

		local gameOverBg = display.newText("Game Over!", _W/2, _H/2 - 50,native.systemFontBold, 24)
		local restartText = display.newText("Restart", _W/2, _H/2 + 25, native.systemFontBold, 24)
		group:insert(gameOverBg)
		group:insert(restartText)
		restartText:addEventListener('tap', function ()
			group:removeSelf()
			group = display.newGroup()
			init()
		end)


	end
end

function onCollision(e)
	if ((e.other.name == "ground") or (e.other.name == "pipe")) then
		if ( e.phase == "began" ) then
			gameOverBool = true
			gameOver()
		end
	end
end

function playerJump(e)
	player:setLinearVelocity(0,-300)

end

function updateEventListeners(action)
	if(action == "add")then
		Runtime:addEventListener("enterFrame", update)
		Runtime:addEventListener('tap', playerJump)
		player:addEventListener('collision', onCollision)
	elseif(action == "remove")then
		Runtime:removeEventListener("enterFrame", update)
		Runtime:removeEventListener('tap', playerJump)
		player:removeEventListener('collision', onCollision)
	end
end

init()