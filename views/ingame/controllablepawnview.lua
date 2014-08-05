-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

ControllablePawnView = PawnView:extends()
ControllablePawnView.__name = "ControllablePawnView"

function ControllablePawnView:__init(core, pawn)
  assert(core, pawn)
  ControllablePawnView.super.__init(self, core, pawn)
  self.selected = false
  self.overlay = Image:new("mapview/selected")
end

function ControllablePawnView:draw()
  local screen = self.pawn.coordinate:screen()
  self.core.screen:draw(self.image.data, screen)
  if self.selected then
    self.core.screen:draw(self.overlay.data, screen)
  end
end

function ControllablePawnView:mouseInBounds(point)
  local screen = self.pawn.coordinate:screen()
  if point.x >= screen.x and point.x < screen.x + C.map.pawn.width
    and point.y >= screen.y and point.y < screen.y + C.map.pawn.height then
    return true
  else
    return false
  end
end

function ControllablePawnView:select()
  self.selected = true
end

function ControllablePawnView:deselect()
  self.selected = false
end

function ControllablePawnView:moveTo(quadrant)
  assert(self.selected)
  Log(self, "Attempting to move to %s", quadrant)
  self.pawn:jump(quadrant)
end

