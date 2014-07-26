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
  self.controllables = {}
  self.ais = {}

  local quadrant = Quadrant:new()
  for y,row in pairs(core.map.data) do
    quadrant.y = y
    for x,square in pairs(row) do
      quadrant.x = x
      table.insert(self.squares, Drawable:new(self.core, string.format('map/%s', square.type),
        quadrant:screen()))
    end
  end
  for k,pawn in pairs(self.core.state.controllables) do
    table.insert(self.controllables, ControllablePawnView:new(self.core, pawn))
  end
  for k,pawn in pairs(self.core.state.ais) do
    table.insert(self.ais, PawnView:new(self.core, pawn))
  end
end

function MapView:draw()
  self.background:draw()
  for k,square in pairs(self.squares) do square:draw() end
  for k,pawn in pairs(self.ais) do pawn:draw() end
  for k,pawn in pairs(self.controllables) do pawn:draw() end
end

function MapView:update(mouse, dt)
end

function MapView:mousePressed(point, button)
end

function MapView:mouseReleased(point, button)
end

