omg=false
local lightsStop = false
local lastChange = 0
local changeInterval = 20
local carInterruptable = true
local carWaiting = false
local carSpeed = 10
function onCreatePost()
	addHaxeLibrary('FlxBackdrop', 'flixel.addons.display')
	runHaxeCode([[
	  var ulisegaswasherexd = new FlxBackdrop(Paths.image('phillyStreets/erect/mistFront'), 0x11, 0, 100);
	  ulisegaswasherexd.scale.set(2, 2);
	  ulisegaswasherexd.velocity.set(150,0);
	  ulisegaswasherexd.blend=0;
      	  ulisegaswasherexd.alpha=0.6;
      	  ulisegaswasherexd.color = 0xFF5c5c5c;
	  ulisegaswasherexd.scrollFactor.set(1, 1);
	  ulisegaswasherexd.updateHitbox();
	  addBehindGF(ulisegaswasherexd);

	  var nomerobenelportporfavormetomomuchotiempoynohedormidonada = new FlxBackdrop(Paths.image('phillyStreets/erect/mistFront'), 0x11, 0,100);
	  nomerobenelportporfavormetomomuchotiempoynohedormidonada.scale.set(2, 2);
	  nomerobenelportporfavormetomomuchotiempoynohedormidonada.velocity.set(-150,0);
	  nomerobenelportporfavormetomomuchotiempoynohedormidonada.blend=0;
	  	  nomerobenelportporfavormetomomuchotiempoynohedormidonada.alpha=0.5;
        nomerobenelportporfavormetomomuchotiempoynohedormidonada.color = 0xFF5c5c5c;
	  nomerobenelportporfavormetomomuchotiempoynohedormidonada.scrollFactor.set(1, 1);
	  nomerobenelportporfavormetomomuchotiempoynohedormidonada.updateHitbox();
	  add(nomerobenelportporfavormetomomuchotiempoynohedormidonada);
	]])
  end
function changeLights(beat)
    -- Verificar si ha pasado el intervalo para cambiar
    if beat % changeInterval == 0 then
        lightsStop = not lightsStop
        if not lightsStop then
            objectPlayAnimation('trafficLight', 'redToGreen', true)
            -- Aquí podrías ajustar el tiempo si es necesario
        else
            objectPlayAnimation('trafficLight', 'greenToRed', true)
            -- Verificar si la animación de greenToRed ha terminado
          
      
        end
    end
end

-- Función para pausar los coches
function pauseCars()
    if carInterruptable then
        if getProperty('carsLeft.x') <560 then
        setProperty('carsLeft.velocity.x', 0)
        carWaiting = true
        end
    end
end
-- Función para reanudar los coches
function resumeCars()

end

-- Variables globales para mantener el estado de las últimas animaciones
-- Variables globales para mantener el estado de las últimas animaciones
local lastLeftAnim = 0
local lastRightAnim = 0

-- Inicialización de newLeftAnim fuera de la función para mantener su estado
local newLeftAnim = 0

-- Función para actualizar la posición de los carros
function updateCarPositions()
    if not lightsStop or (lightsStop and not carWaiting) then
        -- Movimiento del carro izquierdo
        if getProperty('carsLeft.x') >= getPropertyFromClass('flixel.FlxG', 'width') + 1500 then
            setProperty('carsLeft.x', -1000)
            repeat
                newLeftAnim = getRandomInt(1, 4)
            until newLeftAnim ~= lastRightAnim
            playAnim('carsLeft', 'car' .. newLeftAnim, true)
            lastLeftAnim = newLeftAnim

        else
            -- Movimiento normal del carro izquierdo
            if getProperty('trafficLight.animation.curAnim.name') ~= 'greenToRed' then
                setProperty('carsLeft.x', getProperty('carsLeft.x') + carSpeed)
            else
                -- Condiciones adicionales para el movimiento durante la transición verde a rojo
                if getProperty('carsLeft.x') < 500 or getProperty('carsLeft.x') > 750 then
                    setProperty('carsLeft.x', getProperty('carsLeft.x') + carSpeed)
                end
            end
            
        end
    end

    -- Movimiento del carro derecho
    if getProperty('carsRight.x') <= -1500 then
        setProperty('carsRight.x', 1700)
        repeat
            newRightAnim = getRandomInt(1, 4)
        until newRightAnim ~= lastLeftAnim
        playAnim('carsRight', 'car' .. newRightAnim, true)
        lastRightAnim = newRightAnim
        
        -- Aplicar tweens según la animación del carro derecho
        if newRightAnim == 1 then
            setProperty('carsRight.angle', 20)
            setProperty('carsRight.y', 550)
            doTweenAngle('carsRightTweenAngle1', 'carsRight', 0, 3.1, 'linear')
            doTweenY('carsRightTweenY1', 'carsRight', 340, 1.9, 'linear')
        elseif newRightAnim == 2 then
            setProperty('carsRight.angle', 20)
            setProperty('carsRight.y', 550)
            doTweenAngle('carsRightTweenAngle2', 'carsRight', 0, 3, 'linear')
            doTweenY('carsRightTweenY2', 'carsRight', 360, 2.25, 'linear')
        elseif newRightAnim == 3 then
            setProperty('carsRight.angle', 20)
            setProperty('carsRight.y', 550)
            doTweenAngle('carsRightTweenAngle3', 'carsRight', 0, 3.2, 'sineOut')
            doTweenY('carsRightTweenY3', 'carsRight', 320, 1.7, 'sineOut')
        elseif newRightAnim == 4 then
            setProperty('carsRight.angle', 20)
            setProperty('carsRight.y', 550)
            doTweenAngle('carsRightTweenAngle4', 'carsRight', 0, 2.3, 'linear')
            doTweenY('carsRightTweenY4', 'carsRight', 290, 1.7, 'linear')
        end
    else
        -- Movimiento normal del carro derecho
        setProperty('carsRight.x', getProperty('carsRight.x') - carSpeed)
    end
end


function onCreate()
    makeLuaSprite('greyGradient', 'phillyStreets/erect/greyGradient', -700, -200)
    addLuaSprite('greyGradient', false)
    setScrollFactor('greyGradient', 0.3, 0.3)
    scaleObject('greyGradient',4,4)

    makeLuaSprite('skyline', 'phillyStreets/erect/phillySkyline', -700, -300)
    addLuaSprite('skyline', false)
    setScrollFactor('skyline', 0.3, 0.3)
    scaleObject('skyline', 4,4)

    makeLuaSprite('foregroundCity', 'phillyStreets/erect/phillyForegroundCity', 350, -20)
    addLuaSprite('foregroundCity', false)
    setScrollFactor('foregroundCity', 0.4, 0.4)
    scaleObject('foregroundCity',2,2)

    makeLuaSprite('construction', 'phillyStreets/erect/phillyConstruction', 1000, -150)
    addLuaSprite('construction', false)
    setScrollFactor('construction', 0.6, 0.6)
    scaleObject('construction',1,1)

    makeLuaSprite('highway', 'phillyStreets/erect/phillyHighway', -1050, -250)
    addLuaSprite('highway', false)
    setScrollFactor('highway', 1.0, 1.0)
    scaleObject('highway',2,2)

    makeAnimatedLuaSprite('carsLeft', 'phillyStreets/erect/phillyCars', -1000, 350)
    addAnimationByPrefix('carsLeft', 'car1', 'car1', 24, true)
    addAnimationByPrefix('carsLeft', 'car2', 'car2', 24, true)
    addAnimationByPrefix('carsLeft', 'car4', 'car4', 24, true)
    addAnimationByPrefix('carsLeft', 'car3', 'car3', 24, true)
    setProperty('carsLeft.flipX', false)
    addLuaSprite('carsLeft', omg)
    scaleObject('carsLeft',1.25,1.25)

    makeAnimatedLuaSprite('carsRight', 'phillyStreets/erect/phillyCars', -400, 350)
    addAnimationByPrefix('carsRight', 'car1', 'car1', 24, true)
    addAnimationByPrefix('carsRight', 'car3', 'car3', 24, true)
    addAnimationByPrefix('carsRight', 'car4', 'car4', 24, true)
    addAnimationByPrefix('carsRight', 'car2', 'car2', 24, true)
    setProperty('carsRight.flipX', true)
    scaleObject('carsRight', 1.25, 1.25)
    addLuaSprite('carsRight',omg)

    makeLuaSprite('222', 'phillyStreets/erect/mistBack',  -700, -650)
    addLuaSprite('222', false)
    setScrollFactor('222',0.3, 0.3)
    scaleObject('222',2.4,2.4)
setProperty('222.color',0x5c5c5c)
setProperty('222.blend',0)

makeLuaSprite('333', 'phillyStreets/erect/mistFront', -700, -600)
addLuaSprite('333', false)
setScrollFactor('333', 0.3, 0.3)
scaleObject('333',2.4,2.4)
setProperty('333.alpha',0.5)
setProperty('333.color',0x5c5c5c)
setProperty('333.blend',0)

makeLuaSprite('mistBack', 'phillyStreets/erect/mistBack',  -700, -200)
addLuaSprite('mistBack', true)
setScrollFactor('mistBack',0.3, 0.3)
scaleObject('mistBack',2.4,2.4)
setProperty('mistBack.color',0x5c5c5c)
setProperty('mistBack.blend',0)

makeLuaSprite('mistMid', 'phillyStreets/erect/mistMid', -700, -100)
addLuaSprite('mistMid', true)
setScrollFactor('mistMid', 0.3, 0.3)
setProperty('mistMid.alpha',0.5)
scaleObject('mistMid',2.4,2.4)
setProperty('mistMid.color',0x5c5c5c)
setProperty('mistMid.blend',0)

makeLuaSprite('mistFront', 'phillyStreets/erect/mistFront', -700, -200)
addLuaSprite('mistFront', true)
setScrollFactor('mistFront', 0.3, 0.3)
setProperty('mistFront.alpha',0.5)
scaleObject('mistFront',2.4,2.4)
setProperty('mistFront.color',0x5c5c5c)
setProperty('mistFront.blend',0)
--

--
    if songName == 'darnell' and isStoryMode then
    setProperty('carsRight.alpha',0)
    setProperty('carsLeft.alpha',0)
    end
    makeLuaSprite('foreground', 'phillyStreets/erect/phillyForeground', -1100, -100)
    addLuaSprite('foreground', false)
    setScrollFactor('foreground', 1.0, 1.0)
    scaleObject('foreground', 2, 2)

    makeLuaSprite('spraycanPile', 'phillyStreets/SpraycanPile', -270, 630)
    addLuaSprite('spraycanPile', true)
    setScrollFactor('spraycanPile', 1.0, 1.0)
    scaleObject('spraycanPile', 1, 1)


    makeAnimatedLuaSprite('trafficLight', 'phillyStreets/erect/phillyTraffic', 840, 148)
    addAnimationByPrefix('trafficLight', 'greenToRed', 'greentored', 24, false)
    addAnimationByPrefix('trafficLight', 'redToGreen', 'redtogreen', 24, false)
    setProperty('trafficLight.flipX', false)
    scaleObject('trafficLight', 2, 2)
    setScrollFactor('trafficLight', 0.9, 1)
    addLuaSprite('trafficLight', false)

    resumeCars()

end

function onBeatHit()
    changeLights(curBeat)
    updateCarPositions()
end

-- Manejar el temporizador para reanudar los coches
function onTimerCompleted(tag)
    if tag == 'resumeCars' then
        resumeCars()
    end
end

-- Actualizar cada frame
function onUpdate()
    local hueValue = -5;
    local saturationValue = -40;
    local contrastValue = -25;
    local brightnessValue = -20;
       setSpriteShader('dad', 'adjustColor')
       setShaderFloat('dad', 'hue', hueValue)
       setShaderFloat('dad', 'saturation', saturationValue)
       setShaderFloat('dad', 'contrast', contrastValue)
       setShaderFloat('dad', 'brightness', brightnessValue)
       
       setSpriteShader('gf', 'adjustColor')
       setShaderFloat('gf', 'hue', hueValue)
       setShaderFloat('gf', 'saturation', saturationValue)
       setShaderFloat('gf', 'contrast', contrastValue)
       setShaderFloat('gf', 'brightness', brightnessValue)
       
       setSpriteShader('boyfriend', 'adjustColor')
       setShaderFloat('boyfriend', 'hue', hueValue)
       setShaderFloat('boyfriend', 'saturation', saturationValue)
       setShaderFloat('boyfriend', 'contrast', contrastValue)
       setShaderFloat('boyfriend', 'brightness', brightnessValue)
            if getProperty('carsLeft.x') > 600 then
                if getProperty('carsLeft.animation.curAnim.name') == 'car2' then
                    doTweenAngle('carsLeftTweenAngle1', 'carsLeft', 20, 1, 'linear')
                    doTweenY('carsLeftTweenY1', 'carsLeft', 550, 1, 'linear')
                end
            end
            if getProperty('carsLeft.x') > 750 then
                if getProperty('carsLeft.animation.curAnim.name') == 'car1' then
                    doTweenAngle('carsLeftTweenAngle1', 'carsLeft', 20, 1.5, 'linear')
                    doTweenY('carsLeftTweenY1', 'carsLeft', 550, 2, 'linear')
                end
                if getProperty('carsLeft.animation.curAnim.name') == 'car3' then
                    doTweenAngle('carsLeftTweenAngle1', 'carsLeft', 20, 1.5, 'linear')
                    doTweenY('carsLeftTweenY1', 'carsLeft', 550, 2, 'linear')
                end
                if getProperty('carsLeft.animation.curAnim.name') == 'car4' then
                    doTweenAngle('carsLeftTweenAngle1', 'carsLeft', 20, 1.5, 'linear')
                    doTweenY('carsLeftTweenY1', 'carsLeft', 550, 2, 'linear')
                end
               else
                if getProperty('carsLeft.animation.curAnim.name') == 'car1' then
                    setProperty('carsLeft.y',340)
                elseif getProperty('carsLeft.animation.curAnim.name') == 'car2' then
                    setProperty('carsLeft.y',360)
                elseif getProperty('carsLeft.animation.curAnim.name') == 'car3' then
                    setProperty('carsLeft.y',320)
                elseif getProperty('carsLeft.animation.curAnim.name') == 'car4' then
                    setProperty('carsLeft.y',290)
                end
                setProperty('carsLeft.angle',0)
               end
    updateCarPositions()
	if isStoryMode then
      
        end
end


-- Reanudar el juego
function onResume()
    resumeCars()
end
function onSongStart()
    if songName == 'darnell' and isStoryMode then
        setProperty('carsRight.alpha',1)
        setProperty('carsLeft.alpha', 1)
        end
end
-- Función para reiniciar los valores de la escena

-- Lógica para inicializar los semáforos y coches al iniciar
onCreate()