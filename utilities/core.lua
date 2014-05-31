-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Core = Class()
Core.__name = "Core"

function Core:__init(ignoreUserSettings)
  self.config = Configuration:new(ignoreUserSettings)
end

