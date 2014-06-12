local Dictionary = class("Dictionary")

function Dictionary:ctor()
    self._dict = {}
end

function Dictionary:add(key, value)
	assert(self._dict[key] == nil, "exist key in dictionary ")

    self._dict[key] = value
end

function Dictionary:remove(key)
	assert(self._dict[key] ~= nil, "the key not exist")
    self._dict[key] = nil
end

function Dictionary:getValue(key)
	return self._dict[key]
end

function Dictionary:containsKey(key)
	return self._dict[key] ~= nil
end

function Dictionary:clear()

end

return Dictionary