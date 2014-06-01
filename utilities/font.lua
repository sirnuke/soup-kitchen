-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

local cache = {}

Font = Class()
Font.__name = 'Font'

-- Size must be a positive integer, style defaults to 'regular'
function Font:__init(size, name)
  assert(type(size) == 'number' and size > 0)
  if not name then name = 'regular' end
  assert(C.fonts.files[name])
  if not cache[name] then cache[name] = {} end
  if not cache[name][size] then
    local font = love.graphics.newFont(C.font.files[name], size)
    cache[name][size] = ReferenceCounting:new(font)
  end
  cache[name][size]:reference()
  self.name = name
  self.size = size
  self.font = cache[name][size].data
end

function Font:free()
  cache[self.name][self.size]:dereference()
  self.font = nil
end

