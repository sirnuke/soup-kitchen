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

function MapView:inBounds(point)
  if point.x < self.point.x or point.y < self.point.y or point.x > self.point.x + self.size.w 
    or point.y > self.point.y + self.size.h then
    return false
  else
    return true
  end
end

function MapView:update(mouse, dt)
end

function MapView:mousePressed(point, button)
  if self:inBounds(point) then
    if button == 'r' then
      for k,pawn in pairs(self.controllables) do pawn:mouseSelectedPressed(point) end
    elseif button == 'r' then
      --local quadrant = point:quadrant()
      --for k,pawn in pairs(self.controllables) do pawn:mouseMovementPressed(quadrant) end
    end
  end
end

function MapView:mouseReleased(point, button)
end

