-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

PlayerControlled = Pawn:extends()
PlayerControlled.__name = 'PlayerControlled'

function PlayerControlled:__init(core, filename)
  PlayerControlled.super.__init(self, core, filename)
end

