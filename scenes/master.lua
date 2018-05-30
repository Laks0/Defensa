require "scenes/menu"
require "scenes/game"

scenes = {
    function (dt) up_menu(dt) end,
    function (dt) up_game(dt) end,
}

load = {
    function () ld_menu() end,
    function () ld_game() end,
}
