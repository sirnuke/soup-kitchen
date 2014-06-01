-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MainMenu = Scene:extends()
MainMenu.__name = 'MainMenu'

function MainMenu:enter()
  self.background = Image:new('mainmenu/background.png')
end

function MainMenu:exit()
  self.background:free()
  self.background = nil
end

function MainMenu:draw()
  self.core.screen:draw(self.background.image)
end

function MainMenu:update(dt) end

function MainMenu:mousepressed(point, button)
  if button == 'l' then
    self.core:switch('planning')
  end
end

