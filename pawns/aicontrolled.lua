-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

AIControlled = Pawn:extends()
AIControlled.__name = 'AI-Controlled'

function AIControlled:__init(map)
  AIControlled.super.__init(self, map, false)
end

