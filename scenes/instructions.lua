-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Instructions = Scene:extends()
Instructions.__name = 'Instructions'

function Instructions:enter()
  self.background = Drawable:new(self.core, 'instructions/background.png', Point:new(0, 0))
end

function Instructions:exit()
  self.background:free()
  self.background = nil
end

function Instructions:draw()
  self.background:draw()
end

function Instructions:update(dt) end

function Instructions:mousepressed(point, button)
  if button == 'l' then self.core:switch('planning') end
end

