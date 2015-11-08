-----------------------------------------------------------------------------------------
--
-- main.lua
--Brick Breaker Code Day 2015 Theme
-----------------------------------------------------------------------------------------
local composer = require("composer")
local scene = composer.newScene()

_W = display.contentWidth
_H = display.contentHeight

display.setStatusBar( display.HiddenStatusBar )
--Library
local physics = require("physics")
physics.start( )
physics.setGravity( 0, 0 )

--Variables

--Num/string vars
local scoreNum = 0
local dir = "down"
local numOfTimes = 0
local hitPaddle = "none"
local xSpeed = 5
local ySpeed = 5
--Levels
level = {
	{0,0,0,0,1,0,0,0,0},
	{0,0,0,1,0,1,0,0,0},
	{0,0,1,0,0,0,1,0,0},
	{0,1,0,0,0,0,0,1,0},
	{1,0,0,0,0,0,0,0,1},
	{0,1,0,0,0,0,0,1,0},
	{0,0,1,0,0,0,1,0,0},
	{0,0,0,1,0,1,0,0,0},
	{0,0,0,0,1,0,0,0,0}
}

--Object Var
local background
local tapToPlayScreen 
local paddle
local ball
local scoreText
local scoreNumText
local group = display.newGroup()
--Functions
function scene:show(e)

	if(e.phase == "did")then
		
function addGameScreen()
	physics.start( )
	physics.setGravity(0,0)
	--Functions
group = display.newGroup()
	function tapToPlayFunction()
		tapToPlayScreen:removeSelf( )
		startGame()
	end

	function startGame()
		print ("in game")
		
		Runtime:addEventListener( "enterFrame", Update )
	end

	function movePaddle(event)

		if (event.phase== "moved") then
			event.target.x = event.x
		end



	end

	function acceleratePaddle(event)
		
		paddle.x = _W/2 + (_W/2 * event.xGravity)

	end

	function restartLevel()
		composer.gotoScene("gameScreen")
	end


	function loseFunction()
		physics.stop( )
		Runtime:removeEventListener( "enterFrame", Update )
		loseScreenImage = display.newImageRect("images/youLoseScreen.png",320,480)
		loseScreenImage.x = _W/2
		loseScreenImage.y = _H/2
		loseScreenImage:addEventListener( "tap", restartLevel )
		group:insert(loseScreenImage)
	end

	function hitBrick(event)
		print "in hit brick evetn"
		print (event.other)
		
		if (event.other.name == 'brick') then
			print "hit a brick!!!!"
			scoreNum = scoreNum +10
			if (ball.x-ball.width/2 < event.other.x+event.other.width/2  ) then
			print "in left brick"
			xSpeed = xSpeed*-1
			ySpeed = ySpeed*-1
			event.other:removeSelf( )
		elseif (ball.x-ball.width/2 >= event.other.x+event.other.width/22) then
			print "in right brick"
			xSpeed = xSpeed*-1
			ySpeed = ySpeed*-1
			event.other:removeSelf( )
		end

		end

	end

	function Update()

		scoreNumText.text = scoreNum
		
	--keep paddle on screen
		--right wall
		if (paddle.x >=_W)  then
			print "in right wall"
			paddle.x =_W
			

		end
		--left wall
		 if (paddle.x <=0)then
		 	print "in left wall "
		 	paddle.x =0
		 	
		end
	
		if (ball.x>_W) then
			xSpeed = xSpeed*-1
			ball.x = ball.x-3
		--ySpeed = ySpeed*-1
		end

		if (ball.x<0) then
			if (ball.y>=_H/2 and ball.y<_H ) then
			--ySpeed = ySpeed*-1
			xSpeed = xSpeed*-1
			ball.x = ball.x+3
			elseif (ball.y<=_H/2 and ball.y>0) then
			xSpeed = xSpeed*-1
			ySpeed = ySpeed*-1
end
		end

--Up wall
		if (ball.y<0) then
			if (ball.x>=0 and ball.x<_W/2) then
			ySpeed = ySpeed*-1
			
			elseif (ball.x >=_W/2 and ball.x<_W) then
				ySpeed = ySpeed*-1
				xSpeed = xSpeed*-1
		end

		end

		if (ball.y > _H) then
			print "you lose!"
			loseFunction()
		end
	--xSpeed = xSpeed*-1
	--		ySpeed = ySpeed*-1

	ball.y = ball.y + ySpeed
	ball.x = ball.x+ xSpeed
	
		if ((ball.y +ball.height/2 <paddle.y+paddle.height/2) and (ball.y +ball.height/2 >paddle.y-paddle.height/2)) then
			xSpeed = 5
			ySpeed = 5
			print "hit paddle"
			if(ball.x<paddle.x) and (ball.x>paddle.x-paddle.width/2) then
				print "hit paddleLeft"
				ySpeed = ySpeed*-1
				xSpeed = xSpeed*-1
				print (xSpeed)
				
				-- ((ball.y+ball.height/2>paddle.y-paddle.width/2) and 
				
			
			elseif ((ball.x>paddle.x) and (ball.x<paddle.x+paddle.width/2)) then
				print "hit paddleRight"
				ySpeed = ySpeed*-1
				--xSpeed = math.abs(xSpeed ) *-1
				print (xSpeed)

				
			end
end


	end

	--Objects

	background = display.newImageRect("images/Background.png",320,480)
	background.x = _W/2
	background.y = _H/2
	group:insert(background)



	paddle = display.newImageRect( "images/Paddle.png",60,12 )
	paddle.x = _W/2
	paddle.y = _H - 50
	paddle:addEventListener( "touch", movePaddle )
	system.setAccelerometerInterval( 60 )
	paddle:addEventListener( "accelerometer", acceleratePaddle )
	physics.addBody( paddle, "static", {density=0.3, friction=0.2, bounce=0.5 } )
	group:insert(paddle)

	ball = display.newImageRect( "images/Ball.png",12,12 )
	ball.x = _W/2+1
	ball.y = _H/2 +175
	ball:addEventListener( "collision", hitBrick )
	group:insert(ball)

	physics.addBody( ball, "dynamic", {density = 1,friction = 0.5, bounce = 0.5})

	scoreText = display.newText("Score: ", _W/4, 35,system.nativeFont,25)
	scoreText:setFillColor( 0,0,0 )		
	group:insert(scoreText)

	scoreNumText = display.newText(scoreNum, _W/4+55, 37,system.nativeFont,25)
	scoreNumText:setFillColor(0,0,0)	
	group:insert(scoreNumText)

	

	
			
	--Bricks
	brick = {}
	for i=1, table.maxn( level), 1 do
		for j=1, table.maxn( level), 1 do

			if (level[i][j] == 1) then
				print "in the brick maker"
				brick[i+j] = display.newImageRect("images/Brick.png",33,18)
				brick[i+j].x = _W/2 + 33*(i-4.9)
				brick[i+j].y = _H/2 - 18*j
				physics.addBody(brick[i+j],"static",{density = 0.1, friction = 0.3, bounce = 0.5})
				--brick[i+j]:addEventListener( "tap", hitBrick )
				brick[i+j].name = "brick"
				group:insert(brick[i+j])

			end

		end




	end
	



	tapToPlayScreen = display.newImageRect( "images/tapToPlaybb-420.png",320,480 )
	tapToPlayScreen.x = _W/2
	tapToPlayScreen.y = _H/2
	tapToPlayScreen:addEventListener( "tap", tapToPlayFunction )
	group:insert(tapToPlayScreen)




end


addGameScreen()

end
end

function scene:hide(e)
	if(e.phase == "did") then
		group:removeSelf()
		--group = nil
		scoreNum = 0
		scoreNumText.text = scoreNum
		group = display.newGroup()
		

	end

end

scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene

--[[
		reverseDirection()
		--keep paddle on screen
		--right wall
		if (paddle.x >=_W)  then
			print "in right wall"
			paddle.x =_W

		end
		--left wall
		 if (paddle.x <=0)then
		 	print "in left wall "
		 	
		end
		--right wall
		if (ball.x >=_W)  then
			--dir = "left"
		--	ball.x = ball.x -10
			print "in right wall"
			if (ball.x+ball.width/2>0) then --and (ball.x+ball.width/2<_H/2) then
				print "in right wall 1"
				dir = "leftDown"
				
			end
			--ball.x = ball.x + 5
		end

		 if (ball.x <=0) then
			--dir = "rightUp"
			print "in leftWall"
			if (ball.x- ball.width/2<_H) and (ball.x- ball.width/2 <_H/2) then
				print "in left wall 1"
				dir = "rightUp"
				--paddle.x = 0
				--ball.y = ball.y+5
				--ball.x = ball.x+5

			elseif (ball.x- ball.width/2<_H/2) and (ball.x- ball.width/2 <0) then
				print "in left wall 1"
				dir = "rightDown"
				--paddle.x = 0
				--ball.y = ball.y+5
				--ball.x = ball.x+5
			
			elseif (ball.x-ball.width/2 == _H/2) then
				print "CENTERED"

			end


		end

		if ((ball.y >=_H) and (hitPaddle == "leftUp")) then
			ball.y = ball.y-5
			ball.x = ball.x-5
		end

		--Down wall
		if (ball.y >=_H)  then
			dir = "up"
		--	ball.x = ball.x -10
			
		end
		--Up wall
		 if (ball.y <=0) then
			--dir = "down"
			print "in up wall"
			if (ball.y -ball.height/2 >0) and (ball.y -ball.height/2 < _W/2) then
				print "in up wall 1"
			
			elseif   (ball.y -ball.height/2 < _W) then
				print "in up wall 2"
				dir = "rightDown"
				--(ball.y -ball.height/2 >_W/2) and		
			end


		end


--Collision with padddle

	if (ball.x +ball.width == paddle.x-paddle.width) then
		print ("collided")
end
		if (ball.y +ball.width/2 == paddle.y+paddle.height/2) then
			if ((ball.x>paddle.x-paddle.width) and (ball.x<paddle.x)) then

				numOfTimes = numOfTimes +1
				print ("collided".. numOfTimes)
				dir = "leftUp"
				hitPaddle = "leftUp"
			end

end
	end

	function reverseDirection()
		if (dir == "left") then
		ball.x = ball.x-5
	end
		if (dir == "right") then
		ball.x = ball.x+5
	end
		if (dir =="up") then
		ball.y = ball.y-5
	end
		if (dir == "down") then
		ball.y = ball.y+5
	end

		if (dir == "leftUp") then
		ball.y = ball.y-5
		ball.x = ball.x-5
	end
			if (dir == "leftDown") then
		ball.y = ball.y+5
		ball.x = ball.x-5
	end
			if (dir == "rightUp") then
		ball.y = ball.y-5
		ball.x = ball.x+5
	end
			if (dir == "rightDown") then
		ball.y = ball.y+5
		ball.x = ball.x+5
	end
	end
	]]--