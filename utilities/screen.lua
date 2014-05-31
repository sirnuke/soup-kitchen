-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Screen = Class {
  scale = {},
  size = {},
  letterbox = {}
}
Screen.__name = 'Screen'
function Screen:__init(config)
  assert(config)

  self.size.width = config.screen.size.width
  self.size.height = config.screen.size.height
  self.letterbox.width = config.screen.letterbox.width
  self.letterbox.height = config.screen.letterbox.height

  self.scale.width = C.screen.size.width / (self.size.width - self.letterbox.width)
  self.scale.height = C.screen.size.height / (self.size.height - self.letterbox.height)

  if self.scale.width ~= self.scale.height then
    Warn(self, 'nonmatching screen scales of (w:%f h:%f)', self.scale.width, self.scale.height)
  else
    if self.scale.width ~= 1 then Log(self, "scaling width to (%f)", self.scale.width) end
    if self.scale.height ~= 1 then Log(self, "Scaling height to (%f)", self.scale.height) end
  end

  local settings = {}
  if config.screen.fullscreen.enabled then
    settings.fullscreen = true
    settings.fullscreentype = config.screen.fullscreen.type
  end

  love.window.setMode(self.size.width, self.size.height, settings)
  love.window.setTitle("Soup Kitchen")
end

function Screen:translate(x, y)
  return Point:new(x / self.scale.width - self.letterbox.width,
                   y / self.scale.height - self.letterbox.height)
end

-- rotation defaults to 0 if not set
function Screen:draw(drawable, location, rotation)
  local rot = rotation or 0
  love.graphics.draw(drawable, location.x, location.y, rot, self.scale.width, self.scale.height,
    self.letterbox.width, self.letterbox.height)
end

-- rotation defaults to 0 if not set
function Screen:print(text, location, rotation)
  local rot = rotation or 0
  love.graphics.print(text, location.x, location.y, rot, self.scale.width, self.scale.height,
    self.letterbox.width, self.letterbox.height)
end

