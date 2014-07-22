-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Cache = Class()
Cache.__name = "Cache"

function Cache:__init()
  self.cache = {}
  setmetatable(self.cache, { __mode = 'v' })
end

function Cache:get(name)
  return self.cache[name]
end

function Cache:set(name, value)
  self.cache[name] = value
end

