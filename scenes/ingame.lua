-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

InGame = Scene:extends()
InGame.__name = 'InGame'

function InGame:enter()
  local mapView = MapView:new()
  self:addDrawable(Drawable:new(self.core, 'ingame/map',
    Point:new(C.layout.mapview.map)))
  self:addDrawable(Drawable:new(self.core, 'ingame/player-sidebar',
    Point:new(C.layout.mapview.player_sidebar)))
  self:addDrawable(Drawable:new(self.core, 'ingame/game-sidebar',
    Point:new(C.layout.mapview.game_sidebar)))
  self:addDrawable(mapProp)
  --self.addInteractable(mapProp)
end

