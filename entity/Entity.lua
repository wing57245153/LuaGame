local Entity = class("Entity")

Entity.attr = {}  --public getter setter
local mt = {}
mt.__index = function(table, key)
        return Entity:getAttrValue(key)
    end
mt.__newindex = function(table, key, value)
        Entity:setAttrValue(key, value)
    end
setmetatable(Entity.attr, mt)

function Entity:ctor(entityVo)
    
    self.entityVo = entityVo --protect
    print("-----Entity----ctor", self)
end

--------------- override function------
-----public function must be overrided if subclass call----
function Entity:onEnterWorld()
	print("------onEnterWorld-------")
end

function Entity:onLeaveWorld()
	print("-----onLeaveWorld---------")
end

--------------------------
---------protect------------
function Entity:getAttrValue(key)
    return self.entityVo[key]
end

function Entity:setAttrValue(key, value)
	self.entityVo[key] = value
end

return Entity