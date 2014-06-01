-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MapView = Scene:extends()
MapView.__name = 'MapView'

function MapView:enter()
  self.map_background = Image:new('mapview/map.png')
  self.player_sidebar = Image:new('mapview/player-sidebar.png')
  self.game_sidebar = Image:new('mapview/game-sidebar.png')
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
  self.core.screen:draw(self.map_background.image, C.layout.mapview.map)
  self.core.screen:draw(self.player_sidebar.image, C.layout.mapview.player_sidebar)
  self.core.screen:draw(self.game_sidebar.image, C.layout.mapview.game_sidebar)
  self.core.map:draw()
end

function MapView:update(dt)
end

function MapView:mousepressed(point, button)
end

