function onCreate() 
    if shadersEnabled then  
        local ShaderName = 'rain'
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        scaleObject("camShader", 20, 20)
        setSpriteShader('camShader', ShaderName)

        makeAnimatedLuaSprite('ulirain', 'ulirain', 0, 0)
        addAnimationByPrefix('ulirain', 'idle', '', 28, true)
        scaleObject('ulirain',4,4)
        setProperty('ulirain.blend',0)
        addLuaSprite('ulirain',false)
        setObjectCamera('ulirain','hud')
skibidi=0.25
k=0
h=7
        function onUpdate(elapsed)
            setShaderFloat('camShader', 'iTime',k)
            if curStep >=1 then
                setShaderFloat('camShader', 'iTime',os.clock())
            else
                k = k + 0.0001
            end
            if curStep >=448 and curStep <=508 then
                k = k + 0.0001
                setShaderFloat('camShader', 'iTime',k)
            end
            if curStep >=508 and curStep<=1408 then
                setShaderFloat('camShader', 'iTime',os.clock())
            end
            if curStep >=1408 then
                k = k + 0.0001
                setShaderFloat('camShader', 'iTime',k)
            end
            if curStep <448 then
                setProperty("ulirain.animation.curAnim.frameRate", 24)
               end
               if curStep >448 and curStep <512 then
                setProperty("ulirain.animation.curAnim.frameRate", 12)
               else
                setProperty("ulirain.animation.curAnim.frameRate", 24)
               end
               if curStep >1408 then
                setProperty("ulirain.animation.curAnim.frameRate", 12)
               end
            setShaderFloat('camShader', 'iIntensity', skibidi)
            setShaderFloat('camShader', 'iTimescale', h)
            
        end
    end
end
local targetX = 9
local targetY = 90
local duration = 0.8 --esta mierda me costo ULI ULI RA RA RAAAAAAAAAAAAAAAA
local interval = 0.01 

function onGameOverStart()
    skibidi = 0
    k = 0
    h = 0
    
    setPropertyFromClass('flixel.FlxG', 'camera.scroll.x', -30) 
    setProperty('camFollow.x', -30) 
    setPropertyFromClass('flixel.FlxG', 'camera.scroll.y', -90) 
    setProperty('camFollow.y', -90) 
    runTimer('picozz', interval, math.floor(duration / interval))
    runTimer('yeah',1.5)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'yeah' then
        playAnim('boyfriend','deathLoop',true)
        playMusic('gameOver-pico')
    end
    if tag == 'picozz' then
        local currentX = getProperty('camFollow.x')
        local currentY = getProperty('camFollow.y')
        local stepX = (targetX - currentX) / loopsLeft
        local stepY = (targetY - currentY) / loopsLeft
        setPropertyFromClass('flixel.FlxG', 'camera.scroll.x', currentX + stepX)
        setProperty('camFollow.x', currentX + stepX)
        setPropertyFromClass('flixel.FlxG', 'camera.scroll.y', currentY + stepY)
        setProperty('camFollow.y', currentY + stepY)

        if loopsLeft == 0 then
 
            setPropertyFromClass('flixel.FlxG', 'camera.scroll.x', targetX)
            setProperty('camFollow.x', targetX)
            setPropertyFromClass('flixel.FlxG', 'camera.scroll.y', targetY)
            setProperty('camFollow.y', targetY)
        end
    end
end
function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end