
local images = {}
local selectedIndex = 1
local totalImages = 15
local moveStepX = 50
local moveStepY = 120
local selectedPosX = 380
local selectedPosY = 240
local textPosX = 480
local textPosY = 270

local imageData = {
{file = 'freeplay/picosongs/dadno', selectedFile = 'freeplay/picosongs/dadno_selected', text = 'bopeebo-pico-mix'},
{file = 'freeplay/picosongs/dadno', selectedFile = 'freeplay/picosongs/dadno_selected', text = 'fresh-pico-mix'},
{file = 'freeplay/picosongs/dadno', selectedFile = 'freeplay/picosongs/dadno_selected', text = 'dad-battle-pico-mix'},
{file = 'freeplay/picosongs/spokino', selectedFile = 'freeplay/picosongs/spokino_selected', text = 'spookeez-pico-mix'},
{file = 'freeplay/picosongs/spokino', selectedFile = 'freeplay/picosongs/spokino_selected', text = 'south-pico-mix'},
{file = 'freeplay/picosongs/picono', selectedFile = 'freeplay/picosongs/picono_selected', text = 'pico-pico-mix'},
{file = 'freeplay/picosongs/picono', selectedFile = 'freeplay/picosongs/picono_selected', text = 'philly-nice-pico-mix'},
{file = 'freeplay/picosongs/picono', selectedFile = 'freeplay/picosongs/picono_selected', text = 'blammed-pico-mix'},
{file = 'freeplay/picosongs/dadmomno', selectedFile = 'freeplay/picosongs/dadmomno_selected', text = 'eggnog-pico-mix'},
{file = 'freeplay/picosongs/tankno', selectedFile = 'freeplay/picosongs/tankno_selected', text = 'ugh-pico-mix'},
{file = 'freeplay/picosongs/tankno', selectedFile = 'freeplay/picosongs/tankno_selected', text = 'guns-pico-mix'},
{file = 'freeplay/picosongs/darnelno', selectedFile = 'freeplay/picosongs/darnelno_selected', text = 'darnell'},
{file = 'freeplay/picosongs/darnelno', selectedFile = 'freeplay/picosongs/darnelno_selected', text = 'lit-up'},
{file = 'freeplay/picosongs/darnelno', selectedFile = 'freeplay/picosongs/darnelno_selected', text = '2hot'},
{file = 'freeplay/picosongs/darnelno', selectedFile = 'freeplay/picosongs/darnelno_selected', text = 'blazin'}
}

function onCreate()
setProperty('skipCountdown', true)
runTimer('ini', 0.0001)

makeLuaSprite('bg1', 'freeplay/bgpico', 0, 0)
setObjectCamera('bg1', 'other')
addLuaSprite('bg1', true)

-- Armas
makeLuaSprite('arma1', 'freeplay/arma1', 0, 0)
setObjectCamera('arma1', 'other')
addLuaSprite('arma1', true)

makeLuaSprite('arma12', 'freeplay/arma1', -1149, 0)
setObjectCamera('arma12', 'other')
addLuaSprite('arma12', true)

makeLuaSprite('arma2', 'freeplay/arma2', 0, 0)
setObjectCamera('arma2', 'other')
addLuaSprite('arma2', true)

makeLuaSprite('arma22', 'freeplay/arma2', -1147, 0)
setObjectCamera('arma22', 'other')
addLuaSprite('arma22', true)

makeLuaSprite('arma3', 'freeplay/arma3', 0, 0)
setObjectCamera('arma3', 'other')
addLuaSprite('arma3', true)

makeLuaSprite('arma32', 'freeplay/arma3', -758, 0)
setObjectCamera('arma32', 'other')
addLuaSprite('arma32', true)

-- Pico
makeAnimatedLuaSprite('Pico', 'freeplay/freeplay-pico', -60, -200)
addAnimationByPrefix('Pico', 'default', 'freeplay-pico idle', 12, true)
addAnimationByPrefix('Pico', 'intro', 'freeplay-pico intro', 8, true)
addAnimationByPrefix('Pico', 'enter', 'freeplay-pico Enter', 12, true)
scaleObject('Pico', 1, 1)
setObjectCamera('Pico', 'other')
addLuaSprite('Pico', true)
playAnim('Pico', 'intro', true)
setProperty('Pico.visible', true)

makeLuaSprite('ui1', 'freeplay/ui1', 0, 0)
setObjectCamera('ui1', 'other')
addLuaSprite('ui1', true)

makeLuaSprite('albu2', 'freeplay/expansion2', 0, 0)
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

makeLuaSprite('image' .. i, imgData.file, selectedPosX, selectedPosY + (i - selectedIndex) * moveStepY)
setObjectCamera('image' .. i, 'other')
addLuaSprite('image' .. i, true)
setProperty('image' .. i .. '.alpha', 0.8)

images[i] = {sprite = 'image' .. i, text = 'text' .. i, bg = 'bgImage' .. i, func = imgData.func, selectedFile = imgData.selectedFile}

makeLuaSprite('ui2', 'freeplay/ui2', 0, 0)
setObjectCamera('ui2', 'other')
addLuaSprite('ui2', true)
end

updateImagePositions()
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'ini' then
doTweenX('arma1.x', 'arma1', 1149, 5, 'linear')
doTweenX('arma12.x', 'arma12', 0, 5, 'linear')
doTweenX('arma2.x', 'arma2', 1147, 5, 'linear')
doTweenX('arma22.x', 'arma22', 0, 5, 'linear')
doTweenX('arma3.x', 'arma3', 758, 5, 'linear')
doTweenX('arma32.x', 'arma32', 0, 5, 'linear')

runTimer('regre', 5)
elseif tag == 'regre' then
doTweenX('arma1.x', 'arma1', 0, 0.0001, 'linear')
doTweenX('arma12.x', 'arma12', -1149, 0.0001, 'linear')
doTweenX('arma2.x', 'arma2', 0, 0.0001, 'linear')
doTweenX('arma22.x', 'arma22', -1147, 0.0001, 'linear')
doTweenX('arma3.x', 'arma3', 0, 0.0001, 'linear')
doTweenX('arma32.x', 'arma32', -758, 0.0001, 'linear')

runTimer('ini', 0.0001)
end
end
function onStepHit()
if curStep == 6 then
playAnim('Pico', 'default', true)
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
doTweenY(img.text .. '.y', img.text, textPosY + offsetY, 0.2, 'linear')
doTweenY(img.bg .. '.y', img.bg, selectedPosY + offsetY, 0.2, 'linear')
end
else
local offsetX = (i - selectedIndex) * -moveStepX + selectedPosX
doTweenX(img.sprite .. '.x', img.sprite, offsetX, 0.2, 'linear')
doTweenY(img.sprite .. '.y', img.sprite, selectedPosY + offsetY, 0.2, 'linear')
doTweenX(img.text .. '.x', img.text, textPosX + (i - selectedIndex) * -moveStepX, 0.2, 'linear')
doTweenY(img.text .. '.y', img.text, textPosY + offsetY, 0.2, 'linear')
doTweenX(img.bg .. '.x', img.bg, offsetX, 0.2, 'linear')
doTweenY(img.bg .. '.y', img.bg, selectedPosY + offsetY, 0.2, 'linear')
end

setProperty(img.sprite .. '.alpha', i == selectedIndex and 1 or 0.8)
end
end

function onUpdate()
if keyJustPressed('up') then
moveSelectionUp()
elseif keyJustPressed('down') then
moveSelectionDown()
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

function on EndSong()
restartSong(true);
end