local TimerManager = {}

function TimerManager:init()
    self.dict = collections.Dictionary.new()
end

function TimerManager:add(delay, repeatCount, object, timerCallBack, completeCallBack)
    local timer = timer.Timer.new(delay, repeatCount, object, timerCallBack, completeCallBack)
    timer:start()

    local timerId = timer:getId()
    self.dict:add(timerId, timer)
end

TimerManager:init()

return TimerManager