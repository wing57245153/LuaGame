collections = {}
timer = {}
local function init()
    collections.Dictionary = require("utility.collections.Dictionary")
    timer.Timer = require ("utility.timer.Timer")
    timer.TimerManager = require("utility.timer.TimerManager")
end

init()