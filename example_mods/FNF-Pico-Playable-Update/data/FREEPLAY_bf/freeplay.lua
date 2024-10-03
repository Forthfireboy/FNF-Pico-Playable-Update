-- FREEPLAY bf

local images = {}
local selectedIndex = 1
local totalImages = 17
local moveStepX = 50
local moveStepY = 120
local selectedPosX = 380
local selectedPosY = 240
local textPosX = 480
local textPosY = 270

local imageData = {
{file = 'freeplay/bfsongs/dadno', selectedFile = 'freeplay/bfsongs/dadsi', text = 'bopeebo Erect'},

{file = 'freeplay/bfsongs/dadno', selectedFile = 'freeplay/bfsongs/dadsi', text = 'fresh Erect'},

{file = 'freeplay/bfsongs/dadno', selectedFile = 'freeplay/bfsongs/dadsi', text = 'dad-battle Erect'},
-- spoki
{file = 'freeplay/bfsongs/spokino', selectedFile = 'freeplay/bfsongs/spokisi', text = 'spookeez Erect'},

{file = 'freeplay/bfsongs/spokino', selectedFile = 'freeplay/bfsongs/spokisi', text = 'south Erect'},
-- pico
{file = 'freeplay/bfsongs/picono', selectedFile = 'freeplay/bfsongs/picosi', text = 'pico Erect'},

{file = 'freeplay/bfsongs/picono', selectedFile = 'freeplay/bfsongs/picosi', text = 'philly-nice Erect'},

{file = 'freeplay/bfsongs/picono', selectedFile = 'freeplay/bfsongs/picosi', text = 'blammed Erect'},
-- mom
{file = 'freeplay/bfsongs/momno', selectedFile = 'freeplay/bfsongs/momsi', text = 'satin-panties Erect',appearFile = 'expansionvol1'},

{file = 'freeplay/bfsongs/momno', selectedFile = 'freeplay/bfsongs/momsi', text = 'high Erect'},

--navidad
{file = 'freeplay/bfsongs/dadmomno', selectedFile = 'freeplay/bfsongs/dadmomsi', text = 'cocoa Erect',appearFile = 'fnfostvol3'},

{file = 'freeplay/bfsongs/dadmomno', selectedFile = 'freeplay/bfsongs/dadmomsi', text = 'eggnog Erect',appearFile = 'expansionvol1'},

-- sempai
{file = 'freeplay/bfsongs/sempaino', selectedFile = 'freeplay/bfsongs/sempaisi', text = 'senpai Erect'},

{file = 'freeplay/bfsongs/sempaino', selectedFile = 'freeplay/bfsongs/sempaisi', text = 'roses Erect'},

{file = 'freeplay/bfsongs/spirino', selectedFile = 'freeplay/bfsongs/spirisi', text = 'thorns Erect'},
-- tank
{file = 'freeplay/bfsongs/tankno', selectedFile = 'freeplay/bfsongs/tanksi', text = 'ugh Erect',appearFile = 'fnfostvol3'},
-- darnell
{file = 'freeplay/bfsongs/darnelno', selectedFile = 'freeplay/bfsongs/darnelsi', text = 'darnell-bf-mix',appearFile = 'fnfostvol3'}
}

function onCreate()
    setProperty('skipCountdown', true)
    runTimer('ini', 0.0001)
    playMusic('freeplay', 1, true)
    runTimer('normal', 0.6)

    makeLuaSprite('bg1', 'freeplay/bg', 0, 0)
    setObjectCamera('bg1', 'other')
    addLuaSprite('bg1')
    
-- letras
    makeLuaSprite('letra1', 'freeplay/letra1', 0, 0)
    setObjectCamera('letra1', 'other')
    addLuaSprite('letra1')
    
    makeLuaSprite('letra12', 'freeplay/letra1', 734, 0)
    setObjectCamera('letra12', 'other')
    addLuaSprite('letra12')
runTimer('letra1', 0.0001)
    
    makeLuaSprite('letra2', 'freeplay/letra2', 0, 0)
    setObjectCamera('letra2', 'other')
    addLuaSprite('letra2')
    
makeLuaSprite('letra22', 'freeplay/letra2', -672, 0)
setObjectCamera('letra22', 'other')
addLuaSprite('letra22')
runTimer('letra2', 0.0001)

makeLuaSprite('letra3', 'freeplay/letra3', 0, 0)
    setObjectCamera('letra3', 'other')
    addLuaSprite('letra3')
    
    makeLuaSprite('letra32', 'freeplay/letra3', 745, 0)
    setObjectCamera('letra32', 'other')
    addLuaSprite('letra32')
runTimer('letra3', 0.0001)
    
    makeLuaSprite('letra4', 'freeplay/letra4', 0, 0)
    setObjectCamera('letra4', 'other')
    addLuaSprite('letra4')
    
    makeLuaSprite('letra42', 'freeplay/letra4', -672, 0)
    setObjectCamera('letra42', 'other')
    addLuaSprite('letra42')
runTimer('letra4', 0.0001)
    

makeLuaSprite('letra5', 'freeplay/letra5', 0, 0)
    setObjectCamera('letra5', 'other')
    addLuaSprite('letra5')
    
    makeLuaSprite('letra52', 'freeplay/letra5', 733, 0)
    setObjectCamera('letra52', 'other')
    addLuaSprite('letra52')
runTimer('letra5', 0.0001)
    
    makeLuaSprite('letra6', 'freeplay/letra6', 0, 0)
    setObjectCamera('letra6', 'other')
    addLuaSprite('letra6')
    
makeLuaSprite('letra62', 'freeplay/letra6', -672, 0)
    setObjectCamera('letra62', 'other')
    addLuaSprite('letra62')
runTimer('letra6', 0.0001)

-- selected
    makeLuaSprite('bg1sele', 'freeplay/bgsele', 0, 0)
    setObjectCamera('bg1sele', 'other')
    addLuaSprite('bg1sele')
    setProperty('bg1sele.alpha', 0)
    
makeAnimatedLuaSprite('yeah', 'freeplay/yeah', -310, 110)
addAnimationByPrefix('yeah', 'idle', 'idle', 12, true)
scaleObject('yeah', 1, 1)
setObjectCamera('yeah', 'other')
addLuaSprite('yeah', true)
setProperty('yeah.alpha', 0)

-- bf
makeAnimatedLuaSprite('bfbg', 'freeplay/freeplay-bf', -40, -160)
addAnimationByPrefix('bfbg', 'default', 'freeplay-bf idle', 15, true)
addAnimationByPrefix('bfbg', 'intro', 'intro', 12, true)
addAnimationByPrefix('bfbg', 'enter', 'Enter', 12, true)
addAnimationByPrefix('bfbg', 'sele', 'selec', 12, true)
scaleObject('bfbg', 1, 1)
setObjectCamera('bfbg', 'other')
addLuaSprite('bfbg', true)
playAnim('bfbg', 'intro', true)
setProperty('bfbg.visible', true)

makeLuaSprite('uiuno', 'freeplay/ui1', 0, 0)
setObjectCamera('uiuno', 'other')
addLuaSprite('uiuno', true)

makeLuaSprite('albu2', 'freeplay/fnfostvol3', 0, 0)
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
        setTextColor('text' .. i, 'E0FFFF')
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

makeLuaSprite('erect', 'freeplay/erect', 0, 0)
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
        doTweenAlpha('bg1.alpha', 'bg1', 0, 0.4, 'linear')
    end
   if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 772) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('back') then
       playSound('confirmMenu',0.8)
runTimer('selec', 1)
playAnim('bfbg', 'sele', true)
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
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(1)
end

function imageFunc2()
runTimer('song2', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(2)
end

function imageFunc3()
runTimer('song3', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(3)
end

function imageFunc4()
runTimer('song4', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(4)
end

function imageFunc5()
runTimer('song5', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(5)
end

function imageFunc6()
runTimer('song6', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(6)
end

function imageFunc7()
runTimer('song7', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(7)
end

function imageFunc8()
runTimer('song8', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(8)
end

function imageFunc9()
runTimer('song9', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(9)
end

function imageFunc10()
runTimer('song10', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(10)
end

function imageFunc11()
runTimer('song11', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(11)
end

function imageFunc12()
runTimer('song12', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(12)
end

function imageFunc13()
runTimer('song13', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(13)
end

function imageFunc14()
runTimer('song14', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(14)
end

function imageFunc15()
runTimer('song15', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(15)
end

function imageFunc16()
runTimer('song16', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(16)
end

function imageFunc17()
runTimer('song17', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
playAnim('bfbg', 'enter', true)
setProperty('yeah.alpha', 1)
playAnim('yeah', 'idle', true)
changeSelectedImage(17)
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'letra1' then
doTweenX('letra1.x', 'letra1', -734, 5, 'linear')
doTweenX('letra12.x', 'letra12', 0, 5, 'linear')

doTweenX('letra2.x', 'letra2', 672, 5, 'linear')
doTweenX('letra22.x', 'letra22', 0, 5, 'linear')

doTweenX('letra3.x', 'letra3', -745, 5, 'linear')
doTweenX('letra32.x', 'letra32', 0, 5, 'linear')

doTweenX('letra4.x', 'letra4', 672, 5, 'linear')
doTweenX('letra42.x', 'letra42', 0, 5, 'linear')

doTweenX('letra5.x', 'letra5', -733, 5, 'linear')
doTweenX('letra52.x', 'letra52', 0, 5, 'linear')

doTweenX('letra6.x', 'letra6', 672, 5, 'linear')
doTweenX('letra62.x', 'letra62', 0, 5, 'linear')

runTimer('letra1regre', 5)

elseif tag == 'letra1regre' then
doTweenX('letra1.x', 'letra1',0, 0.0001, 'linear')
doTweenX('letra12.x', 'letra12', 734, 0.0001, 'linear')

doTweenX('letra2.x', 'letra2',0, 0.0001, 'linear')
doTweenX('letra22.x', 'letra22', -672, 0.0001, 'linear')

doTweenX('letra3.x', 'letra3',0, 0.0001, 'linear')
doTweenX('letra32.x', 'letra32', 745, 0.0001, 'linear')

doTweenX('letra4.x', 'letra4',0, 0.0001, 'linear')
doTweenX('letra42.x', 'letra42', -672, 0.0001, 'linear')

doTweenX('letra5.x', 'letra5',0, 0.0001, 'linear')
doTweenX('letra52.x', 'letra52', 733, 0.0001, 'linear')

doTweenX('letra6.x', 'letra6',0, 0.0001, 'linear')
doTweenX('letra62.x', 'letra62', -672, 0.0001, 'linear')

runTimer('letra1', 0.0001)
end

if tag == 'selec' then
loadSong('selecciona_personaje')
end

   if tag == 'song1' then
loadSong('bopeebo')
end

   if tag == 'song2' then
loadSong('fresh')
end

   if tag == 'song3' then
loadSong('dad-battle')
end

   if tag == 'song4' then
loadSong('spookeez')
end

   if tag == 'song5' then
loadSong('south')
end

   if tag == 'song6' then
loadSong('pico')
end

   if tag == 'song7' then
loadSong('philly-nice')
end

   if tag == 'song8' then
loadSong('blammed')
end

   if tag == 'song9' then
loadSong('satin-panties')
end

    if tag == 'song10' then
loadSong('high')
end

   if tag == 'song11' then
loadSong('cocoa')
end

   if tag == 'song12' then
loadSong('eggnog')
end

   if tag == 'song13' then
loadSong('senpai')
end

   if tag == 'song14' then
loadSong('roses')
end

   if tag == 'song15' then
loadSong('thorns')
end

   if tag == 'song16' then
loadSong('ugh')
end

   if tag == 'song17' then
loadSong('Darnell-(Bf-Mix)')
end

   if tag == 'normal' then
playAnim('bfbg', 'default', true)
end
end

function onStartCountdown()
    return Function_Stop
end