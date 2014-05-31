-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Configuration = Class { 
  screen = {
    size = {
      width = C.screen.size.width,
      height = C.screen.size.height,
    },
    fullscreen = {
      enabled = C.screen.fullscreen.enabled,
      type = C.screen.fullscreen.type,
    },
    letterbox = {
      width = C.screen.letterbox.width,
      height = C.screen.letterbox.height,
    },
  }
}
Configuration.__name = "Configuration"

function Configuration:__init(ignoreUserSettings)
  if not ignoreUserSettings then
    -- TODO: Attempt to load settings from the user's configuration file
  end
end

