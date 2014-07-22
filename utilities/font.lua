-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

local cache = Cache:new()

Font = Class()
Font.__name = 'Font'

-- Size must be a positive integer, style defaults to 'regular'
function Font:__init(size, name)
  assert(type(size) == 'number' and size > 0)
  if not name then name = 'regular' end
  self.name = name
  self.size = size
  local id = name .. "-" .. size
  assert(C.fonts.files[name])
  if not cache:get(id) then
    self.font = love.graphics.newFont(C.font.files[name], size)
    cache:get(id):set(id, self.font)
  else
    self.font = cache:get(id)
  end
end

