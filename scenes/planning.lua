-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Planning = Scene:extends()
Planning.__name = "Planning"

function Planning:enter()
  self.background = "placeholder"
end

function Planning:exit()
  self.background = nil
end

function Planning:draw()
  -- TODO: Draw background
end

function Planning:update(dt)
end

function Planning:mousepressed(point, button)
end

