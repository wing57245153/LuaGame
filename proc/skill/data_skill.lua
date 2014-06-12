-------技能相关数据处理------
local data_skill = {}

----技能是否需要引导----
function data_skill:get_skill_is_need_guide( skillId )
    return proc.skill_common.NO_GUIDE
end

return data_skill