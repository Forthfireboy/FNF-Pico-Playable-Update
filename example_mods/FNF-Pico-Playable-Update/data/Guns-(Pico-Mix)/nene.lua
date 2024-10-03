xd=400
yd=100
skibidi=0.0001
local memuerotio = false
function onCreate()
	n = 0.95
	o=false

	sexo = tostring(math.random(0, 5))

	addAnimationByIndices('sss4', 'god2', 'viz1', sexo, 24, false)
	addAnimationByIndices('sss42', 'god2', 'viz2', sexo, 24, false)
	addAnimationByIndices('sss43', 'god2', 'viz3', sexo, 24, false)
	addAnimationByIndices('sss44', 'god2', 'viz4', sexo, 24, false)
	addAnimationByIndices('sss45', 'god2', 'viz5', sexo, 24, false)
	addAnimationByIndices('sss6', 'god2', 'viz1', sexo, 24, false)

	makeLuaSprite('White', '', 25+xd, 540+yd)
    makeGraphic('White', 150, 50, 'FFFFFF')
    addLuaSprite('White', false)

	makeFlxAnimateSprite("systemEyes",  38+xd,538+yd, "characters/abot/systemEyes")--modi
loadAnimateAtlas("systemEyes", "characters/abot/systemEyes")
addAnimationBySymbolIndices("systemEyes","lomatan", "a bot eyes lookin", {0,1,2,3,4,5,6,7,8},24, false)
addAnimationBySymbolIndices("systemEyes","lomatan2", "a bot eyes lookin", {9,10,11,12,13,14,15,16,17,18},24, false)
addLuaSprite("systemEyes", false)
scaleObject('systemEyes', 1,1)
playAnim('systemEyes','lomatan2')

	makeLuaSprite('stereoBG', 'characters/abot/stereoBG', 150+xd, 320+yd)
	addLuaSprite('stereoBG',false);--modi

	setProperty('spritemap2.alpha',0)

	makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176+xd,390+yd);
	addAnimationByIndices('sss4', 'god', 'viz1', '0,1,2,3,4,5', 24, false)
	addAnimationByPrefix('sss4', 'idle', 'viz1', xd,  o);
	scaleObject('sss4', n,n)
	addLuaSprite('sss4', false);

	makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244+xd,384+yd);
	addAnimationByIndices('sss42', 'god', 'viz2', '1,2,3,4,5', 24, false)
	addAnimationByPrefix('sss42', 'idle', 'viz2', xd,  o);
	scaleObject('sss42',  n,n)
	addLuaSprite('sss42', false);

	makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308+xd,378+yd);
	addAnimationByIndices('sss43', 'god', 'viz3', '2,3,4,5', 24, false)

	addAnimationByPrefix('sss43', 'idle', 'viz3', xd, o);
	scaleObject('sss43',  n,n)
	addLuaSprite('sss43', false);

	makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424+xd,378+yd);
	addAnimationByIndices('sss44', 'god', 'viz4', '3,4,5', 24, false)

	addAnimationByPrefix('sss44', 'idle', 'viz4', xd,  o);
	scaleObject('sss44',  n,n)
	addLuaSprite('sss44', false);

	makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484+xd,380+yd);
	addAnimationByIndices('sss45', 'god', 'viz5', '4,5', 24, false)

	addAnimationByPrefix('sss45', 'idle', 'viz5', xd,  o);
	scaleObject('sss45', n, n)
	addLuaSprite('sss45', false);

	makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536+xd,392+yd);
	addAnimationByIndices('sss6', 'god', 'viz1', '5', 24, false)
	addAnimationByPrefix('sss6', 'idle', 'viz1', xd, o);
	scaleObject('sss6', n, n)
	setProperty('sss6.flipX',true)
	addLuaSprite('sss6', false);

	--modificacion
makeFlxAnimateSprite("abot",  -18+xd,300+yd, "characters/abot/abotSystem")
loadAnimateAtlas("abot", "characters/abot/abotSystem")
addAnimationBySymbol("abot","lomatan", "Abot System", 24, true)
addLuaSprite("abot", false)
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'beat' then
		playAnim('sss4', 'god',false)
		playAnim('sss42','god',false)
		playAnim('sss43','god',false)
		playAnim('sss44','god',false)
		playAnim('sss45','god',false)
		playAnim('sss6', 'god',false)
	end
	if noteType == 'beat2' then
		playAnim('sss4', 'god2',false)
		playAnim('sss42','god2',false)
		playAnim('sss43','god2',false)
		playAnim('sss44','god2',false)
		playAnim('sss45','god2',false)
		playAnim('sss6', 'god2',false)
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'beat' then
		playAnim('sss4', 'god',false)
		playAnim('sss42','god',false)
		playAnim('sss43','god',false)
		playAnim('sss44','god',false)
		playAnim('sss45','god',false)
		playAnim('sss6', 'god',false)
	end
	if noteType == 'beat2' then
		playAnim('sss4', 'god2',false)
		playAnim('sss42','god2',false)
		playAnim('sss43','god2',false)
		playAnim('sss44','god2',false)
		playAnim('sss45','god2',false)
		playAnim('sss6', 'god2',false)
	end
end

function onEvent(n,v1,v2)
	if n == 'beat' then
		if v1 == '' then
			n = 0.95
			function getRandomNumbers(count)
				local numbers = {}
				local lastNum = math.random(1, 5) 
				for i = 1, count do
					local num
					repeat
						num = lastNum + math.random(-1, 1)  
					until num >= 1 and num <= 5  
					lastNum = num 
					local repetitions = math.random(1, 3)  
					for j = 1, repetitions do
						table.insert(numbers, num)
					end
				end
				return table.concat(numbers, ',')
			end
			
			makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176+xd, 390+yd);
			addAnimationByIndices('sss4', 'god', 'viz1', getRandomNumbers(14), 34, true)
			scaleObject('sss4', n, n)
			addLuaSprite('sss4', false);
			
			makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244+xd, 384+yd);
			addAnimationByIndices('sss42', 'god', 'viz2', getRandomNumbers(40), 34, true)
			scaleObject('sss42', n, n)
			addLuaSprite('sss42', false);
			
			makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308+xd, 378+yd);
			addAnimationByIndices('sss43', 'god', 'viz3', getRandomNumbers(26), 24, true)
			scaleObject('sss43', n, n)
			addLuaSprite('sss43', false);
			
			makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424+xd, 378+yd);
			addAnimationByIndices('sss44', 'god', 'viz4', getRandomNumbers(21), 24, true)
			scaleObject('sss44', n, n)
			addLuaSprite('sss44', false);
			
			makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484+xd, 380+yd);
			addAnimationByIndices('sss45', 'god', 'viz5', getRandomNumbers(23), 24, true)
			scaleObject('sss45', n, n)
			addLuaSprite('sss45', false);
			
			makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536+xd, 392+yd);
			addAnimationByIndices('sss6', 'god', 'viz1', getRandomNumbers(19), 34, true)
			scaleObject('sss6', n, n)
			setProperty('sss6.flipX', true)
			addLuaSprite('sss6', false);
	end
	if v1 == 'f' then
		n = 0.95
		function getRandomNumbers(count)
			local numbers = {}
			local lastNum = math.random(0,3) 
			for i = 1, count do
				local num
				repeat
					num = lastNum + math.random(-1, 1)  
				until num >= 1 and num <= 5  
				lastNum = num 
				local repetitions = math.random(1, 3)  
				for j = 1, repetitions do
					table.insert(numbers, num)
				end
			end
			return table.concat(numbers, ',')
		end
		
		makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176+xd, 390+yd);
		addAnimationByIndices('sss4', 'god', 'viz1', getRandomNumbers(14), 34, true)
		scaleObject('sss4', n, n)
		addLuaSprite('sss4', false);
		
		makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244+xd, 384+yd);
		addAnimationByIndices('sss42', 'god', 'viz2', getRandomNumbers(40), 34, true)
		scaleObject('sss42', n, n)
		addLuaSprite('sss42', false);
		
		makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308+xd, 378+yd);
		addAnimationByIndices('sss43', 'god', 'viz3', getRandomNumbers(26), 24, true)
		scaleObject('sss43', n, n)
		addLuaSprite('sss43', false);
		
		makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424+xd, 378+yd);
		addAnimationByIndices('sss44', 'god', 'viz4', getRandomNumbers(21), 24, true)
		scaleObject('sss44', n, n)
		addLuaSprite('sss44', false);
		
		makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484+xd, 380+yd);
		addAnimationByIndices('sss45', 'god', 'viz5', getRandomNumbers(23), 24, true)
		scaleObject('sss45', n, n)
		addLuaSprite('sss45', false);
		
		makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536+xd, 392+yd);
		addAnimationByIndices('sss6', 'god', 'viz1', getRandomNumbers(19), 34, true)
		scaleObject('sss6', n, n)
		setProperty('sss6.flipX', true)
		addLuaSprite('sss6', false);
	end
	if v1 == 'suave' then
		n = 0.95
		function getRandomNumbers(count)
			local numbers = {}
			local lastNum = math.random(3,5) 
			for i = 1, count do
				local num
				repeat
					num = lastNum + math.random(-1, 1)  
				until num >= 1 and num <= 5  
				lastNum = num 
				local repetitions = math.random(1, 3)  
				for j = 1, repetitions do
					table.insert(numbers, num)
				end
			end
			return table.concat(numbers, ',')
		end
		
		makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176+xd, 390+yd);
		addAnimationByIndices('sss4', 'god', 'viz1', getRandomNumbers(14), 34, true)
		scaleObject('sss4', n, n)
		addLuaSprite('sss4', false);
		
		makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244+xd, 384+yd);
		addAnimationByIndices('sss42', 'god', 'viz2', getRandomNumbers(40), 34, true)
		scaleObject('sss42', n, n)
		addLuaSprite('sss42', false);
		
		makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308+xd, 378+yd);
		addAnimationByIndices('sss43', 'god', 'viz3', getRandomNumbers(26), 24, true)
		scaleObject('sss43', n, n)
		addLuaSprite('sss43', false);
		
		makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424+xd, 378+yd);
		addAnimationByIndices('sss44', 'god', 'viz4', getRandomNumbers(21), 24, true)
		scaleObject('sss44', n, n)
		addLuaSprite('sss44', false);
		
		makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484+xd, 380+yd);
		addAnimationByIndices('sss45', 'god', 'viz5', getRandomNumbers(23), 24, true)
		scaleObject('sss45', n, n)
		addLuaSprite('sss45', false);
		
		makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536+xd, 392+yd);
		addAnimationByIndices('sss6', 'god', 'viz1', getRandomNumbers(19), 34, true)
		scaleObject('sss6', n, n)
		setProperty('sss6.flipX', true)
		addLuaSprite('sss6', false);
	end
end
end
function onBeatHit()
    local eventVariations = {"suave", "f", ""} 
    local beatVariation = eventVariations[(curBeat % 3) + 1]

    if curBeat % 2 == 0 then
        triggerEvent('beat', beatVariation, '') 
    end
    if curBeat % 4 == 0 then
        triggerEvent('beat', beatVariation) 
    end
    if curBeat % 6 == 0 then
        triggerEvent('beat', beatVariation) 
    end
    if curBeat % 8 == 0 then
        triggerEvent('beat', beatVariation) 
    end
end
function onSongStart()
	triggerEvent('beat', 'suave', '') 
end
function onMoveCamera(focus)
    if focus == 'boyfriend' then
		runTimer('2x',0.5)
    elseif focus == 'dad' then
		runTimer('1x',0.5)
    end
end
function onTimerCompleted(ta)
	if ta== 'xd' then
		playAnim('sss4','idle',true)
	end
	if ta == 'xd2' then
		playAnim('sss42','idle',true)
	
	end
	if ta == 'xd3' then
		playAnim('sss43','idle',true)
		
	end
	if ta == 'xd4' then
		playAnim('sss44','idle',true)
		
	end
	if ta == 'xd5' then
		playAnim('sss45','idle',true)
		
	end
	if ta== 'xd6' then
		playAnim('sss6','idle',true)
	end
	if ta == '1x' then
		setProperty('spritemap1.alpha',1)
		setProperty('spritemap2.alpha',0)

	end
	if ta == '2x' then
		setProperty('spritemap1.alpha',0)
		setProperty('spritemap2.alpha',1)
	end
	if ta == 'kxd' then
        setProperty('NeneKnifeToss.alpha',0)
    end
if ta == 'ded' then
 
    makeAnimatedLuaSprite('dead', 'characters/Pico_Death_Retry', 1170,200-30);
	addAnimationByPrefix('dead', 'a', 'Retry Text Confirm', 24, false)
	addAnimationByPrefix('dead', 'a2', 'Retry Text Loop', 24, true);
	scaleObject('dead', 1,1)
    setObjectOrder('dead',999)
	addLuaSprite('dead', false);
end
end
function onGameOverStart()
    setProperty('camFollow.x',1300) 
	setProperty('camFollow.y',400) 
   setProperty('boyfriend.x',780)
    setProperty('boyfriend.y',144)
    makeAnimatedLuaSprite('NeneKnifeToss', 'characters/NeneKnifeToss',getProperty('boyfriend.x')-400,getProperty('boyfriend.y')-200);
	addAnimationByPrefix('NeneKnifeToss', 'a', 'knife toss', 24, false)
	scaleObject('NeneKnifeToss', 1,1)
    setObjectOrder('NeneKnifeToss',998)
	addLuaSprite('NeneKnifeToss', false);
runTimer('ded',1.4)
runTimer('kxd',0.75)
end
function onGameOverConfirm(retry)
    makeAnimatedLuaSprite('dead', 'characters/Pico_Death_Retry', 1170,200-30);
	addAnimationByPrefix('dead', 'a', 'Retry Text Confirm', 24, false)
	addAnimationByPrefix('dead', 'a2', 'Retry Text Loop', 24, true);
	scaleObject('dead', 1,1)
    cancelTimer('ded')
    setObjectOrder('dead',999)
	addLuaSprite('dead', false);
playAnim('dead','a',true)
setProperty('dead.x',940)
setProperty('dead.y',-50)
end
function onUpdate()
	setObjectOrder('abot',getObjectOrder('sss6')) --modi
	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'pico-dead')
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pico')
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver-pico');
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

	setProperty('gf.x',34+500)
	setProperty('boyfriend.y',530)
	setProperty('boyfriend.x',1150)
	setProperty('gf.y',-8+205)
end
function onCreatePost()
	
	precacheImage('abot/aBotViz')--modi
	end