function onCreate() 
    if shadersEnabled then  
        local ShaderName = 'rain'
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        scaleObject("camShader", 20.0, 20.0)
        setSpriteShader('camShader', ShaderName)
        

        makeAnimatedLuaSprite('ulirain', 'ulirain', 0, 0)
        addAnimationByPrefix('ulirain', 'idle', '', 28, true)
        scaleObject('ulirain',4,4)
        setProperty('ulirain.blend',0)
        addLuaSprite('ulirain',false)
        setObjectCamera('ulirain','hud')
skibidi=0.15
local memuerotio = false

function onUpdate(elapsed)
    setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd-pico');
    local health = getProperty('health')
    if getProperty('gf.animation.curAnim.finished') and getProperty('gf.animation.curAnim.name') == 'knifeRaise' and memuerotio then
        triggerEvent('Play Animation', 'knife', 'gf')
    end

    if health < 0.5 and not memuerotio then
        memuerotio = true
        triggerEvent('Play Animation', 'knifeRaise', 'gf')
    elseif health >= 0.5 and memuerotio then
        memuerotio = false
        triggerEvent('Play Animation', 'knifelower', 'gf')
    end

            setShaderFloat('camShader', 'iTime', os.clock())
            setShaderFloat('camShader', 'iIntensity', skibidi)
            setShaderFloat('camShader', 'iTimescale', 0.7)
            
        end
    end
end

function onGameOverStart()
    setProperty('camFollow.x',1300) 
   setProperty('boyfriend.x',780)
    setProperty('boyfriend.y',144)
    makeAnimatedLuaSprite('NeneKnifeToss', 'characters/NeneKnifeToss',getProperty('boyfriend.x')-400,getProperty('boyfriend.y')-200);
	addAnimationByPrefix('NeneKnifeToss', 'a', 'knife toss', 24, false)
	scaleObject('NeneKnifeToss', 1,1)
    setObjectOrder('NeneKnifeToss',998)
	addLuaSprite('NeneKnifeToss', false);
runTimer('ded',1.4)
runTimer('kxd',0.75)
    function onUpdate(elapsed)
        setShaderFloat('camShader', 'iTime',0)
        setShaderFloat('camShader', 'iIntensity', 0)
        setShaderFloat('camShader', 'iTimescale', 0)
    end
end
function onGameOverConfirm(retry)
    makeAnimatedLuaSprite('dead', 'characters/Pico_Death_Retry', 1170,200-30);
	addAnimationByPrefix('dead', 'a', 'Retry Text Confirm', 24, false)
	addAnimationByPrefix('dead', 'a2', 'Retry Text Loop', 24, true);
	scaleObject('dead', 2,2)
    cancelTimer('ded')
    setObjectOrder('dead',999)
	addLuaSprite('dead', false);
playAnim('dead','a',true)
setProperty('dead.x',940)
setProperty('dead.y',-50)
end
function onTimerCompleted(tag)
    if tag == 'kxd' then
        setProperty('NeneKnifeToss.alpha',0)
    end
if tag == 'ded' then
 
    makeAnimatedLuaSprite('dead', 'characters/Pico_Death_Retry', 1170,200-30);
	addAnimationByPrefix('dead', 'a', 'Retry Text Confirm', 24, false)
	addAnimationByPrefix('dead', 'a2', 'Retry Text Loop', 24, true);
	scaleObject('dead', 1,1)
    setObjectOrder('dead',999)
	addLuaSprite('dead', false);
end
end
function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end
