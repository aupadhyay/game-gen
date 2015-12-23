_W = display.contentWidth
_H = display.contentHeight

math.randomseed(os.time())

display.setStatusBar(display.HiddenStatusBar)
local physics = require('physics')
require("customValues")
require("xy")
physics.start()
physics.setGravity(0,setGravity_int)

local starterTxt
local groundcd
local man1
local man2
local man3
local barrierLeft
local barrierRight
local score = 0
local scoreText
local barrierBottom
local cats = {}
local dogs = {}
local resumeBtn
local pauseBtn
local backgroundcd
local gameTint
local restartText
local loserText
local group = display.newGroup()

local function init()

	backgroundcd = display.newImageRect("images/bg.png", _W, _H)
	backgroundcd.x = backgroundcd_x
	backgroundcd.y = backgroundcd_y

	man1 = display.newImageRect("images/man.png", 40, 80)
	man1.x = man1_x
	man1.y = man1_y

	man2 = display.newImageRect("images/man.png", 40, 80)
	man2.x = man2_x
	man2.y = man2_y

	man3 = display.newImageRect("images/man.png", 40, 80)
	man3.x = man3_x
	man3.y = man3_y

	groundcd = display.newRect(_W/2, _H, _W, 40)
	groundcd.anchorX = 0.5
	groundcd.anchorY = 1
	groundcd:setFillColor(0,255,0)

	barrierLeft = display.newRect(0, _H/2, 1, 1000)
	physics.addBody(barrierLeft, "static")
	barrierLeft.isVisible = false

	barrierRight = display.newRect(_W, _H/2, 1, 1000)
	physics.addBody(barrierRight, "static")
	barrierRight.isVisible = false

	barrierBottom = display.newRect(_W/2, _H, _W, 220)
	physics.addBody(barrierBottom, "static")
	barrierBottom.anchorX = 0.5
	barrierBottom.anchorY = 0.5
	barrierBottom.isVisible = false
	barrierBottom.name = "barrierBottom"

	function pauseGame(e)
		print("paused")
		physics.pause()
		pauseBtn.isVisible = false
		resumeBtn.isVisible = true
		for i = 0,enemyNumber-1 do
			cats[i]:removeEventListener("tap", recycleAnimals)
			dogs[i]:removeEventListener("tap", recycleAnimals)
		end
	
		-- body
	end

	function resumeGame(e)
	
		physics.start()
		resumeBtn.isVisible = false
		pauseBtn.isVisible= true
		for i = 0,enemyNumber-1 do
			cats[i]:addEventListener("tap", recycleAnimals)
			dogs[i]:addEventListener("tap", recycleAnimals)
		end
		-- body
	end

	pauseBtn = display.newImageRect("images/pause.png", 15, 15)
	pauseBtn.x = pauseBtn_x
	pauseBtn.y = pauseBtn_y
	pauseBtn:setFillColor(0,0,0)
	pauseBtn:addEventListener("tap", pauseGame)

	resumeBtn = display.newImageRect("images/playArrow.png", 25, 25)
	resumeBtn.x = _W-15
	resumeBtn.y = 15
	resumeBtn:setFillColor(0,0,0)
	resumeBtn.isVisible = false
	resumeBtn:addEventListener("tap", resumeGame)
	

	local options = 
	{
	    text = "Tap to Play!",     
	    x = _W/2,
	    y = _H/2-40,    
	    font = native.systemFontBold,   
	    fontSize = 18,
	}

	starterTxt = display.newText(options)

	gameTint = display.newRect(_W/2, _H/2, _W, _H)
	gameTint:setFillColor(0,0,0)
	gameTint.alpha = 0.01
	gameTint:addEventListener('tap', startGame)

	

	group:insert(backgroundcd)
	group:insert(groundcd)
	group:insert(man1)
	group:insert(man2)
	group:insert(man3)
	group:insert(barrierLeft)
	group:insert(barrierBottom)
	group:insert(barrierRight)
	group:insert(pauseBtn)
	group:insert(resumeBtn)
	group:insert(starterTxt)
	group:insert(gameTint)
	
	group.isVisible = true
	local options = 
		{
		text = score,
		x = _W,
		y = 30,
		width = _W,
		font = native.systemFont,
		fontSize = 30
		}

		scoreText = display.newText(options)
		scoreText:setFillColor(0,0,0)
				
	function recycleAnimals(e)
		score = score + 1
		scoreText.text = score
		e.target.x = math.random(_W/10, _W-_W/10)
		e.target.y = math.random(-2*_H, -0.5*_H)
	end	

end



function startGame(e)
	gameTint:removeSelf()
	starterTxt:removeSelf()
	for i = 0,enemyNumber-1 do 
		cats[i] = display.newImageRect("images/cat.png", 50, 42)  -- 1.19
		cats[i].x = math.random(_W/10, _W-_W/10)
		cats[i].y = math.random(-2*_H, -0.5*_H)
		cats[i].name = "enemy"
		dogs[i] = display.newImageRect("images/dog1.png", 50, 67) -- 0.75
		dogs[i].x = math.random(_W/10, _W-_W/10)
		dogs[i].y = math.random(-2*_H, -0.5*_H)
		dogs[i].name = "enemy"
		physics.addBody(cats[i], "dynamic")
		physics.addBody(dogs[i], "dynamic")
		cats[i]:addEventListener("tap", recycleAnimals)
		dogs[i]:addEventListener("tap", recycleAnimals)
		group:insert(cats[i])
		group:insert(dogs[i])
		dogs[i]:addEventListener("collision", onCollision)
		cats[i]:addEventListener("collision", onCollision)
		
	end
	gameTint:removeEventListener('tap', startGame)
	
end

function restartGame()
	group:removeSelf()
	group = display.newGroup()
	init()
	-- body
end

function onCollision(e)
	if((e.other.name == "barrierBottom") ) then
		print("hit")
		loserText = display.newText("Game Over", _W/2, _H/2-50, native.systemFontBold, 22)
		restartText = display.newText("Restart", _W/2, _H/2, native.systemFontBold,24)
		restartText:addEventListener("tap", restartGame)
		group:insert(restartText)
		group:insert(loserText)
		score = 0
		pauseBtn:removeEventListener("tap", pauseGame)
		resumeBtn:removeEventListener("tap", resumeGame)
		for i= 0,enemyNumber-1 do
			cats[i]:removeEventListener("tap", recycleAnimals)
			dogs[i]:removeEventListener("tap", recycleAnimals)
		end
	end
end




init()

