------------------SETTINGS

maxsongs = 10                                                                  -- Put here the max songs that you add (If your total songs are 4, you need to put 4 here)

songs = {'hanging-on', 'puppetry', 'a-beautiful-end', 'run', 'sleepless-night', 'burnt-out', 'slowly', 'a-corrupted-duel', 'held-by-a-thread', 'borgor'}                        -- Put your song name here to add it to the freeplay!

------------------DON'T TOUCH NOTHING BELOW THIS TEXT

selected = 1

------------------

-- Thank you so much XooleDev
-- Pls follow her

function onCreate()
    
    makeAnimatedLuaSprite('a', 'androidcontrols/virtualbuttons', 1148, 588)
    addAnimationByPrefix('a', 'a', 'a', 24, false)
    addAnimationByPrefix('a', 'aPress', 'aPressed', 24, false)
    addLuaSprite('a', true)
    setObjectCamera('a', 'other')
 
    
    makeAnimatedLuaSprite('b', 'androidcontrols/virtualbuttons', 0, 588)
    addAnimationByPrefix('b', 'b', 'b', 24, false)
    addAnimationByPrefix('b', 'bPress', 'bPressed', 24, false)
    addLuaSprite('b', true)
    setObjectCamera('b', 'other')

    playMusic('classified_menu', 0.8, true)

    makeLuaText('name', '"0"', 500, 370, 30)
    setObjectCamera('name', 'camHUD')
    setTextColor('name', 'FFFFFF')
    setTextBorder('name', 0.2, '000000')
    setTextSize('name', 65)
    addLuaText('name')
end

function onCreatePost()
    setTextFont('name', 'pixel.otf')
    setProperty('name.size', 0.7)
end

function onStartCountdown()
    if not allowCountdown then
        return Function_Stop
    end
    allowCountdown = true
    return Function_Continue
end

function onUpdate()
    if (getMouseX('camHUD') > 1100 and getMouseX('camHUD') < 772) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('back') then
        exitMenu()
    end

    if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('left') then
        playSound('scrollMenu', 0.8)
        setProperty('image.x', 410)
        doTweenX('image', 'image', 310, 1, 'circOut')
        selected = (selected - 1 - 1) % maxsongs + 1
        playSound('SM64_Select')
    elseif (getMouseX('camHUD') > 1148 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('right') then
        playSound('scrollMenu', 0.8)
        setProperty('image.x', 410)
        doTweenX('image', 'image', 360, 1, 'circOut')
        selected = (selected % maxsongs) + 1
        playSound('SM64_Select')
    end

    if (getMouseX('camHUD') > 508 and getMouseX('camHUD') < 640) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('accept') then
        loadSong(songs[selected])
    end

    if songs[selected] then
        removeLuaSprite('image', true)
        setTextString('name', '' .. songs[selected])
        makeLuaSprite('image', 'freeplay/paintings/' .. songs[selected], 360, -
            -50)
        scaleObject('image', 1, 1)
        addLuaSprite('image')
    end

    if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('left') then
        objectPlayAnimation('left', 'leftPress', false)
    else
        objectPlayAnimation('left', 'left', true)
    end

    if (getMouseX('camHUD') > 1148 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('right') then
        objectPlayAnimation('right', 'rightPress', false)
    else
        objectPlayAnimation('right', 'right', true)
    end

    if (getMouseX('camHUD') > 508 and getMouseX('camHUD') < 640) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('accept') then
        objectPlayAnimation('a', 'aPress', false)
    else
        objectPlayAnimation('a', 'a', true)
    end

    if (getMouseX('camHUD') > 640 and getMouseX('camHUD') < 772) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('back') then
        objectPlayAnimation('b', 'bPress', false)
    else
        objectPlayAnimation('b', 'b', true)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if keyJustPressed('pause') and songName == 'Freeplay' then
        exitMenu()
    end
end

function exitMenu()
    exitSong(true)
end