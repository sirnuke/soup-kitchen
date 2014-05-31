-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

local constants = {
  debug = { scale = 2, },

  scale = {
    walk = 150,
    work = 75,
    clock = 1.25,
  },

  screen = {
    width = 1280,
    height = 720,
    fullscreen = false,
    fullscreenType = 'desktop',
    letterBoxWidth = 0,
    letterBoxHeight = 0,
  },
}
local debug = constants.debug
if debug then
  if debug.scale then
    for k,v in pairs(constants.scale) do
      constants.scale[k] = v * debug.scale
    end
  end
end

return constants

