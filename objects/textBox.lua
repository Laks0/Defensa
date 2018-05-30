textBox = {}

function textBox:clear()
    for i = 1, #self do
        table.remove(self,1)
    end
end


function textBox:create(x,y,w,action,default)
    local t = {}
    t.x = x or 1
    t.y = y or 1
    t.w = w or 300
    t.action = action
    t.sel = false
    t.text = default or ""
    table.insert(self,t)
end

function textBox:show()
    for i, t in ipairs(self) do
        render:rectangle(2,"fill",t.x,t.y,t.w,line+20,2,0,0,0)
        render:rectangle(2,"line",t.x,t.y,t.w,line+20,2,255,255,255)
        render:textf(2,t.text,t.x,t.y+10,t.w,"center",3)
    end
end

function textBox:update(dt)
    for i, t in ipairs(self) do
        if click then
            if mouse_en(t.x,t.y,t.w,line+20) then
                t.sel = true
                lk.setTextInput(true)
            elseif t.sel then
                lk.setTextInput(false)
                t.sel = false
            end
        end
        t.action(t.text)
    end
end

function love.textinput(txt)
    for i, t in ipairs(textBox) do
        if t.sel and f:getWidth(t.text) < t.w - f:getWidth("A") then
            t.text = t.text..txt
        end
    end
end

function textBox:keyPres(k)
    for i, t in ipairs(self) do
        if k == "backspace" and t.sel then
            t.text = string.sub(t.text,1,-2)
        end
    end
end
