-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Planning = Scene:extends()
Planning.__name = 'Planning'

function Planning:enter()
  self.background = Image:new('planning/background.png')
end

function Planning:exit()
  self.background:free()
  self.background = nil
end

function Planning:draw()
  self.core.screen:draw(self.background.image)
end

function Planning:update(dt)
end

function Planning:mousepressed(point, button)
  if button == 'l' then
    self.core:switch('mapview')
  end
end

