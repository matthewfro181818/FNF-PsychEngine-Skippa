local crazy = false
function onCreate()
    makeLuaSprite('sunset', 'sun', -300, -100)
    setScrollFactor('sunset', 0, 0)
    addLuaSprite('sunset', false)

    makeLuaSprite('badsunset', 'badsun', -300, -100)
    setScrollFactor('badsunset', 0, 0)
    addLuaSprite('badsunset', false)
    setProperty('badsunset.visible', false)

    makeAnimatedLuaSprite('road', 'Road', -1660, 620)
    addAnimationByPrefix('road', 'idle', 'Road', 24, true)
    setScrollFactor('road', 0, 0)
    addLuaSprite('road')

    makeLuaSprite('tree', 'Tree', -1900, -300)
    setScrollFactor('tree', 1, 0)
    addLuaSprite('tree', false)

    makeAnimatedLuaSprite('jeepskipper', 'Shitty_Jeep', -1000, 680)
    addAnimationByPrefix('jeepskipper', 'idle', 'Shitty Jeep', 24, true)
    addLuaSprite('jeepskipper', false)

    makeAnimatedLuaSprite('jeepskipperBetter', 'Better_Jeep', -1000, 680)
    addAnimationByPrefix('jeepskipperBetter', 'idle', 'Truck', 24, true)
    addLuaSprite('jeepskipperBetter', false)
    setProperty('jeepskipperBetter.visible', false)

    makeLuaSprite('kowalski', 'Kowalski', -300, 760)
    addLuaSprite('kowalski', false)

    makeLuaSprite('private', 'Private', -400, 760)
    addLuaSprite('private', false)

    makeLuaSprite('rico', 'Rico', -700, 760)
    addLuaSprite('rico', false)

    makeAnimatedLuaSprite('jeep', 'Shitty_Jeep', 200, 800)
    addAnimationByPrefix('jeep', 'idle', 'Shitty Jeep', 24, true)
    addLuaSprite('jeep', false)

    makeAnimatedLuaSprite('jeepBetter', 'Better_Jeep_BF', 200, 800)
    addAnimationByPrefix('jeepBetter', 'idle', 'Truck Low Quality', 24, true)
    addLuaSprite('jeepBetter', false)
    setProperty('jeepBetter.visible', false)

    makeLuaSprite('driver', 'Demon_Driver', 500, 850)
    addLuaSprite('driver', false)
end

function onBeatHit()
    if curBeat % 12 == 0 then
        setProperty('tree.x', -1900)
        doTweenX('treeTween', 'tree', 1900, 0.3, 'linear')
    end

    if crazy then
        doTweenZoom('camZoom', 'camGame', 1.7, 0.01, 'quadInOut')
    end

    if curBeat == 144 or curBeat == 464 then
        doTweenZoom('camZoom1', 'camGame', 1.4, 3, 'quadInOut')
    end

    if curBeat == 160 or curBeat == 480 then
        crazy = true
        setProperty('badsunset.visible', true)
        setProperty('jeepBetter.visible', true)
        setProperty('jeepskipperBetter.visible', true)
        setProperty('jeep.visible', false)
        setProperty('jeepskipper.visible', false)
        setProperty('rico.visible', false)
        setProperty('kowalski.visible', false)
        setProperty('private.visible', false)
        setProperty('driver.visible', false)
    end

    if curBeat == 288 or curBeat == 608 then
        crazy = false
        setProperty('badsunset.visible', false)
        setProperty('defaultCamZoom', 0.9)
        setProperty('jeepBetter.visible', false)
        setProperty('jeepskipperBetter.visible', false)
        setProperty('jeep.visible', true)
        setProperty('jeepskipper.visible', true)
        setProperty('rico.visible', true)
        setProperty('kowalski.visible', true)
        setProperty('private.visible', true)
        setProperty('driver.visible', true)
    end
end

function onUpdate()
    if crazy then
        setProperty('defaultCamZoom', 1.2)
    end
end