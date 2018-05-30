sliders = {}

function sliders:clear()
    for i = 1, #self do
        table.remove(self,1)
    end
end


function sliders:create(x,y,w,action,name,ini,color)
    local s = {}
    s.x = x
    s.y = y
    s.w = w
    s.sel = false
    s.name = name or ""
    s.action = action
    s.val = ini or 0
    s.color = color or {255,255,255}
    table.insert(self,s)
end

function sliders:show()
    for i, s in ipairs(self) do
        render:rectangle(2,"fill",s.x,s.y,s.w+20,20,2,s.color)
        render:rectangle(2,"fill",s.x+s.val,s.y-15,20,50,2)
        render:textf(2,s.name,0,s.y-7,s.x-10,"right",2,s.color)
    end
end

function sliders:update(dt)
    for i, s in ipairs(self) do
        if mouse_en(s.x+s.val,s.y-15,20,50) then
            s.sel = true
        end
        if rel then
            s.sel = false
        end
        if s.sel then
            s.val = mouse.x-s.x
        end
        if s.val > s.w then
            s.val = s.w
        end
        if s.val < 0 then
            s.val = 0
        end
        s.action(s.val)
    end
end
