-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MainMenu = Scene:extends()
MainMenu.__name = 'MainMenu'

function MainMenu:enter()
  self:addDrawable(Drawable:new(self.core, 'mainmenu/background.png', Point:new(0, 0)))
end

function MainMenu:exit()
  self:clearDrawables()
end

function MainMenu:mousepressed(point, button)
  if button == 'l' then self.core:switch('instructions') end
end

