-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MapView = Scene:extends()
MapView.__name = 'MapView'

function MapView:enter()
  self.map_background = Drawable:new(self.core, 'mapview/map.png',
    Point:new(C.layout.mapview.map))
  self.player_sidebar = Drawable:new(self.core, 'mapview/player-sidebar.png',
    Point:new(C.layout.mapview.player_sidebar))
  self.game_sidebar = Drawable:new(self.core, 'mapview/game-sidebar.png',
    Point:new(C.layout.mapview.game_sidebar))
end

function MapView:exit()
  self.map_background:free()
  self.player_sidebar:free()
  self.game_sidebar:free()
  self.map_background = nil
  self.player_sidebar = nil
  self.game_sidebar = nil
end

function MapView:draw()
  self.game_sidebar:draw()
  self.map_background:draw()
  self.player_sidebar:draw()
  self.core.map:draw()
end

function MapView:update(dt)
end

function MapView:mousepressed(point, button)
end

