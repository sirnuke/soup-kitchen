-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

require 'scenes/scene'
require 'scenes/mainmenu'
require 'scenes/ingame'
require 'scenes/instructions'
require 'scenes/planning'

require 'map/map'
require 'map/square'

require 'pawns/pawn'
require 'pawns/aicontrolled'
require 'pawns/playercontrolled'
require 'pawns/coordinator'

require 'state/state'
require 'state/time'

require 'views/ingame/mapview'
require 'views/ingame/playersidebar'

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
  self.scenes.ingame = InGame:new(self)
  self.scenes.planning = Planning:new(self)

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

function Core:newGame()
  self.map = Map:new(self)
  self.state = State:new(self)
end

function Core:keyPressed(key)
  self.scene:keyPressed(key)
end

function Core:keyReleased(key)
  self.scene:keyReleased(key)
end

function Core:mousePressed(x, y, button)
  self.scene:mousePressed(self.screen:translate(x, y), button)
end

function Core:mouseReleased(x, y, button)
  self.scene:mouseReleased(self.screen:translate(x, y), button)
end

