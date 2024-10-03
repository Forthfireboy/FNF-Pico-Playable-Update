
function onCreatePost()
	addHaxeLibrary('FlxBackdrop', 'flixel.addons.display')
	runHaxeCode([[
	  var ulisegaswasherexd = new FlxBackdrop(Paths.image('phillyStreets/phillyBlazin/skyBlur'), 0x11, 0, 100);
	  ulisegaswasherexd.scale.set(0.95,0.95);
	  ulisegaswasherexd.velocity.set(-100,0);
	  ulisegaswasherexd.scrollFactor.set(1, 1);
      insert(1,ulisegaswasherexd)
	]])
  end
function onCreate()
    local skyX, skyY = 580, 1100
    local flashingX, flashingY = 1000, 1000
    local streetX, streetY = 580, 1100
    local rainX, rainY = -200, 150
    local introX, introY = 90, 645
    local scaleValue = 0.95
    local rainScale = 2
    local introWidth, introHeight = 3000, 2001
    local introAlpha = 0.2

    makeLuaSprite('skyBackground', 'phillyStreets/phillyBlazin/skyBlur', skyX, skyY)
    scaleObject('skyBackground', scaleValue, scaleValue)

    makeAnimatedLuaSprite('flashingLightning', 'phillyStreets/phillyBlazin/lightning', flashingX, flashingY)
    addAnimationByPrefix('flashingLightning', 'flash', 'lightning', 24, false)
    scaleObject('flashingLightning', scaleValue, scaleValue)
    objectPlayAnimation('flashingLightning', 'flash', true)

    makeLuaSprite('streetForeground', 'phillyStreets/phillyBlazin/streetBlur', streetX, streetY)
    scaleObject('streetForeground', scaleValue, scaleValue)

    addLuaSprite('skyBackground', false)
    addLuaSprite('flashingLightning', true)
    addLuaSprite('streetForeground', false)

    makeLuaSprite('introOverlay', '', introX, introY)
    luaSpriteMakeGraphic('introOverlay', introWidth, introHeight, '000000')
    addLuaSprite('introOverlay', true)
    setProperty('introOverlay.alpha', introAlpha)

    cameraFlash('other', '000000', 2)
end

local sounds = {'Lightning1', 'Lightning2', 'Lightning3'}

function onBeatHit()
    if curBeat % 27 == 0 then
        local randomSound = sounds[math.random(#sounds)]
        local randomX = math.random(950, 1500)

        playSound(randomSound, 2)
        cameraFlash('camGame', 'FFFFFF', 0.75)
        objectPlayAnimation('flashingLightning', 'flash', true)
        setProperty('flashingLightning.x', randomX)
    end
end

local allowCountdown = false

function onEndSong()
    if isStoryMode and not seenCutscene then
        function onBeatHit()end
        startVideo('blazinCutscene')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end
function onUpdate()
	if isStoryMode then

end
end