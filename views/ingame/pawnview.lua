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
  self.image = Image:new(string.format("pawns/%s", pawn.id))
end

function PawnView:draw()
  self.core.screen:draw(self.image.data, self.pawn.coordinate:screen())
end

function PawnView:update(dt)
end

