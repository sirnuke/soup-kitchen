-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

AIControlled = Pawn:extends()
AIControlled.__name = 'AI-Controlled'

function AIControlled:__init(map, id)
  AIControlled.super.__init(self,  map, id, false)
end

