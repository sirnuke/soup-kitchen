-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

InGame = Scene:extends()
InGame.__name = 'InGame'

function InGame:enter()
  local mapView = MapView:new(self.core)
  local playerSidebar = PlayerSidebar:new(self.core)
  self:addDrawable(Drawable:new(self.core, 'ingame/game-sidebar',
    Point:new(C.layout.ingame.gamesidebar.point)))
  self:addDrawable(playerSidebar)
  self:addDrawable(mapView)
  --self.addInteractable(mapView)
  --self:addInteractable(playerSidebar)
end

