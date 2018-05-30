buttons = {}

function buttons:create(x,y,w,h,action,text,r1,g1,b1,h1,r2,g2,h2)
    local b = {}
    b.x = x or 1
    b.y = y or 1
    b.w = w or 200
    b.h = h or 50
    b.action = action
    b.text = text or ""
    b.back = {r1 or 100,g1 or 100,b1 or 100,h1 or 255}
    b.line = {r2 or 255,g2 or 255,b2 or 255,h2 or 255}
    table.insert(self,b)
end

function buttons:show()
    for i, b in ipairs(self) do
        render:rectangle(2,"fill",b.x,b.y,b.w,b.h,2,b.back)
        render:rectangle(2,"line",b.x,b.y,b.w,b.h,2,b.line)
        render:textf(2,b.text,b.x,b.y+b.h/2-line/2,b.w,"center",3,0,0,0)
    end
end

function buttons:update(dt)
    for i, b in ipairs(self) do
        if mouse_en(b.x,b.y,b.w,b.h) then
            b.action()
        end
    end
end
