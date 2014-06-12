
proc = {}

local function init()
    proc.skill_common = require("proc.common")
    proc.data_skill = require("proc.skill.data_skill")

    proc.skill_proc = require("proc.skill.skill_proc")   
end

init()