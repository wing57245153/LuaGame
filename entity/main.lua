require "Cocos2d"
require "Cocos2dConstants"
require "extern"
require "math.init"
require "entity.init"
require "proc.init"

-- cclog
cclog = function(...)
    print(string.format(...))
end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
    return msg
end

local function main()
    collectgarbage("collect")
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
    
    local v1 = mathf.Vector2d.new(100, 200)
    local v2 = mathf.Vector2d.new(200, 300)
    local v3 = v1 + v2

    print(v3.x, v3.y)

    local entVo = entity.EntityVo.new()
    entVo.id = 10
    local ent = entity.LivedEntity.new(entVo)
    --ent:onEnterWorld()
    --local hp = ent:getAttrValue("hp")
    --print("--------hp-----", hp)

    print("----getter----", ent.attr.id, ent)

    entVo = entity.EntityVo.new()
    entVo.id = 100
    ent = entity.LivedEntity.new(entVo)
    print("-------getter----", ent.attr.id)

    ent.attr.hp = 10000

    print("-------hp-----", ent.attr.hp)

    proc.skill_proc:begin_skill(ent, 10000)
end


local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    error(msg)
end
