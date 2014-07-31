-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Point = Class()
Point.__name = 'Point'

function Point:__init(x, y)
  if type(x) == 'table' and type(y) == 'nil' then
    self.x = x.x
    self.y = x.y
  elseif type(x) == 'number' and type(y) == 'number' then
    self.x = x
    self.y = y
  else
    assert(false, string.format("Invalid arguments x:'%s', y:'%s'", x, y))
  end
end

function Point:duplicate()
  return Point:new(self.x, self.y)
end

function Point:coordinate()
  return Coordinate:new(self.x - C.layout.ingame.mapview.point.x,
    self.y - C.layout.ingame.mapview.point.y)
end

function Point:quadrant()
  return self:coordinate():quadrant()
end

function Point.__eq(a, b)
  if a.x == b.x and a.y == b.y then
    return true
  else
    return false
  end
end

function Point.__tostring(point)
  return string.format("(P:%i,%i)", point.x, point.y)
end

