function ld_menu()
    color1 = {math.random(255),math.random(255),math.random(255)}
    color2 = {math.random(255),math.random(255),math.random(255)}
    name1 = ""
    name2 = ""
    class1 = 1
    class2 = 2

    sliders:create(50,500,205,function (v)
        color1[1] = v+50
    end,"R",color1[1],{255,0,0})

    sliders:create(50,570,205,function (v)
        color1[2] = v+50
    end,"G",color1[2],{0,255,0})

    sliders:create(50,640,205,function (v)
        color1[3] = v+50
    end,"B",color1[3],{0,0,255})


    sliders:create(width-300,500,205,function (v)
        color2[1] = v+50
    end,"R",color2[1],{255,0,0})

    sliders:create(width-300,570,205,function (v)
        color2[2] = v+50
    end,"G",color2[2],{0,255,0})

    sliders:create(width-300,640,205,function (v)
        color2[3] = v+50
    end,"B",color2[3],{0,0,255})


    textBox:create(width/4-150,50,300,function (t)
        name1 = t
    end,"Player 1")

    textBox:create(width*(3/4)-150,50,300,function (t)
        name2 = t
    end,"Player 2")


    lists:create(width/4,150,{"Economic","Warrior"},function (o)
        class1 = o
    end,2,"Class",{0,0,0})
    lists:create(width/4*3,150,{"Economic","Warrior"},function (o)
        class1 = o
    end,1,"Class",{0,0,0})
end

local draw = function ()
    render:rectangle(1,"fill",0,0,width/2,height,2,color1)
    render:rectangle(1,"fill",width/2,0,width/2,height,2,color2)
end

function up_menu(dt)
    draw()
end
