-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MapView = Class()
MapView.__name = 'MapView'

function MapView:__init(core)
  self.core = core
  self.point = C.layout.ingame.mapview.point
  self.size = C.layout.ingame.mapview.size
  self.background = Drawable:new(core, 'ingame/map', self.point)
  self.squares = {}
  self.pawns = {}

  local quadrant = Quadrant:new()
  for y,row in pairs(core.map.data) do
    quadrant.y = y
    for x,square in pairs(row) do
      quadrant.x = x
      table.insert(self.squares, Drawable:new(self.core, string.format('map/%s', square.type),
        quadrant:screen()))
    end
  end
  for k,pawn in pairs(self.core.state.pawns) do
  end
end

function MapView:draw()
  self.background:draw()
  for k,square in pairs(self.squares) do
    square:draw()
  end
  for k,pawn in pairs(self.pawns) do
    pawn:draw()
  end
end

