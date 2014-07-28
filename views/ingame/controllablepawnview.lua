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
end

function ControllablePawnView:mouseSelectedPressed(point)
  local screen = self.pawn.coordinate:screen()
  if point.x >= screen.x and point.x < screen.x + C.map.pawn.width
    and point.y >= screen.y and point.y < screen.y + C.map.pawn.height then
    if not self.selected then Log(self, "Selected!") end
    self.selected = true
  else
    if self.selected then Log(self, "Unselected!") end
    self.selected = false
  end
end

function ControllablePawnView:mouseMovementPressed(quadrant)
  if self.selected then
    -- TODO: Attempt to send pawn to this quadrand
  end
end

