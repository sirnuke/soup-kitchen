-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Instructions = Scene:extends()
Instructions.__name = 'Instructions'

function Instructions:enter()
  self:addDrawable(Drawable:new(self.core, 'instructions/background', Point:new(0, 0)))
end

function Instructions:mousePressed(point, button)
  if button == 'l' then self.core:switch('planning') end
end

