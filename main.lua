require "extern"
require "math.init"

local function main()
    local v1 = mathf.Vector2d.new(100, 200)
    local v2 = mathf.Vector2d.new(200, 300)
    local v3 = v1 + v2

    print(v3.x, v3.y)

end

main()