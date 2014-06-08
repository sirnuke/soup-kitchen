-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Coordinate = Class()
Coordinate.__name = 'Coordinate'

function Coordinate:__init(x, y)
  self.x = x or 0
  self.y = y or 0
end

function Coordinate:duplicate()
  return Coordinate:new(self.x, self.y)
end

function Coordinate:quadrant()
  return Quadrant:new(1 + (self.x - (self.x % C.map.square.width)) / C.map.square.width,
                      1 + (self.y - (self.y % C.map.square.height)) / C.map.square.height)
end

function Coordinate:screen()
  return Point:new(self.x + C.layout.mapview.map.x, self.y + C.layout.mapview.map.y)
end

function Coordinate.__eq(a, b)
  if a.x == b.x and a.y == b.y then
    return true
  else
    return false
  end
end

function Coordinate.__sub(a, b)
  return Coordinate:new(a.x - b.x, a.y - b.y)
end

function Coordinate.__add(a, b)
  return Coordinate:new(a.x + b.x, a.y + b.y)
end

function Coordinate.__tostring(coordinate)
  return string.format('(C:%d,%d)', coordinate.x, coordinate.y)
end

