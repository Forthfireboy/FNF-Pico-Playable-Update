-- FREEPLAY fire

local images = {}
local selectedIndex = 1
local totalImages = 3
local moveStepX = 50
local moveStepY = 120
local selectedPosX = 380
local selectedPosY = 240
local textPosX = 480
local textPosY = 270

local imageData = {
{file = 'freeplay/firesongs/dadno', selectedFile = 'freeplay/firesongs/dadsi', text = 'dad-battle Erect'},
-- spoki
{file = 'freeplay/firesongs/spokino', selectedFile = 'freeplay/firesongs/spokisi', text = 'south Erect'},
-- pico
{file = 'freeplay/firesongs/picono', selectedFile = 'freeplay/firesongs/picosi', text = 'blammed Erect'}
}

function onCreate()
    setProperty('skipCountdown', true)
    runTimer('ini', 0.0001)
    playMusic('freeplay', 1, true)
    runTimer('normal', 0.6)

    makeLuaSprite('bg1', 'freeplay/bgfire', 0, 0)
    setObjectCamera('bg1', 'other')
    addLuaSprite('bg1')
    
-- letras
    makeLuaSprite('letra1', 'freeplay/fireletra1', 0, 0)
    setObjectCamera('letra1', 'other')
    addLuaSprite('letra1')
    
    makeLuaSprite('letra12', 'freeplay/fireletra1', 734, 0)
    setObjectCamera('letra12', 'other')
    addLuaSprite('letra12')
runTimer('letra1', 0.0001)
    
    makeLuaSprite('letra2', 'freeplay/firecara', 0, 0)
    setObjectCamera('letra2', 'other')
    addLuaSprite('letra2')
    
makeLuaSprite('letra22', 'freeplay/firecara', -672, 0)
setObjectCamera('letra22', 'other')
addLuaSprite('letra22')
runTimer('letra2', 0.0001)

makeLuaSprite('letra3', 'freeplay/firesenal', 0, 0)
    setObjectCamera('letra3', 'other')
    addLuaSprite('letra3')
    
    makeLuaSprite('letra32', 'freeplay/firesenal', 745, 0)
    setObjectCamera('letra32', 'other')
    addLuaSprite('letra32')
runTimer('letra3', 0.0001)
    
    makeLuaSprite('letra4', 'freeplay/fireletra2', 0, 0)
    setObjectCamera('letra4', 'other')
    addLuaSprite('letra4')
    
    makeLuaSprite('letra42', 'freeplay/fireletra2', -672, 0)
    setObjectCamera('letra42', 'other')
    addLuaSprite('letra42')
runTimer('letra4', 0.0001)
    
-- selected
makeAnimatedLuaSprite('bgfiresele', 'freeplay/bgfiresele', 0, 0)
addAnimationByPrefix('bgfiresele', 'default', 'idle', 17, true)
scaleObject('bgfiresele', 1, 1)
setObjectCamera('bgfiresele', 'other')
addLuaSprite('bgfiresele')
setProperty('bgfiresele.alpha', 0)

-- fire
makeAnimatedLuaSprite('fire', 'freeplay/freeplay-fire', -177, -240)
addAnimationByPrefix('fire', 'default', 'idle', 12, true)
addAnimationByPrefix('fire', 'enter', 'enter', 17, true)
addAnimationByPrefix('fire', 'sele', 'selec', 12, true)
scaleObject('fire', 1, 1)
setObjectCamera('fire', 'other')
addLuaSprite('fire')
playAnim('fire', 'default', true)
setProperty('fire.visible', true)

makeLuaSprite('uiuno', 'freeplay/ui1fire', 0, 0)
setObjectCamera('uiuno', 'other')
addLuaSprite('uiuno', true)

makeLuaSprite('albu2', 'freeplay/expansionfire1', 0, 0)
setObjectCamera('albu2', 'other')
addLuaSprite('albu2', true)

    for i = 1, totalImages do
        local imgData = imageData[i]

        makeLuaSprite('bgImage' .. i, 'freeplay/picosongs/fondo', selectedPosX, selectedPosY + (i - selectedIndex) * moveStepY)
        setObjectCamera('bgImage' .. i, 'other')
        addLuaSprite('bgImage' .. i, true)

        makeLuaText('text' .. i, imgData.text, 500, textPosX, textPosY + (i - selectedIndex) * moveStepY)
        setTextAlignment('text' .. i, 'left')
        setObjectCamera('text' .. i, 'other')
        addLuaText('text' .. i)
        setTextSize('text' .. i, 28)
        setTextColor('text' .. i, 'ff0000')
        setTextFont('text' .. i,'LED Dot-Matrix.ttf')

        makeLuaSprite('image' .. i, imgData.file, selectedPosX, selectedPosY + (i - selectedIndex) * moveStepY)
        setObjectCamera('image' .. i, 'other')
        addLuaSprite('image' .. i, true)
        setProperty('image' .. i .. '.alpha', 1)
    

    images[i] = {sprite = 'image' .. i, text = 'text' .. i, bg = 'bgImage' .. i, func = 'imageFunc' .. i, selectedFile = imgData.selectedFile, appearSprite = 'appearImage' .. i}
    end
    
makeLuaSprite('ui2', 'freeplay/ui2', 0, 0)
setObjectCamera('ui2', 'other')
addLuaSprite('ui2', true)

makeLuaSprite('erect', 'freeplay/erectfire', 0, 0)
setObjectCamera('erect', 'other')
addLuaSprite('erect', true)

makeLuaSprite('nig', 'imagenoscura', 0, 0)
    setObjectCamera('nig', 'other')
    addLuaSprite('nig', true)
    setProperty('nig.alpha', 0)

    updateImagePositions()
end

function changeSelectedImage(index)
    local img = images[index]
    setProperty(img.sprite .. '.visible', false)
    makeLuaSprite(img.sprite, img.selectedFile, selectedPosX, selectedPosY)
    setObjectCamera(img.sprite, 'other')
    addLuaSprite(img.sprite, true)
    setProperty(img.sprite .. '.alpha', 1)
    
    for i = 1, totalImages do
        local img = images[i]
        if i == index then
            setProperty(img.sprite .. '.visible', false)
            makeLuaSprite(img.sprite, img.selectedFile, selectedPosX, selectedPosY)
            setObjectCamera(img.sprite, 'other')
            addLuaSprite(img.sprite, true)
            setProperty(img.sprite .. '.alpha', 1)
            setProperty(img.appearSprite .. '.visible', true)
        else
            setProperty(img.appearSprite .. '.visible', false)
        end
    end
end

function onUpdate()
    if keyJustPressed('up') then
        playSound('scrollMenu',0.8)
        moveSelectionUp()
    elseif keyJustPressed('down') then
        moveSelectionDown()
        playSound('scrollMenu',0.8)
    end
    
    if (getMouseX('camHUD') > 1148 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('accept') then
        activateCurrentImage()
        doTweenAlpha('bgfiresele.alpha', 'bgfiresele', 1, 0.4, 'linear')
        runTimer('tiesos', 1)
    end
   if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 772) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('back') then
       playSound('confirmMenu',0.8)
runTimer('selec', 1)
playAnim('fire', 'sele', true)
doTweenAlpha('nig.alpha', 'nig', 1, 1.8, 'linear')
end
end

function moveSelectionUp()
    if selectedIndex > 1 then
        selectedIndex = selectedIndex - 1
        updateImagePositions()
    end
end

function moveSelectionDown()
    if selectedIndex < totalImages then
        selectedIndex = selectedIndex + 1
        updateImagePositions()
    end
end

function updateImagePositions()
    for i = 1, totalImages do
        local img = images[i]
        local offsetY = (i - selectedIndex) * moveStepY

        if i < selectedIndex then
            if i == selectedIndex - 1 then
                doTweenX(img.sprite .. '.x', img.sprite, selectedPosX - 50, 0.2, 'linear')
                doTweenY(img.sprite .. '.y', img.sprite, selectedPosY + offsetY, 0.2, 'linear')
                doTweenX(img.text .. '.x', img.text, textPosX - 50, 0.2, 'linear')
                doTweenY(img.text .. '.y', img.text, textPosY + offsetY, 0.2, 'linear')
                doTweenX(img.bg .. '.x', img.bg, selectedPosX - 50, 0.2, 'linear')
                doTweenY(img.bg .. '.y', img.bg, selectedPosY + offsetY, 0.2, 'linear')
                
            else
                doTweenY(img.sprite .. '.y', img.sprite, selectedPosY + offsetY, 0.2, 'linear')
                doTweenX(img.text .. '.x', img.text, textPosX - 50, 0.2, 'linear')
                doTweenY(img.text .. '.y', img.text, textPosY + offsetY, 0.2, 'linear')
                doTweenX(img.bg .. '.x', img.bg, selectedPosX - 50, 0.2, 'linear')
                doTweenY(img.bg .. '.y', img.bg, selectedPosY + offsetY, 0.2, 'linear')
            end
            
     elseif i == selectedIndex then
            doTweenX(img.sprite .. '.x', img.sprite, selectedPosX, 0.2, 'linear')
            doTweenY(img.sprite .. '.y', img.sprite, selectedPosY, 0.2, 'linear')
            doTweenX(img.text .. '.x', img.text, textPosX, 0.2, 'linear')
            doTweenY(img.text .. '.y', img.text, textPosY, 0.2, 'linear')
            doTweenX(img.bg .. '.x', img.bg, selectedPosX, 0.2, 'linear')
            doTweenY(img.bg .. '.y', img.bg, selectedPosY, 0.2, 'linear')
        else
   
         local offsetX = (i - selectedIndex) * -moveStepX + selectedPosX
            doTweenX(img.sprite .. '.x', img.sprite, offsetX, 0.2, 'linear')
            doTweenY(img.sprite .. '.y', img.sprite, selectedPosY + offsetY, 0.2, 'linear')
            doTweenX(img.text .. '.x', img.text, textPosX + (i - selectedIndex) * -moveStepX, 0.2, 'linear')
            doTweenY(img.text .. '.y', img.text, textPosY + offsetY, 0.2, 'linear')
            doTweenX(img.bg .. '.x', img.bg, offsetX, 0.2, 'linear')
            doTweenY(img.bg .. '.y', img.bg, selectedPosY + offsetY, 0.2, 'linear')
        end

        setProperty(img.sprite .. '.alpha', i == selectedIndex and 1 or 1)
    end
end

function activateCurrentImage()
    if selectedIndex > 0 and selectedIndex <= totalImages then
        _G[images[selectedIndex].func]()
    end
end

-- Funciones para cada imagen
function imageFunc1()
runTimer('song1', 1.6)
playSound('confirmMenu',0.8)
playAnim('fire', 'enter', true)
playAnim('fire', 'enter', true)
changeSelectedImage(1)
end

function imageFunc2()
runTimer('song2', 1.6)
playSound('confirmMenu',0.8)
playAnim('fire', 'enter', true)
playAnim('fire', 'enter', true)
changeSelectedImage(2)
end

function imageFunc3()
runTimer('song3', 1.6)
playSound('confirmMenu',0.8)
playAnim('fire', 'enter', true)
playAnim('fire', 'enter', true)
changeSelectedImage(3)
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'letra1' then
doTweenX('letra1.x', 'letra1', -1017, 5, 'linear')
doTweenX('letra12.x', 'letra12', 0, 5, 'linear')

doTweenX('letra2.x', 'letra2', 570, 5, 'linear')
doTweenX('letra22.x', 'letra22', 0, 5, 'linear')

doTweenX('letra3.x', 'letra3', -791, 5, 'linear')
doTweenX('letra32.x', 'letra32', 0, 5, 'linear')

doTweenX('letra4.x', 'letra4', 1017, 5, 'linear')
doTweenX('letra42.x', 'letra42', 0, 5, 'linear')

runTimer('letra1regre', 5)

elseif tag == 'letra1regre' then
doTweenX('letra1.x', 'letra1',0, 0.0001, 'linear')
doTweenX('letra12.x', 'letra12', 1017, 0.0001, 'linear')

doTweenX('letra2.x', 'letra2',0, 0.0001, 'linear')
doTweenX('letra22.x', 'letra22', -570, 0.0001, 'linear')

doTweenX('letra3.x', 'letra3',0, 0.0001, 'linear')
doTweenX('letra32.x', 'letra32', 791, 0.0001, 'linear')

doTweenX('letra4.x', 'letra4',0, 0.0001, 'linear')
doTweenX('letra42.x', 'letra42', -1017, 0.0001, 'linear')

runTimer('letra1', 0.0001)
end

if tag == 'selec' then
loadSong('selecciona_personaje')
end

   if tag == 'song1' then
loadSong('dad-battle-(fire-mix)')
end

   if tag == 'song2' then
loadSong('south-(fire-mix)')
end

   if tag == 'song3' then
loadSong('blammed-(fire-mix)')
end

   if tag == 'tiesos' then
addAnimationByPrefix('fire', 'enter', 'enter0010', 12, true)
addAnimationByPrefix('bgfiresele', 'default', 'idle0018', 17, true)
end

   if tag == 'normal' then
playAnim('fire', 'default', true)
end
end

function onStartCountdown()
    return Function_Stop
end