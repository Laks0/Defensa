lg = love.graphics
lm = love.mouse
lk = love.keyboard

width = 1280
height = 720

wres = lg.getWidth()/width
hres = lg.getHeight()/height

require "tools/functions"
render = require "tools/render"

require "objects/buttons"
require "objects/sliders"
require "objects/textBox"
require "objects/lists"

require "scenes/master"

local rS30 = lg.newFont("res/RomanSerif.ttf",25)
lg.setFont(rS30)

function love.load()
    canvas = lg.newCanvas(width, height)
    scene = 1

    load[scene]()
end

function love.update(dt)
    lk.setKeyRepeat(true)

    f = love.graphics.getFont()
    line = f:getHeight("A")
    mouse = {
        x = lm.getX() / wres,
        y = lm.getY() / hres
    }
    render:clear()

    scenes[scene](dt)

    textBox:update(dt)
    buttons:update(dt)
    sliders:update(dt)
    lists:update(dt)

    click = false
    rel = false
end

function love.draw()
    buttons:show()
    sliders:show()
    textBox:show()
    lists:show()

    lg.setCanvas(canvas)
    lg.clear()

    render:render(1)
    render:render(2)

    lg.setCanvas()

    lg.setColor(255,255,255)
    lg.draw(canvas,0,0,0,wres,hres)
end

function clearAll()
    buttons:clear()
    lists:clear()
    sliders:clear()
    textBox:clear()
end
