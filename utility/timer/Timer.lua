
--[[
    时间计时器类，基于cocos2dx 3.0
    1. 设置具体时间，可在未来具体时间时触发某个事件 ->onComplete
    2. 计时器倒计时，每次倒计时都可以回调 ->onTimer
]]

local Timer = class("Timer")

function Timer:ctor(delay, repeatCount, object, timerCallBack, completeCallBack)

    self:setDelay(delay)
    self:setRepeatCount(repeatCount)
    self:setTimerCallBackFunc(object, timerCallBack, completeCallBack)
    self:reset()

    self._bRunning          = false
    self._id                = nil
end

function Timer:finalize()

    self:stop()

    self._delay             = nil
    self._repeatCnt         = nil
    self._bRunning          = nil
    self._currCount         = nil
    self._target            = nil
    self._timerFunc         = nil
    self._completeFunc      = nil
    self._id                = nil
end

function Timer:getId()
    return self._id
end

-- 计时器事件间的延迟（以秒为单位）
function Timer:setDelay(delay)
    self._delay     = delay
end

-- 设置的计时器运行总次数，若为0则循环执行
function Timer:setRepeatCount(repeatCount)
    self._repeatCnt = repeatCount
end

-- 计时器是否在运行中
function Timer:isRunning()
    return self._bRunning
end

function Timer:getCurrCount()
    return self._currCount
end

-- 若不采用事件的方式，可以采用回调的方式
function Timer:setTimerCallBackFunc(object, timerCallBack, completeCallBack)
    self._target        = object
    self._timerFunc     = timerCallBack
    self._completeFunc  = completeCallBack
end

-- 如果计时器正在运行，则停止计时器，并将currCount属性设置为0，类似于秒表的重置
function Timer:reset()
    self._currCount     = 0
end

-- 如果计时器尚未运行，则启动计时器
function Timer:start()

    if self._bRunning == true then
        --cLog:warn(cross.CROSS_TAG, "Timer:start, timer is running!")
        assert("Timer:start, timer is running!")
        return
    end

    local function onTimer(dt)
        self:onTimer(dt)
    end

    self:reset()
    local scheduler = cc.Director:getInstance():getScheduler()
    self._id        = scheduler:scheduleScriptFunc(onTimer, self._delay, false)
    self._bRunning  = true
end

-- 计时回调
function Timer:onTimer(dt)

    self._currCount = self._currCount + 1

    if self._repeatCnt > 0 and self._currCount >= self._repeatCnt then

        self:stop()
    end

    -- timer回调
    if self._timerFunc ~= nil then
        -- 回调
        if self._target ~= nil then
            self._timerFunc(self._target, dt, self._currCount)
        else
            self._timerFunc(dt, self._currCount)
        end        
    end

    -- 计时完成的回调
    if self._currCount >= self._repeatCnt and self._repeatCnt > 0 and self._completeFunc ~= nil then
        
        -- 回调
        if self._target ~= nil then
            self._completeFunc(self._target)
        else
            self._completeFunc()
        end 
    end

    
end

-- 停止计时器
function Timer:stop()

    if self._bRunning == true then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._id)
        self._id        = nil
        self._bRunning  = false
    end
end

return Timer