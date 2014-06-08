-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Quadrant = Class()
Quadrant.__name = 'Quadrant'

function Quadrant:__init(x, y)
 self.x = x or 1
 self.y = y or 1
end

function Quadrant:duplicate()
  return Quadrant:new(self.x, self.y)
end

function Quadrant:coordinate(offsetx, offsety)
  local offx, offy = offsetx or 0, offsety or 0
  if offx ~= 0 and offy ~= 0 then
    Log(self, 'offset is (%d,%d)', offx, offy)
  end
  return Coordinate:new((self.x - 1 - offx) * C.map.square.width,
    (self.y - 1 - offy) * C.map.square.height)
end

function Quadrant:screen()
  local coordinate = self:coordinate()
  return coordinate:screen()
end

function Quadrant:valid()
  if self.x >= 1 and self.x <= C.map.size.width 
   and self.y >= 1 and self.y <= C.map.size.height then
    return true
  else
    return false
  end
end

function Quadrant.__eq(a, b) 
  if a.x == b.x and a.y == b.y then
    return true
  else
    return false
  end
end

function Quadrant.__tostring(quadrant)
  return string.format('(Q:%i,%i)', quadrant.x, quadrant.y)
end

