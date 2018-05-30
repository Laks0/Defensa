require "objects/players"

function ld_game()
    clearAll()
    border = width/2

    players:create(name1,class1,color1)
    players:create(name2,class2,color2)

    sideTurn = 1

    buttons:create(width/2-100,height-100,200,100,function ()
        players[sideTurn].sel = false
        if sideTurn == 1 then
            sideTurn = 2
        else
            sideTurn = 1
        end
    end,nil,"Next turn")
end

local draw = function ()
    render:line(1,border,0,border,height,5)
    players:show()
end

function up_game(dt)
    draw()
    players:update(dt)
end
