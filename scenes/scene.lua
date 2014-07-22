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
  for i,drawable in self.drawables do
    drawable:draw()
  end
end

function Scene:update(dt)
  local mouse = self.core.screen:translate(love.mouse.getPosition())
  for i,interactable in self.interactables do
    interactable:update(mouse, dt)
  end
end

function Scene:mousepressed(point, button)
  for i,interactable in pairs(self.interactables) do
    interactable:mousepressed(point, button)
  end
end

function Scene:mousereleased(point, button)
  for i,interactable in pairs(self.interactables) do
    interactable:mousereleased(point, button)
  end
end

-- Key presses are ignored by default, as most scenes do not (and will
-- not) need them.  Additionally, few, if any, interactables will responds
-- to them
function Scene:keypressed(key) end
function Scene:keyreleased(key) end

