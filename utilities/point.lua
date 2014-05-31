-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Point = Class()
Point.__name = 'Point'

function Point:__init(x, y)
  assert(x != nil and y != nil)
  self.x = x
  self.y = y
end

function Point.__eq(a, b)
  if a.x == b.x and a.y == b.y then
    return true
  else
    return false
  end
end

