-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

require 'scenes/scene'
require 'scenes/mainmenu'

Core = Class {
  scenes = { next = nil },
  scene = nil,
}
Core.__name = "Core"

function Core:__init(ignoreUserSettings)
  self.config = Configuration:new(ignoreUserSettings)
  self.scenes.mainmenu = MainMenu:new(self)

  self.scene = self.scenes.mainmenu
  self.scene:enter()
end

function Core:draw()
  love.graphics.setColor(255, 255, 255, 255)
  self.scene:draw()
end

function Core:update(dt)
  self.scene:update(dt)
  if self.scenes.next then
    self.scene:exit()
    self.scene = self.scenes[self.scenes.next]
    self.scene:enter()
    self.scenes.next = nil
  end
end

function Core:switch(scene)
  assert(self.scenes[self.scenes.next])
  self.scenes.next = scene
end

function Core:keypressed(key)
  self.scene:keypressed(key)
end

function Core:keyreleased(key)
  self.scene:keyreleased(key)
end
