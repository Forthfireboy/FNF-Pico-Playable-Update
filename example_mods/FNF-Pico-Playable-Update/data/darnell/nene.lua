xd=0
yd=10
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


	makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176,390);
	addAnimationByIndices('sss4', 'god', 'viz1', '0,1,2,3,4,5', 24, false)
	addAnimationByPrefix('sss4', 'idle', 'viz1', 18,  o);
	scaleObject('sss4', n,n)
	addLuaSprite('sss4', false);

	makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244,384);
	addAnimationByIndices('sss42', 'god', 'viz2', '1,2,3,4,5', 24, false)
	addAnimationByPrefix('sss42', 'idle', 'viz2', 18,  o);
	scaleObject('sss42',  n,n)
	addLuaSprite('sss42', false);

	makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308,378);
	addAnimationByIndices('sss43', 'god', 'viz3', '2,3,4,5', 24, false)

	addAnimationByPrefix('sss43', 'idle', 'viz3', 18, o);
	scaleObject('sss43',  n,n)
	addLuaSprite('sss43', false);

	makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424,378);
	addAnimationByIndices('sss44', 'god', 'viz4', '3,4,5', 24, false)

	addAnimationByPrefix('sss44', 'idle', 'viz4', 18,  o);
	scaleObject('sss44',  n,n)
	addLuaSprite('sss44', false);

	makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484,380);
	addAnimationByIndices('sss45', 'god', 'viz5', '4,5', 24, false)

	addAnimationByPrefix('sss45', 'idle', 'viz5', 18,  o);
	scaleObject('sss45', n, n)
	addLuaSprite('sss45', false);

	makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536,392);
	addAnimationByIndices('sss6', 'god', 'viz1', '5', 24, false)
	addAnimationByPrefix('sss6', 'idle', 'viz1', 18, o);
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
			
			makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176, 390);
			addAnimationByIndices('sss4', 'god', 'viz1', getRandomNumbers(14), 34, true)
			scaleObject('sss4', n, n)
			addLuaSprite('sss4', false);
			
			makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244, 384);
			addAnimationByIndices('sss42', 'god', 'viz2', getRandomNumbers(40), 34, true)
			scaleObject('sss42', n, n)
			addLuaSprite('sss42', false);
			
			makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308, 378);
			addAnimationByIndices('sss43', 'god', 'viz3', getRandomNumbers(26), 24, true)
			scaleObject('sss43', n, n)
			addLuaSprite('sss43', false);
			
			makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424, 378);
			addAnimationByIndices('sss44', 'god', 'viz4', getRandomNumbers(21), 24, true)
			scaleObject('sss44', n, n)
			addLuaSprite('sss44', false);
			
			makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484, 380);
			addAnimationByIndices('sss45', 'god', 'viz5', getRandomNumbers(23), 24, true)
			scaleObject('sss45', n, n)
			addLuaSprite('sss45', false);
			
			makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536, 392);
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
		
		makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176, 390);
		addAnimationByIndices('sss4', 'god', 'viz1', getRandomNumbers(14), 34, true)
		scaleObject('sss4', n, n)
		addLuaSprite('sss4', false);
		
		makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244, 384);
		addAnimationByIndices('sss42', 'god', 'viz2', getRandomNumbers(40), 34, true)
		scaleObject('sss42', n, n)
		addLuaSprite('sss42', false);
		
		makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308, 378);
		addAnimationByIndices('sss43', 'god', 'viz3', getRandomNumbers(26), 24, true)
		scaleObject('sss43', n, n)
		addLuaSprite('sss43', false);
		
		makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424, 378);
		addAnimationByIndices('sss44', 'god', 'viz4', getRandomNumbers(21), 24, true)
		scaleObject('sss44', n, n)
		addLuaSprite('sss44', false);
		
		makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484, 380);
		addAnimationByIndices('sss45', 'god', 'viz5', getRandomNumbers(23), 24, true)
		scaleObject('sss45', n, n)
		addLuaSprite('sss45', false);
		
		makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536, 392);
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
		
		makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176, 390);
		addAnimationByIndices('sss4', 'god', 'viz1', getRandomNumbers(14), 34, true)
		scaleObject('sss4', n, n)
		addLuaSprite('sss4', false);
		
		makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244, 384);
		addAnimationByIndices('sss42', 'god', 'viz2', getRandomNumbers(40), 34, true)
		scaleObject('sss42', n, n)
		addLuaSprite('sss42', false);
		
		makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308, 378);
		addAnimationByIndices('sss43', 'god', 'viz3', getRandomNumbers(26), 24, true)
		scaleObject('sss43', n, n)
		addLuaSprite('sss43', false);
		
		makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424, 378);
		addAnimationByIndices('sss44', 'god', 'viz4', getRandomNumbers(21), 24, true)
		scaleObject('sss44', n, n)
		addLuaSprite('sss44', false);
		
		makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484, 380);
		addAnimationByIndices('sss45', 'god', 'viz5', getRandomNumbers(23), 24, true)
		scaleObject('sss45', n, n)
		addLuaSprite('sss45', false);
		
		makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536, 392);
		addAnimationByIndices('sss6', 'god', 'viz1', getRandomNumbers(19), 34, true)
		scaleObject('sss6', n, n)
		setProperty('sss6.flipX', true)
		addLuaSprite('sss6', false);
	end
	if v1 == 'stop' then
		n=0.95
				makeAnimatedLuaSprite('sss4', 'abot/aBotViz', 176,390);
				addAnimationByIndices('sss4', 'god', 'viz1', '0,1,2,3,4,5', 34, false)
				scaleObject('sss4', n,n)
				addLuaSprite('sss4', false);
			
				makeAnimatedLuaSprite('sss42', 'abot/aBotViz', 244,384);
				addAnimationByIndices('sss42', 'god', 'viz2', '0,1,2,3,4,5', 34,false)
				
				scaleObject('sss42',  n,n)
				addLuaSprite('sss42', false);
			
				makeAnimatedLuaSprite('sss43', 'abot/aBotViz', 308,378);
				addAnimationByIndices('sss43', 'god', 'viz3', '0,1,2,3,4,5', 24,false)
				scaleObject('sss43',  n,n)
				addLuaSprite('sss43', false);
			
				makeAnimatedLuaSprite('sss44', 'abot/aBotViz', 424,378);
				addAnimationByIndices('sss44', 'god', 'viz4', '0,1,2,3,4,5', 24,false)
				scaleObject('sss44',  n,n)
				addLuaSprite('sss44', false);
			
				makeAnimatedLuaSprite('sss45', 'abot/aBotViz', 484,380);
				addAnimationByIndices('sss45', 'god', 'viz5', '0,1,2,3,4,5', 24,false)
				scaleObject('sss45', n, n)
				addLuaSprite('sss45', false);
			
				makeAnimatedLuaSprite('sss6', 'abot/aBotViz', 536,392);
				addAnimationByIndices('sss6', 'god', 'viz1', '0,1,2,3,4,5', 34, false)
				scaleObject('sss6', n, n)
				setProperty('sss6.flipX',true)
				addLuaSprite('sss6', false);
				
			end
end
end
function onBeatHita()
	if curStep <1152 then
	if curBeat % 2 == 0 then
		triggerEvent('bit2')
	end
	if curBeat % 4 == 0 then
		triggerEvent('bit')

	end
	if curBeat % 6 == 0 then
		triggerEvent('bit3')

	end
	if curBeat % 8 == 0 then
		triggerEvent('bit4')
	end
	end
end
function onMoveCamera(focus)
    if focus == 'boyfriend' then
		runTimer('2x',0.5)
    elseif focus == 'dad' then
		runTimer('1x',0.5)
    end
end
local currentAnim = ''
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
        if currentAnim ~= 'lomatan2' then
            playAnim('systemEyes', 'lomatan2')
            currentAnim = 'lomatan2' 
        end
    end

    if ta == '2x' then
        if currentAnim ~= 'lomatan' then
            playAnim('systemEyes', 'lomatan')
            currentAnim = 'lomatan' 
        end
    end
end

function onUpdate()
	setObjectOrder('abot',getObjectOrder('sss6')) --modi
	setProperty('gf.x',134)
	setProperty('gf.y',105)
end
function onCreatePost()
	
	precacheImage('abot/aBotViz')--modi
	end