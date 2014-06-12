local LivedEntity = class("LivedEntity", entity.Entity)

function LivedEntity:ctor(entityVo)
    
    self.super:ctor(entityVo)

    print("-----LivedEntity----ctor", self.super, self)
end

return LivedEntity