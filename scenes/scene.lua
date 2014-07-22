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

function Scene:enter()
  Error(self, "Scene:enter() isn't overridden!")
end

function Scene:exit()
  self:clearProps()
end

function Scene:draw()
  for i,drawable in pairs(self.drawables) do
    drawable:draw()
  end
end

function Scene:update(dt)
  local mouse = self.core.screen:translate(love.mouse.getPosition())
  for i,interactable in pairs(self.interactables) do
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

-- Scene helper functions, in all likely hood none of these will need
-- to be overridden

function Scene:addInteractable(interactable)
  table.insert(self.interactables, interactable)
end

function Scene:addDrawable(drawable)
  table.insert(self.drawables, drawable)
end

function Scene:clearInteractables()
  for i,interactables in pairs(self.interactables) do
    self.interactables[i] = nil
  end
end

function Scene:clearDrawables()
  for i,drawable in pairs(self.drawables) do
    self.drawables[i] = nil
  end
end

function Scene:clearProps()
  self:clearInteractables()
  self:clearDrawables()
end

