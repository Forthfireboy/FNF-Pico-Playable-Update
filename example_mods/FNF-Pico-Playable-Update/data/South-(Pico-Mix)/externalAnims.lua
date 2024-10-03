local lastCombo = 0

function onCreate()
    gfComboCheer = false
    gfComboFawn = false
end

function onUpdate()
    if string.sub(gfName, 1, 4) == "nene" or string.sub(gfName, 1, 2) == "gf" then
        lastCombo = getProperty('combo')
    end
end

function onStepHit()
    local combo = getProperty('combo') 
    
    if string.sub(gfName, 1, 4) == "nene" then
        if combo >= 50 and not gfComboCheer then
            characterPlayAnim('gf', 'cheer', true) 
            setProperty('gf.specialAnim', true)
            playAnim('nene', 'cheer', true)
            setProperty('nene.specialAnim', true)
            gfComboCheer = true
        end
        if combo >= 200 and not gfComboFawn then
            characterPlayAnim('gf', 'fawn', true) 
            setProperty('gf.specialAnim', true)
            playAnim('nene', 'fawn', true)
            setProperty('nene.specialAnim', true)
            gfComboFawn = true 
        end
    end
    
    if string.sub(gfName, 1, 2) == "gf" then
        if combo >= 50 and not gfComboCheer then
            characterPlayAnim('gf', 'cheer', true)
            setProperty('gf.specialAnim', true)
            gfComboCheer = true
        end
        if combo >= 200 and not gfComboFawn then
            characterPlayAnim('gf', 'cheer', true)
            setProperty('gf.specialAnim', true)
            gfComboFawn = true
        end
    end
end

function noteMiss()
    if string.sub(gfName, 1, 4) == "nene" then
        if lastCombo >= 50 then
            characterPlayAnim('gf', 'QUERISAWEY', true)
            setProperty('gf.specialAnim', true)
            playAnim('nene', 'QUERISAWEY', true)
            setProperty('nene.specialAnim', true)
        end
        gfComboCheer = false
        gfComboFawn = false
    end

    if string.sub(gfName, 1, 2) == "gf" then
        if lastCombo >= 50 then
            characterPlayAnim('gf', 'sad', true)
            setProperty('gf.specialAnim', true)
        end
        gfComboCheer = false
        gfComboFawn = false
    end
end

function onBeatHit()
    if curBeat % 4 == 0 then
        -- Solo ejecutar animación 'idle' si no está en ninguna de las animaciones especiales
        local currentAnim = getProperty('gf.animation.curAnim.name')
        
        if currentAnim ~= 'cheer' and currentAnim ~= 'fawn' and currentAnim ~= 'QUERISAWEY' and currentAnim ~= 'sad' then
           runTimer('anim',0.05)
        end
    end
end
function onTimerCompleted(tag)
if tag == 'anim' then
    characterPlayAnim('gf', 'idle', true)
    setProperty('gf.specialAnim', true)
    
    if string.sub(gfName, 1, 4) == "nene" then
        playAnim('nene', 'idle', true)
        setProperty('nene.specialAnim', true)
    end
end
end