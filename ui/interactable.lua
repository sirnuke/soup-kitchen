-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Interactable = Class()
Interactable.__name = "Interactable"

function Interactable:__init(point, width, height)
  assert(width and height)
  if point then self.point = point:duplicate() end
  self.width = width
  self.height = height
  self.pressed = false
  self.hover = false
end

-- These three functions are the effective 'interface' of interactables.
-- Other implementations (views) should not be expected to necessarily
-- contain other functions

function Interactable:update(mouse, dt)
  self.hover = self:compare_mouse(mouse)
end

function Interactable:mousePressed(point, button)
  self.pressed = self.hover
end

function Interactable:mouseReleased(point, button)
  self.pressed = false
end

-- Functions specific to the generic interactable implementation 
function Interactable:setPoint(point)
  if point then
    self.point = point:duplicate()
  else
    self.point = nil
  end
end

function Interactable:compareMouse(x, y)
  if self.point and x >= self.point.x and x < self.point.x + self.width and y >= self.point.y
      and y < self.point.y + self.height then
    return true
  else
    return false
  end
end

function Interactable:triggered()
  if self.pressed and self.hover then
    return true
  else
    return false
  end
end

