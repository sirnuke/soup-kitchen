-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

PawnView = Class()
PawnView.__name = "PawnView"

function PawnView:__init(core, pawn)
  assert(core and pawn)
  self.core = core
  self.pawn = pawn
end

function PawnView:draw()
end

