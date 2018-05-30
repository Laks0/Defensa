players = {}

function players:create(name,class,color)
    local p = {}
    p.name = name
    p.class = class
    p.color = color
    p.mny = 25
    p.sx = 0
    p.sy = 0
    p.sel = false

    table.insert(self,p)
end

function players:update(dt)
    for i, p in ipairs(self) do
        if i == sideTurn then
            if click then
                if i == 1 then
                    if mouse.x < border then
                        p.sx = mouse.x
                        p.sy = mouse.y
                        p.sel = not p.sel
                    else
                        p.sel = false
                    end
                else
                    if mouse.x > border then
                        p.sx = mouse.x
                        p.sy = mouse.y
                        p.sel = not p.sel
                    else
                        p.sel = false
                    end
                end

                if p.sel then
                    buttons:create(p.sx+10,p.sy,300,line,function (id)

                    end,
                    function (id,dt)
                        if not players[sideTurn].sel then
                            table.remove(buttons,id)
                        end
                    end,"Create something")
                end
            end
        end
    end
end

function players:show()
    for i, p in ipairs(self) do
        local class = " (W)"
        if p.class == 2 then
            class = " (E)"
        end

        local bkg = p.color
        table.insert(bkg,0)
        if i == sideTurn then
            bkg[4] = 150
        else
            bkg[4] = 100
        end

        if i == 1 then
            render:rectangle(1,"fill",0,0,border,height,4,bkg)
            render:textf(1,p.name..class.."\n$"..p.mny,0,0,width,"left",5,255,255,255)
        else
            render:rectangle(1,"fill",border,0,width-border,height,4,bkg)
            render:textf(1,p.name..class.."\n$"..p.mny,0,0,width,"right",5,255,255,255)
        end

        if p.sel then
            render:circle(2,"fill",p.sx,p.sy,5,4,255,255,0)
        end
    end
end
