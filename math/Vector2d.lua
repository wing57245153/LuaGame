local Vector2d = class("Vector2d")

function Vector2d:ctor(x, y)
    self.x = x
    self.y = y
end

function Vector2d.add(a, b)
	assert(getmetatable(a) == Vector2d and getmetatable(b) == Vector2d, "must Vector2d type")
    return Vector2d.new(a.x + b.x, a.y + b.y)
end

Vector2d.__add = Vector2d.add

return Vector2d