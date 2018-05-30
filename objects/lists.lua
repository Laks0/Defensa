lists = {}

function lists:create(x,y,options,action,def,title,color)
    local l = {}
    l.x = x
    l.y = y
    l.options = options
    l.action = action
    l.sel = def or 1
    l.title = title or ""
    l.color = color or {255,255,255}
    table.insert(self,l)
end

function lists:show()
    for i, l in ipairs(self) do
        render:textf(2,l.title,l.x-100,l.y-line,200,"center",2,l.color)
        for x = 1, #l.options do
            local clr = {200,200,200}
            if l.sel == x then
                clr = {100,100,100}
            end

            render:rectangle(2,"fill",l.x-f:getWidth(l.options[x])/2,l.y+(x-1)*(line+10),f:getWidth(l.options[x]),line,2,clr)
            render:textf(2,l.options[x],l.x-100,l.y+(x-1)*(line+10),200,"center",2,0,0,0)
        end
    end
end

function lists:update(dt)
    for i, l in ipairs(self) do
        for x = 1, #l.options do
            if mouse_en(l.x-f:getWidth(l.options[x])/2,l.y+(x-1)*(line+10),f:getWidth(l.options[x]),line) then
                l.sel = x
            end
        end
        l.action(l.sel)
    end
end
