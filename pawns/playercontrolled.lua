-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

PlayerControlled = Pawn:extends()
PlayerControlled.__name = 'PlayerControlled'

function PlayerControlled:__init(map)
  PlayerControlled.super.__init(self, map, true)
end

