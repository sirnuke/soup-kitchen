-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MapView = Scene:extends()
MapView.__name = 'MapView'

require 'scenes/mapview/map-prop'

function MapView:enter()
  local mapProp = MapProp:new()
  self:addDrawable(Drawable:new(self.core, 'mapview/map',
    Point:new(C.layout.mapview.map)))
  self:addDrawable(Drawable:new(self.core, 'mapview/player-sidebar',
    Point:new(C.layout.mapview.player_sidebar)))
  self:addDrawable(Drawable:new(self.core, 'mapview/game-sidebar',
    Point:new(C.layout.mapview.game_sidebar)))
  self:addDrawable(mapProp)
  --self.addInteractable(mapProp)
end

