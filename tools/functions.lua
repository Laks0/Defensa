function mouse_en(x,y,w,h)
    return mouse.x > x and mouse.x < x + w and mouse.y > y and mouse.y < y + h and click
end

function dist(x,y,x2,y2)
    return math.sqrt((x-x2)^2 + (y-y2)^2)
end

function sign(n)
    if n > 0 then
        return 1
    elseif n < 0 then
        return -1
    elseif n == 0 then
        return 0
     end
end

function love.mousepressed(x, y, b)
    click = (b == 1)
end

function love.mousereleased(x, y, b)
    rel = true
end

function love.keypressed(k, scancode, isrepeat)
    textBox:keyPres(k)
end
