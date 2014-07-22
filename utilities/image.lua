-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

local cache = Cache:new()

Image = Class()
Image.__name = 'Image'

function Image:__init(name)
  assert(type(name) == 'string')
  self.name = name
  self.path = 'images/' .. name .. '.png'
  if not cache:get(name) then
    self.data = love.graphics.newImage(self.path)
    cache:set(name, self.data)
  else
    self.data = cache:get(name)
  end
end

