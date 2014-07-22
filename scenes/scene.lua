-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Scene = Class()
Scene.__name = "Scene"

function Scene:__init(core)
  assert(core)
  self.core = core
  self.interactables = {}
  self.drawables = {}
end

function Scene:add_interactable(interactable)
  table.insert(self.interactables, interactable)
end

function Scene:add_drawable(drawable)
  table.insert(self.drawables, drawable)
end

function Scene:enter()
  Warn(self, "Scene:enter() isn't overridden!")
end

function Scene:exit()
  Warn(self, "Scene:exit() isn't overridden!")
end

function Scene:draw()
  Warn(self, "Scene:draw() isn't overridden!")
end

function Scene:update(dt)
  Warn(self, "Scene:draw(%i) isn't overridden!", dt)
end

-- Scenes only need to override input that they need
function Scene:keypressed(key) end
function Scene:keyreleased(key) end
function Scene:mousepressed(point, button) end
function Scene:mousereleased(point, button) end

