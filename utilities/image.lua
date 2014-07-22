-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

local cache = {}
setmetatable(cache, { __mode = 'k' })

Image = Class()
Image.__name = 'Image'

function Image:__init(name)
  assert(type(name) == 'string')
  self.name = name
  self.path = 'images/' .. name .. '.png'
  if not cache[name] then
    self.data = love.graphics.newImage(self.path)
    cache[name] = self.data
  else
    self.data = cache[name]
  end
end

