--------技能处理----------

local skill_proc = {}

------技能开始（引导流程）
function skill_proc:begin_skill(caster, skillId, Type)
    if Type == proc.skill_common.SKILL_BEGIN_ACT then
        self:do_skill_act(caster, skillId)
    elseif Type == proc.skill_common.SKILL_BEFORE_ACT then ---  前摇
        self:do_skill_before_act(caster, skillId)
        --self:setIsAiSleep(caster, true)
    elseif Type == proc.skill_common.SKILL_AFTER_ACT then ---后摇结束 结束技能
        --self:setIsAiSleep(caster, false)
        print("--------end skill---------------")
	else
		local result, newTargets = self:check_skill_cast(caster, skillId)
        if result == false then
            return result, newTargets ---返回执行结果
        end
        self:check_guide(caster, skillId)
    end
    return true
end

----判断一个技能的条件码能不能通过
function skill_proc:check_skill_cast(caster, skillId)
	return true
end

-----判断需不需要引导（引导包）
function skill_proc:check_guide(caster, skillId)
    local is_need_guide = proc.data_skill:get_skill_is_need_guide(skillId)

    if is_need_guide == proc.skill_common.NO_GUIDE then
        self:begin_skill(caster, skillId, proc.skill_common.SKILL_BEFORE_ACT) --前摇
    else ----------有引导
        ---send package
    end
end

--前摇处理
function skill_proc:do_skill_before_act(caster, skillId)
	---send package
    self:begin_skill(caster, skillId, proc.skill_common.SKILL_BEGIN_ACT)
end

--技能打击
function skill_proc:do_skill_act( caster, skillId )
	---send package
    self:do_skill_after_act(caster, skillId)
end

---后摇
function skill_proc:do_skill_after_act(caster, skillId)
	---send package
    self:begin_skill(caster, skillId, proc.skill_common.SKILL_AFTER_ACT)
end

return skill_proc