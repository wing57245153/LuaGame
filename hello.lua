
-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cLog:error(GAME_TAG, "----------------------------------------")
    cLog:error(GAME_TAG, "LuaScript error! error's msg = %s", tostring(msg))
    cLog:error(GAME_TAG, "LuaScript error! %s", tostring(debug.traceback()))
    cLog:error(GAME_TAG, "----------------------------------------")

    if _G["handleAfterScriptsCrash"] ~= nil then
        handleAfterScriptsCrash()
    end
end

local function main()
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
    
    --require "scripts/game"
    --if initGameFramework() == true then
    --    initeGame()
    --end
    require "main"

    -- require "gameLoader"
    -- require "texture/TestTexture"
end

xpcall(main, __G__TRACKBACK__)
