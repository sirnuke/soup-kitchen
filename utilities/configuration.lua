-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Configuration = Class { 
  width = C.screen.width,
  height = C.screen.height,
  fullscreen = C.screen.fullscreen,
  fullscreenType = C.screen.fullscreenType,
  letterBoxWidth = C.screen.letterBoxWidth,
  letterBoxHeight = C.screen.letterBoxHeight,
}
Configuration.__name = "Configuration"

function Configuration:__init(ignoreUserSettings)
  if not ignoreUserSettings then
    -- TODO: Attempt to load settings from the user's configuration file
  end
end

