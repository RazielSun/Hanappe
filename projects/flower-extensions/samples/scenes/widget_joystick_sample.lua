module(..., package.seeall)

--------------------------------------------------------------------------------
-- Event Handler
--------------------------------------------------------------------------------

function onCreate(e)
    view = widget.UIView {
        scene = scene,
    }
    
    joystick1 = widget.Joystick {
        stickMode = "analog",
        parent = view,
        onStickChanged = joystick_OnStickChanged,
    }

    joystick2 = widget.Joystick {
        stickMode = "digital",
        parent = view,
        keyInputDispatchEnabled = true,
        onStickChanged = joystick_OnStickChanged,
    }
    
    joystick1:setPos(5, flower.viewHeight - joystick1:getHeight() - 5)
    joystick2:setPos(flower.viewWidth - joystick2:getWidth() - 5, flower.viewHeight - joystick2:getHeight() - 5)

end

function onStart(e)
    flower.InputMgr:addEventListener("keyDown", onKeyEvent)
    flower.InputMgr:addEventListener("keyUp", onKeyEvent)
end

function onStop(e)
    flower.InputMgr:removeEventListener("keyDown", onKeyEvent)
    flower.InputMgr:removeEventListener("keyUp", onKeyEvent)
end

function joystick_OnStickChanged(e)
    print("----- onStickChanged -----")
    print("stick old :", e.oldX, e.oldY)
    print("stick new :", e.newX, e.newY)
    print("stick dir :", e.direction)
    print("stick down:", e.down)
end

function onKeyEvent(e)
    print("----- onKeyEvent -----")
    print("tupe  = " .. e.type)
    print("down  = " .. tostring(e.down))
    print("key   = " .. e.key)

end