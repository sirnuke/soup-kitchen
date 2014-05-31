-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

MainMenu = Scene:extends()
MainMenu.__name = "MainMenu"

function MainMenu:enter()
  self.background = "placeholder"
end

function MainMenu:exit()
  self.background = nil
end

function MainMenu:draw()
  -- TODO: Draw background
end

function MainMenu:update(dt) end

function MainMenu:mousepressed(point, button)
  if button == 'l' then
    -- TODO: Switch to next scene
  end
end

