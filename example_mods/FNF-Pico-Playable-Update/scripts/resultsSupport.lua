local scriptDeleted = false
local picoScriptDeleted = false

function onUpdate()
    local bfName = getProperty('boyfriend.curCharacter')

    if string.sub(bfName, 1, 4) == "pico" and not picoScriptDeleted then
        removeHScript('scripts/results_substate')
        picoScriptDeleted = true
    elseif string.sub(bfName, 1, 2) == "bf" and not scriptDeleted then
        removeHScript('scripts/results_substate_pico')
        scriptDeleted = true
    end
end
