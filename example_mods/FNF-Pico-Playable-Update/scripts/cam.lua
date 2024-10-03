local displayedScore = 0
local lerpSpeed = 5 
function onCreatePost()
setObjectOrder('noteGroup', getObjectOrder('uiGroup') + 10)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    setPropertyFromClass('lime.app.Application', 'current.window.title', "Friday Night Funkin'")
    posY = downscroll and 105 or 675
end

function onCreate()
    makeLuaText("ScorCount", "Score: 0", 200, 750, 675)
    setTextSize("ScorCount", 20)
    setTextBorder("ScorCount", 2, "000000")
    setObjectCamera("ScorCount", 'camHUD')
    setTextColor('ScorCount', 'ffffff')
    addLuaText("ScorCount", true)
end

function onUpdate(elapsed)

    for i = 0, getProperty('notes.length') - 1 do
        if getSongPosition() > getPropertyFromGroup('notes', i, 'strumTime') + 40 and getPropertyFromGroup('notes', i, 'mustPress') == true then
            local noteData = getPropertyFromGroup('notes', i, 'noteData')
            setPropertyFromGroup('notes', i, 'color', getColorFromHex('404040')) 
        end
end
    setObjectOrder('ScorCount', getObjectOrder('scoreTxt') + 1)
    setProperty('ScorCount.y', posY)
    setHealthBarColors('FF0000', '66FF33')
    setProperty('scoreTxt.visible', false)
    setProperty('ScorCount.alpha', getProperty('scoreTxt.alpha'))
    displayedScore = lerp(displayedScore, score, lerpSpeed * elapsed)
    setTextString('ScorCount', 'Score: ' .. formatNumber(math.floor(displayedScore)))
end

function lerp(a, b, t)
    return a + (b - a) * t
end

function getColorFromHex(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex, 16)
end

function formatNumber(n)
    local formatted = tostring(n)
    local k
    while true do
        formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then
            break
        end
    end
    return formatted
end

function onUpdateScore(miss)
    if miss then
       playSound('missnote'..getRandomInt(1, 3), 0.45)
    end
end

