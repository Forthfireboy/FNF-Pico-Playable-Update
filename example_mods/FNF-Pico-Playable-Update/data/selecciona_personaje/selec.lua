
local images = {}
local selectedImage = nil

local positions = {
{x = 450, y = 130}, -- image 1
{x = 555, y = 130}, -- image 2
{x = 660, y = 130}, -- image 3
{x = 450, y = 260}, -- image 4
{x = 557, y = 260}, -- image 5
{x = 655, y = 260}, -- image 6
{x = 450, y = 385}, -- image 7
{x = 555, y = 385}, -- image 8
{x = 660, y = 385}  -- image 9
}

local currentPosIndex = 5
local isActive = true
local function deactivateAll()
    isActive = false
end

function onCreate()
setProperty('skipCountdown', true)
setProperty('camHUD.alpha', 0)
setProperty('camGame.alpha', 0)
playMusic('selector', 1, true)

-- Cargar fondos
makeLuaSprite('bg1', 'freeplay/charasele/bgwall', 0, 0)
setObjectCamera('bg1', 'other')
addLuaSprite('bg1')

makeAnimatedLuaSprite('bg2', 'freeplay/charasele/UnVideoMasMiGente', -15, 250)
addAnimationByPrefix('bg2', 'idle', 'idle', 8, true)
scaleObject('bg2', 1, 1)
setObjectCamera('bg2', 'other')
addLuaSprite('bg2')

makeLuaSprite('bg3', 'freeplay/charasele/bgfloor', 0, 0)
setObjectCamera('bg3', 'other')
addLuaSprite('bg3')

makeLuaSprite('bgname', 'freeplay/charasele/bgname', 0, 0)
setObjectCamera('bgname', 'other')
addLuaSprite('bgname')

makeLuaSprite('namebf', 'freeplay/charasele/namebf', 830, 50)
setObjectCamera('namebf', 'other')
addLuaSprite('namebf')
setProperty('namebf.alpha', 0)

makeLuaSprite('namepico', 'freeplay/charasele/namepico', 880, 50)
setObjectCamera('namepico', 'other')
addLuaSprite('namepico')
setProperty('namepico.alpha', 0)

makeLuaSprite('namefire', 'freeplay/charasele/namefire', 830, 50)
setObjectCamera('namefire', 'other')
addLuaSprite('namefire')
setProperty('namefire.alpha', 0)

makeLuaSprite('namelock', 'freeplay/charasele/namelocked', 910, 45)
setObjectCamera('namelock', 'other')
addLuaSprite('namelock')
setProperty('namelock.alpha', 0)

makeLuaSprite('bg4', 'freeplay/charasele/bordesele', 0, 0)
setObjectCamera('bg4', 'other')
addLuaSprite('bg4')

makeLuaSprite('bgrefe', 'freeplay/lock/bgrefelock', 0, 0)
setObjectCamera('bgrefe', 'other')
addLuaSprite('bgrefe')
setProperty('bgrefe.alpha', 0)

-- Crear personajes animados

-- bf y gf
makeAnimatedLuaSprite('bfchara', 'freeplay/charasele/character-bf', 590, 205)
addAnimationByPrefix('bfchara', 'idle', 'Character-bf idle', 12, true)
addAnimationByPrefix('bfchara', 'enter', 'Character-bf enter', 12, true)
addAnimationByPrefix('bfchara', 'move', 'Character-bf Intro', 12, true)
addAnimationByPrefix('bfchara', 'bye', 'Character-bf Bye', 12, true)
scaleObject('bfchara', 1, 1)
setObjectCamera('bfchara', 'other')
playAnim('bfchara', 'idle', true)
addLuaSprite('bfchara')
setProperty('bfchara.alpha', 0)

makeAnimatedLuaSprite('gfchara', 'freeplay/charasele/character-gf', 70, 240)
addAnimationByPrefix('gfchara', 'idle', 'idle', 12, true)
addAnimationByPrefix('gfchara', 'enter', 'enter', 12, true)
setObjectCamera('gfchara', 'other')
playAnim('gfchara', 'idle', true)
addLuaSprite('gfchara')
setProperty('gfchara.alpha', 0)

-- pico y nene
makeAnimatedLuaSprite('picochara', 'freeplay/charasele/character-pico', 625, 230)
addAnimationByPrefix('picochara', 'idle', 'Character-pico idle', 12, true)
addAnimationByPrefix('picochara', 'enter', 'Character-pico enter', 12, true)
addAnimationByPrefix('picochara', 'move', 'Character-pico intro', 12, true)
addAnimationByPrefix('picochara', 'bye', 'Character-pico Bye', 12, true)
scaleObject('picochara', 1, 1)
setObjectCamera('picochara', 'other')
playAnim('picochara', 'idle', true)
addLuaSprite('picochara')
setProperty('picochara.alpha', 0)

makeAnimatedLuaSprite('nenechara', 'freeplay/charasele/character-nene', 10, 190)
addAnimationByPrefix('nenechara', 'idle', 'Character-nene idle', 10, true)
addAnimationByPrefix('nenechara', 'enter', 'Character-nene Enter', 10, true)
scaleObject('nenechara', 1, 1)
setObjectCamera('nenechara', 'other')
playAnim('nenechara', 'idle', true)
addLuaSprite('nenechara')
setProperty('nenechara.alpha', 0)

-- fire y ...nadie :(
makeAnimatedLuaSprite('firechara', 'freeplay/charasele/character-fire', 520, 70)
addAnimationByPrefix('firechara', 'idle', 'idle', 12, true)
addAnimationByPrefix('firechara', 'enter', 'enter', 12, true)
addAnimationByPrefix('firechara', 'move', 'intro', 12, true)
addAnimationByPrefix('firechara', 'bye', 'bye', 12, true)
scaleObject('firechara', 0.42, 0.42)
setObjectCamera('firechara', 'other')
playAnim('firechara', 'idle', true)
addLuaSprite('firechara', true)
setProperty('firechara.alpha', 1)

makeAnimatedLuaSprite('lockcharagf', 'freeplay/charasele/character-locked', 10, 180)
addAnimationByPrefix('lockcharagf', 'idle', 'Character-locked idle', 12, true)
setObjectCamera('lockcharagf', 'other')
playAnim('lockcharagf', 'idle', true)
addLuaSprite('lockcharagf')
setProperty('lockcharagf.flipX', true)
setProperty('lockcharagf.alpha', 0)

-- nadie
makeAnimatedLuaSprite('lockchara', 'freeplay/charasele/character-locked', 735, 180)
addAnimationByPrefix('lockchara', 'idle', 'Character-locked idle', 12, true)
setObjectCamera('lockchara', 'other')
playAnim('lockchara', 'idle', true)
addLuaSprite('lockchara')
setProperty('lockchara.alpha', 0)

makeLuaSprite('bg4', 'freeplay/charasele/bordesele', 0, 0)
setObjectCamera('bg4', 'other')
addLuaSprite('bg4')

makeLuaSprite('bg5', 'freeplay/charasele/bgcorne', 0, 0)
setObjectCamera('bg5', 'other')
addLuaSprite('bg5')

for i = 1, 9 do
local imageName = tostring(i)
makeLuaSprite(imageName, 'freeplay/lock/' .. imageName, positions[i].x, positions[i].y)
setObjectCamera(imageName, 'other')
addLuaSprite(imageName)
table.insert(images, imageName)
end

makeLuaSprite('select', 'freeplay/lock/select', positions[currentPosIndex].x, positions[currentPosIndex].y)
setObjectCamera('select', 'other')
addLuaSprite('select', true)

makeLuaSprite('nig', 'imagenoscura', 0, 0)
    setObjectCamera('nig', 'other')
    addLuaSprite('nig', true)
    setProperty('nig.alpha', 0)

selectImage()
end

function selectImage()
local imageName = tostring(currentPosIndex)
setProperty(imageName .. '.scale.x', 1.5)
setProperty(imageName .. '.scale.y', 1.5)
setProperty(imageName .. '.alpha', 1)

if currentPosIndex == 4 then
setProperty('namebf.alpha', 0)
setProperty('gfchara.alpha', 0)
setProperty('lockcharagf.alpha', 0)
playAnim('bfchara', 'bye', true)
runTimer('bfsefue', 0.2)
playAnim('firechara', 'bye', true)
runTimer('firesefue', 0.1)
setProperty('namefire.alpha', 0)

setProperty('nenechara.alpha', 1)
setProperty('picochara.alpha', 1)
setProperty('namepico.alpha', 1)
playAnim('picochara', 'move', true)

setProperty('lockchara.alpha', 0)
setProperty('namelock.alpha', 0)
runTimer('picoidle', 0.3)

elseif currentPosIndex == 5 then
setProperty('bfchara.alpha', 1)
setProperty('gfchara.alpha', 1)
setProperty('namebf.alpha', 1)
playAnim('bfchara', 'move', true)

setProperty('nenechara.alpha', 0)
setProperty('namepico.alpha', 0)
playAnim('picochara', 'bye', true)
runTimer('picosefue', 0.2)
playAnim('firechara', 'bye', true)
runTimer('firesefue', 0.1)
setProperty('namefire.alpha', 0)

setProperty('lockcharagf.alpha', 0)
setProperty('lockchara.alpha', 0)
setProperty('namelock.alpha', 0)
runTimer('bfidle', 0.3)

elseif currentPosIndex == 6 then
setProperty('gfchara.alpha', 0)
setProperty('namebf.alpha', 0)
setProperty('nenechara.alpha', 0)
setProperty('namepico.alpha', 0)
setProperty('lockchara.alpha', 0)
setProperty('namelock.alpha', 0)
setProperty('lockcharagf.alpha', 1)
setProperty('firechara.alpha', 1)
playAnim('bfchara', 'bye', true)
runTimer('bfsefue', 0.2)
playAnim('picochara', 'bye', true)
runTimer('picosefue', 0.2)
playAnim('firechara', 'move', true)
runTimer('fireidle', 0.3)
setProperty('namefire.alpha', 1)

else
setProperty('bfchara.alpha', 0)
setProperty('gfchara.alpha', 0)
setProperty('namebf.alpha', 0)
setProperty('nenechara.alpha', 0)
setProperty('picochara.alpha', 0)
setProperty('namepico.alpha', 0)
setProperty('lockchara.alpha', 1)
setProperty('namelock.alpha', 1)
setProperty('lockcharagf.alpha', 0)
setProperty('firechara.alpha', 0)
setProperty('namefire.alpha', 0)
end
end

function deselectImage()
local imageName = tostring(currentPosIndex)
setProperty(imageName .. '.scale.x', 1)
setProperty(imageName .. '.scale.y', 1)
end

function onUpdate()
if isActive then
if keyJustPressed('left') then
playSound('CS_select',0.8)
deselectImage()
currentPosIndex = (currentPosIndex % 3 == 1) and (currentPosIndex + 2) or (currentPosIndex - 1)
moveSelectImage()
elseif keyJustPressed('right') then
    playSound('CS_select',0.8)
deselectImage()
currentPosIndex = (currentPosIndex % 3 == 0) and (currentPosIndex - 2) or (currentPosIndex + 1)
moveSelectImage()
elseif keyJustPressed('up') then
    playSound('CS_select',0.8)
deselectImage()
currentPosIndex = (currentPosIndex <= 3) and (currentPosIndex + 6) or (currentPosIndex - 3)
moveSelectImage()
elseif keyJustPressed('down') then
    playSound('CS_select',0.8)
deselectImage()
currentPosIndex = (currentPosIndex > 6) and (currentPosIndex - 6) or (currentPosIndex + 3)
moveSelectImage()
end
if keyPressed('accept') or keyPressed('space') or (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) then
activateCurrentImage()
runTimer('anima', 1.5)
end
end
end

function moveSelectImage()
doTweenX('selectX', 'select', positions[currentPosIndex].x, 0.1, 'linear')
doTweenY('selectY', 'select', positions[currentPosIndex].y, 0.1, 'linear')
selectImage()
end

function activateCurrentImage()
if currentPosIndex == 4 or currentPosIndex == 5 or currentPosIndex == 6 then
deactivateAll()
end

if currentPosIndex == 1 then
activateImage1()
elseif currentPosIndex == 2 then
activateImage2()
elseif currentPosIndex == 3 then
activateImage3()
elseif currentPosIndex == 4 then
activateImage4()
elseif currentPosIndex == 5 then
activateImage5()
elseif currentPosIndex == 6 then
activateImage6()
elseif currentPosIndex == 7 then
activateImage7()
elseif currentPosIndex == 8 then
activateImage8()
elseif currentPosIndex == 9 then
activateImage9()
end
end

function activateImage1()
playSound('CS_locked',0.8)
end

function activateImage2()
playSound('CS_locked',0.8)
end

function activateImage3()
playSound('CS_locked',0.8)
end

function activateImage4()
    playSound('CS_confirm',0.8)
playAnim('picochara', 'enter', true)
playAnim('nenechara', 'enter', true)
runTimer('picofree', 2)
end

function activateImage5()
    playSound('CS_confirm',0.8)
playAnim('bfchara', 'enter', true)
playAnim('gfchara', 'enter', true)
runTimer('bffree', 2)
end

function activateImage6()
playSound('CS_confirm',0.8)
playAnim('firechara', 'enter', true)
runTimer('firefree', 2)
end

function activateImage7()
playSound('CS_locked',0.8)
end

function activateImage8()
playSound('CS_locked',0.8)
end

function activateImage9()
playSound('CS_locked',0.8)
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'picoidle' then
playAnim('picochara', 'idle', true)
end
if tag == 'bfidle' then
playAnim('bfchara', 'idle', true)
end
if tag == 'fireidle' then
playAnim('firechara', 'idle', true)
end
if tag == 'bfsefue' then
setProperty('bfchara.alpha', 0)
end
if tag == 'picosefue' then
setProperty('picochara.alpha', 0)
end
if tag == 'firesefue' then
setProperty('firechara.alpha', 0)
end

if tag == 'bffree' then
loadSong("FREEPLAY_bf")
doTweenY('camOther.y', 'camOther', 0.4, -100, 'linear')
doTweenAlpha('nig.alpha', 'nig', 0.4, 0.6, 'linear')
end
if tag == 'picofree' then
loadSong("FREEPLAY_pico")
doTweenY('camOther.y', 'camOther', 0.4, -100, 'linear')
doTweenAlpha('nig.alpha', 'nig', 0.4, 0.6, 'linear')
end
if tag == 'firefree' then
loadSong("FREEPLAY_fire")
end

if tag == 'anima' then
doTweenAlpha('nig.alpha', 'nig', 1, 0.5, 'linear')
doTweenY('camOther.y', 'camOther', -100, 0.5, 'linear')
end
end

function onStartCountdown()
    return Function_Stop
end