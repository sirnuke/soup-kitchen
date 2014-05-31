-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MapView = Scene:extends()
MapView.__name = "MapView"

function MapView:enter()
  self.background = "placeholder"
end

function MapView:exit()
  self.background = nil
end

function MapView:draw()
  -- TODO: Draw background
end

function MapView:update(dt)
end

function MapView:mousepressed(point, button)
end

