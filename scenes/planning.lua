-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Planning = Scene:extends()
Planning.__name = 'Planning'

function Planning:enter()
  self:addDrawable(Drawable:new(self.core, 'planning/background', Point:new(0, 0)))
  self.core.state:newDay()
end

function Planning:mousePressed(point, button)
  if button == 'l' then
    self.core:switch('ingame')
  end
end

