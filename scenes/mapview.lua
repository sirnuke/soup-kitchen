-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MapView = Scene:extends()
MapView.__name = 'MapView'

function MapView:enter()
  self.background = Image:new('mapview/background.png')
end

function MapView:exit()
  self.background:free()
  self.background = nil
end

function MapView:draw()
  self.core.screen:draw(self.background.image)
end

function MapView:update(dt)
end

function MapView:mousepressed(point, button)
end

