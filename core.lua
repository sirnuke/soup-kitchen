-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

require 'scenes/scene'
require 'scenes/instructions'
require 'scenes/mainmenu'
require 'scenes/mapview'
require 'scenes/planning'

require 'map/map'
require 'map/square'

require 'pawns/pawn'
require 'pawns/aicontrolled'
require 'pawns/playercontrolled'
require 'pawns/coordinator'

Core = Class {
  scenes = { next = nil },
  scene = nil,
}
Core.__name = "Core"

function Core:__init(ignoreUserSettings)
  self.config = Configuration:new(ignoreUserSettings)
  self.screen = Screen:new(self.config)

  self.scenes.mainmenu = MainMenu:new(self)
  self.scenes.instructions = Instructions:new(self)
  self.scenes.mapview = MapView:new(self)
  self.scenes.planning = Planning:new(self)

  self.scene = self.scenes.mainmenu
  self.scene:enter()

  self.map = Map:new(self)
end

function Core:draw()
  love.graphics.setColor(255, 255, 255, 255)
  self.scene:draw()
end

function Core:update(dt)
  self.scene:update(dt)
  if self.scenes.next then
    self.scene:exit()
    self.scene = self.scenes.next
    self.scene:enter()
    self.scenes.next = nil
  end
end

function Core:switch(scene)
  Log(self, 'switching to %s!', scene)
  assert(self.scenes[scene])
  self.scenes.next = self.scenes[scene]
end

function Core:keypressed(key)
  self.scene:keypressed(key)
end

function Core:keyreleased(key)
  self.scene:keyreleased(key)
end

function Core:mousepressed(x, y, button)
  self.scene:mousepressed(self.screen:translate(x, y), button)
end

function Core:mousereleased(x, y, button)
  self.scene:mousereleased(self.screen:translate(x, y), button)
end

