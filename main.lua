require "extern"
require "math.init"
require "entity.init"
require "proc.init"
require "utility.init"

local function main()
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

    --delay, repeatCount, object, timerCallBack, completeCallBack
    local function completeCallBack()
        print("--------completeCallBack----------")
    end
    timer.TimerManager:add(2, 1, nil, nil, completeCallBack)
end

main()