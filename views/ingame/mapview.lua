-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MapView = Class()
MapView.__name = 'MapView'

function MapView:__init(core, map)
  self.core = core
  self.map = map
  self.point = C.layout.ingame.mapview.point
  self.size = C.layout.ingame.mapview.size
  self.background = Drawable:new(core, 'ingame/map', self.point)
  self.squares = {}

  local quadrant = Quadrant:new()
  for y,row in pairs(map.data) do
    quadrant.y = y
    for x,square in pairs(row) do
      quadrant.x = x
      table.insert(self.squares, Drawable:new(self.core, string.format('map/%s', square.type),
        quadrant:screen()))
    end
  end
end

function MapView:draw()
  self.background:draw()
  for k,square in pairs(self.squares) do
    square:draw()
  end
end

