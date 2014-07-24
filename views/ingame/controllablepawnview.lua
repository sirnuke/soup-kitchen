-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

ControllablePawnView = PawnView:extends()
ControllablePawnView.__name = "ControllablePawnView"

function ControllablePawnView:__init(core, pawn)
  assert(core, pawn)
  ControllablePawnView.super.__init(self, core, pawn)
end

