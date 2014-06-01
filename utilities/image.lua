-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

local cache = {}

Image = Class()
Image.__name = 'Image'

function Image:__init(filename)
  assert(type(filename) == 'string')
  filename = 'images/' .. filename
  if not cache[filename] then
    local image = love.graphics.newImage(filename)
    cache[filename] = ReferenceCounting:new(image)
  end
  cache[filename]:reference()
  self.filename = filename
  self.image = cache[filename].data
end

function Image:free()
  cache[self.filename]:dereference()
  self.image = nil
end

