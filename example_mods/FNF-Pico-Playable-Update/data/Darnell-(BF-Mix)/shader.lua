function onCreate() 
    if shadersEnabled then  
        local ShaderName = 'rain'
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        scaleObject("camShader", 20.0, 20.0)
        setSpriteShader('camShader', ShaderName)
        

        makeAnimatedLuaSprite('ulirain', 'ulirain', 0, 0)
        addAnimationByPrefix('ulirain', 'idle', '', 32, true)
        scaleObject('ulirain',4,4)
        setProperty('ulirain.blend',0)
        addLuaSprite('ulirain',false)
        setProperty('ulirain.alpha',0.29)
        setBlendMode('ulirain', 'add')
        setObjectCamera('ulirain','hud')
skibidi=0.0001
local memuerotio = false
    end
end
