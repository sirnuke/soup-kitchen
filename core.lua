-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Core = Class {
  scenes = {}
}
Core.__name = "Core"

function Core:__init(ignoreUserSettings)
  self.config = Configuration:new(ignoreUserSettings)
  self.scenes.mainmenu = MainMenu:new(self)
end

