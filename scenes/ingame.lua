-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

InGame = Scene:extends()
InGame.__name = 'InGame'

function InGame:enter()
  local mapView = MapView:new(self.core, self.core.map)
  self:addDrawable(Drawable:new(self.core, 'ingame/player-sidebar',
    Point:new(C.layout.ingame.playersidebar.point)))
  self:addDrawable(Drawable:new(self.core, 'ingame/game-sidebar',
    Point:new(C.layout.ingame.gamesidebar.point)))
  self:addDrawable(mapView)
  --self.addInteractable(mapProp)
end

