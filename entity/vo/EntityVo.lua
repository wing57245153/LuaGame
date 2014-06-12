local EntityVo = class("EntityVo")

function EntityVo:ctor()
    self:init()
end

function EntityVo:init()
    self.id = 0
    self.class = 0
    self.hp = 0
end

return EntityVo