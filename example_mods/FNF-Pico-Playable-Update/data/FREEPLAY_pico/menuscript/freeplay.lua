-- freeplay PICO

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
{file = 'freeplay/picosongs/dadno', selectedFile = 'freeplay/picosongs/dadsi', text = 'bopeebo-(pico-mix)', resultImage = 'freeplay/picosongs/dadno_result'},
{file = 'freeplay/picosongs/dadno', selectedFile = 'freeplay/picosongs/dadno_selected', text = 'fresh-(pico-mix)', resultImage = 'freeplay/picosongs/fresh_result'},
{file = 'freeplay/picosongs/dadno', selectedFile = 'freeplay/picosongs/dadno_selected', text = 'dad-battle-(pico-mix)', resultImage = 'freeplay/picosongs/dad-battle_result'},
{file = 'freeplay/picosongs/spokino', selectedFile = 'freeplay/picosongs/spokino_selected', text = 'spookeez (pico-mix)', resultImage = 'freeplay/picosongs/spookeez_result'},
{file = 'freeplay/picosongs/spokino', selectedFile = 'freeplay/picosongs/spokino_selected', text = 'south-(pico-mix)', resultImage = 'freeplay/picosongs/south_result'},
{file = 'freeplay/picosongs/picono', selectedFile = 'freeplay/picosongs/picono_selected', text = 'pico-(pico-mix)', resultImage = 'freeplay/picosongs/pico_result'},
{file = 'freeplay/picosongs/picono', selectedFile = 'freeplay/picosongs/picono_selected', text = 'philly-nice-(pico-mix)', resultImage = 'freeplay/picosongs/philly_result'},
{file = 'freeplay/picosongs/picono', selectedFile = 'freeplay/picosongs/picono_selected', text = 'blammed-(pico-mix)', resultImage = 'freeplay/picosongs/blammed_result'},
{file = 'freeplay/picosongs/dadmomno', selectedFile = 'freeplay/picosongs/dadmomno_selected', text = 'eggnog (pico-mix)', resultImage = 'freeplay/picosongs/eggnog_result'},
{file = 'freeplay/picosongs/tankno', selectedFile = 'freeplay/picosongs/tankno_selected', text = 'ugh-(pico-mix)', resultImage = 'freeplay/picosongs/ugh_result'},
{file = 'freeplay/picosongs/tankno', selectedFile = 'freeplay/picosongs/tankno_selected', text = 'guns-(pico-mix)', resultImage = 'freeplay/picosongs/guns_result'},
{file = 'freeplay/picosongs/darnelno', selectedFile = 'freeplay/picosongs/darnelno_selected', text = 'darnell', resultImage = 'freeplay/picosongs/darnell_result'},
{file = 'freeplay/picosongs/darnelno', selectedFile = 'freeplay/picosongs/darnelno_selected', text = 'lit-up', resultImage = 'freeplay/picosongs/lit-up_result'},
{file = 'freeplay/picosongs/darnelno', selectedFile = 'freeplay/picosongs/darnelno_selected', text = '2hot', resultImage = 'freeplay/picosongs/2hot_result'},
{file = 'freeplay/picosongs/darnelno', selectedFile = 'freeplay/picosongs/darnelno_selected', text = 'blazin', resultImage = 'freeplay/picosongs/blazin_result'}
}

function onCreate()
setProperty('skipCountdown', true)
runTimer('ini', 0.0001)

makeLuaSprite('bg1', 'freeplay/bgpico', 0, 0)
setObjectCamera('bg1', 'other')
addLuaSprite('bg1', true)
    
--Armas
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

-- selected
makeAnimatedLuaSprite('bgpicosele', 'freeplay/bgpicosele', -20, 0)
addAnimationByPrefix('bgpicosele', 'default', 'idle', 15, true)
scaleObject('bgpicosele', 1, 1)
setObjectCamera('bgpicosele', 'other')
addLuaSprite('bgpicosele', true)
setProperty('bgpicosele.visible', false)

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
setTextColor('text' .. i, 'C5C5C5')

makeLuaSprite('image' .. i, imgData.file, selectedPosX, selectedPosY + (i - selectedIndex) * moveStepY)
setObjectCamera('image' .. i, 'other')
addLuaSprite('image' .. i, true)
setProperty('image' .. i .. '.alpha', 0.8)
images[i] = {sprite = 'image' .. i, text = 'text' .. i, bg = 'bgImage' .. i, func = 'imageFunc' .. i, selectedFile = imgData.selectedFile, resultImage = imgData.resultImage}
end

makeLuaSprite('ui2', 'freeplay/ui2', 0, 0)
setObjectCamera('ui2', 'other')
addLuaSprite('ui2', true)

makeLuaSprite('hard', 'freeplay/hard', 0, 0)
setObjectCamera('hard', 'other')
addLuaSprite('hard', true)

ñupdateImagePositions()
end

function onUpdate()
if keyJustPressed('up') then
moveSelectionUp()
playSound('scrollMenu',0.8)
elseif keyJustPressed('down') then
playSound('scrollMenu',0.8)
moveSelectionDown()
end
if keyJustPressed('right') or keyJustPressed('accept') then
activateCurrentImage()
end
if keyJustPressed('left') then
runTimer('selec', 1)
playSound('confirmMenu',0.8)
playAnim('picobg', 'sele', true)
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

setProperty(img.sprite .. '.alpha', i == selectedIndex and 1 or 0.8)
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
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc2()
runTimer('song2', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc3()
runTimer('song3', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc4()
runTimer('song4', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc5()
runTimer('song5', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc6()
runTimer('song6', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc7()
runTimer('song7', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc8()
runTimer('song8', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc9()
runTimer('song9', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc10()
runTimer('song10', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc11()
runTimer('song11', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc12()
runTimer('song12', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc13()
runTimer('song13', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc14()
runTimer('song14', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
end

function imageFunc15()
runTimer('song15', 1.6)
playSound('confirmMenu',0.8)
doTweenAlpha('bg1sele.alpha', 'bg1sele', 1, 0.4, 'linear')
setProperty('bgpicosele.visible', true)
playAnim('bgpicosele', 'default', true)
playAnim('Pico', 'enter', true)
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

if tag == 'selec' then
loadSong('selecciona_personaje')
end

   if tag == 'song1' then
loadSong('Bopeebo-(Pico-Mix)')
end

   if tag == 'song2' then
loadSong('Fresh-(Pico-Mix)')
end

   if tag == 'song3' then
loadSong('Dadbattle (Pico-Mix)')
end

   if tag == 'song4' then
loadSong('Spookeez-(Pico-Mix)')
end

   if tag == 'song5' then
loadSong('South-(Pico-Mix)')
end

   if tag == 'song6' then
loadSong('Pico-(Pico-Mix)')
end

   if tag == 'song7' then
loadSong('Philly-Nice-(Pico-Mix)')
end

   if tag == 'song8' then
loadSong('Blammed-(Pico-Mix)')
end

   if tag == 'song9' then
loadSong('Eggnog-(Pico-Mix)')
end

   if tag == 'song10' then
loadSong('Ugh-(Pico-Mix)')
end

   if tag == 'song11' then
loadSong('Guns-(Pico-Mix)')
end

   if tag == 'song12' then
loadSong('darnell')
end

   if tag == 'song13' then
loadSong('lit-up')
end

   if tag == 'song14' then
loadSong('2hot')
end

   if tag == 'song15' then
loadSong('blazin')
end
end

function onStepHit()
if curStep == 6 then
playAnim('Pico', 'default', true)
end
end

function onEndSong()
restartSong(true);
end