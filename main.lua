lg = love.graphics
lm = love.mouse

width = 1280
height = 720

wres = lg.getWidth()/width
hres = lg.getHeight()/height

require "tools/functions"
render = require "tools/render"

require "scenes/master"

function love.load()
    canvas = lg.newCanvas(width, height)
    scene = 1
end

function love.update(dt)
    f = love.graphics.getFont()
    line = f:getHeight("A")
    mouse = {
        x = lm.getX() / wres,
        y = lm.getY() / hres
    }
    render:clear()

    scenes[scene](dt)
end

function love.draw()
    lg.setCanvas(canvas)

    render:render(1)
    render:render(2)

    lg.setCanvas()

    lg.setColor(255,255,255)
    lg.draw(canvas,0,0,0,wres,hres)
end
