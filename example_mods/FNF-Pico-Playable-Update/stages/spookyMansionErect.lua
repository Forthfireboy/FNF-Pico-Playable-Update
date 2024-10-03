
zoom1=false
zoom2=false
function onEvent(eventName, v1)
	if eventName == 'Screen Shake' then
	  handleScreenShake(v1)
	elseif eventName == 'Set GF Speed' then
	  handleSetGFSpeed(v1)
	end
  end
  
  function handleScreenShake(value)
	if value == '1' then
	  zoom1 = true
	  zoom2 = false
	elseif value == '2' then
	  zoom1 = false
	  zoom2 = true
	elseif value == '3' then
	  zoom1 = false
	  zoom2 = false
	end
  end
  
  function handleSetGFSpeed(value)
	if value == 'g' then
	  triggerEvent('Camera Follow Pos', '700', '510')
	elseif value == 'b' then
	  triggerEvent('Camera Follow Pos', '', '')
	elseif value == 'dad' then
	  triggerEvent('Camera Follow Pos', '630', '480')
	elseif value == 'bf' then
	  triggerEvent('Camera Follow Pos', '750', '480')
	end
  end
  
function onCreate()
	makeAnimatedLuaSprite('CanYouRemenber!', 'CanYouRemenber!', 200, 50)
	addAnimationByPrefix('CanYouRemenber!', 'idle', '', 24, true)
	scaleObject('CanYouRemenber!',1.8,1.8)
	addLuaSprite('CanYouRemenber!',false)

	makeAnimatedLuaSprite('halloweenBG', 'spooky-erect/bgtrees', 200, 50)
	addAnimationByPrefix('halloweenBG', 'idle', 'bgtrees0', 6, true)
	scaleObject('halloweenBG',2,2)
	addLuaSprite('halloweenBG', false)

	makeLuaSprite('hola', 'spooky-erect/bgDark', -400, -200)
	scaleObject('hola',2,2)
	addLuaSprite('hola', false)
	
	makeLuaSprite('bgLight', 'spooky-erect/bgLight', -400, -200)
	scaleObject('bgLight',2,2)
	addLuaSprite('bgLight', false)
setProperty('bgLight.alpha',0)


makeLuaSprite('stairsDark', 'spooky-erect/stairsDark', 950, -150)
scaleObject('stairsDark',2,2)
addLuaSprite('stairsDark', true)

makeLuaSprite('stairsLight', 'spooky-erect/stairsLight', 950, -150)
scaleObject('stairsLight',2,2)
addLuaSprite('stairsLight', true)
setProperty('stairsLight.alpha',0)

	        makeFlxAnimateSprite("abot2", -18+400,300+100, "characters/abot/dark/abotSystem")
            loadAnimateAtlas("abot2", "characters/abot/dark/abotSystem")
            addAnimationBySymbol("abot2","lomatan", "Abot System", 24, true)
            addLuaSprite("abot2",false) 

	setBlendMode('halloweenBG', 'add')
	precacheSound('thunder_1')
	precacheSound('thunder_2')
end
skibidiULISEGAS=false
function onUpdate()
	if not skibidiULISEGAS then
	doTweenColor('asd0.001', 'sss4', 'F5D3A2', 0.000001)
doTweenColor('asd2', 'sss42', 'F5D3A2',        0.000001)
doTweenColor('asd3', 'sss43', 'F5D3A2',        0.000001)
doTweenColor('asd4', 'sss44', 'F5D3A2',        0.000001)
doTweenColor('asd5', 'sss45', 'F5D3A2',        0.000001)
doTweenColor('asd6', 'sss6', 'F5D3A2',         0.000001)

--
doTweenColor('asd','stereoBG','596274',2)
doTweenColor('as22d','White','596274',2)
	setObjectOrder('abot2',getObjectOrder('gfGroup')-1)
end
end
local lightningStrikeBeat = 0
local lightningOffset = 8

function onBeatHit()
    if curBeat % 1 == 0 and curBeat % 4 ~= 0 and zoom1 then
		triggerEvent('Add Camera Zoom', '', '0.035')
	  end
	  if curBeat % 2 == 0 and curBeat % 4 ~= 0 and zoom2 then
		triggerEvent('Add Camera Zoom', '', '0.035')
	  end
	  if curBeat % 4 == 0 and curStep >=63 and songName == 'Spookeez Erect' then
		triggerEvent('Add Camera Zoom', '', '0.01')
	  end
	  if curBeat % 4 == 0 and curStep >=127 and songName == 'South Erect' then
		triggerEvent('Add Camera Zoom', '', '0.01')
	  end
	if getRandomBool(10) and curBeat > lightningStrikeBeat + lightningOffset then
		triggerLightningStrike()
	end
end

function triggerLightningStrike()
	lightningStrikeBeat = curBeat
	lightningOffset = getRandomInt(8, 24)
	local soundName = string.format('thunder_%i', getRandomInt(1, 2))
	playSound(soundName, 1, 'thundah')
    triggerEvent('Play Animation','scared','GF')
	playAnim('boyfriend', 'scared')
	
	if cameraZoomOnBeat then
		setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015)
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03)
		
		if not getProperty('camZooming') then
			doTweenZoom('cG', 'camGame', getProperty('defaultCamZoom'), 0.5, 'linear')
			doTweenZoom('cH', 'camHUD', 1, 0.5, 'linear')
		end
	end
	
	doTweenAlpha('hWA', 'bgLight', 1, 0.075, 'linear')
	doTweenAlpha('hWA2', 'stairsLight', 1, 0.075, 'linear')

	doTweenAlpha('spooky', 'spooky', 1, 0.075, 'linear')
	doTweenAlpha('nene', 'nene', 1, 0.075, 'linear')
	doTweenAlpha('pico-mix', 'pico-mix', 1, 0.075, 'linear')

	doTweenAlpha('abot', 'abot', 1, 0.075, 'linear')
	doTweenAlpha('abot2', 'abot2', 0, 0.075, 'linear')

	doTweenColor('asd','stereoBG','ffffff',0.075)
doTweenColor('as22d','White','ffffff',     0.075)
	skibidiULISEGAS=true
end

function onTweenCompleted(tween)
	if tween == 'hWA' then
		doTweenAlpha('hWA2', 'stairsLight', 0, 2, 'linear')
		doTweenAlpha('hWA0', 'bgLight', 0, 2, 'linear')

		doTweenAlpha('spooky', 'spooky',0, 2, 'linear')
		doTweenAlpha('nene', 'nene',0, 2, 'linear')
		doTweenAlpha('pico-mix', 'pico-mix',0, 2, 'linear')
		doTweenAlpha('abot', 'abot', 0, 2, 'linear')
		doTweenAlpha('abot2', 'abot2', 1, 2, 'linear')

		doTweenColor('asd','stereoBG','596274',2)
		doTweenColor('as22d','White','596274',  2)
		skibidiULISEGAS=false
	end
end