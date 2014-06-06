-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Pawn = Class()
Pawn.__name = 'Pawn'

function Pawn:__init()
  self.quadrant = nil
  self.coordinate = nil
end

function Pawn:jump(quadrant)
end

function Pawn:move(quadrant)
end

function Pawn:spawned()
end

function Pawn:performDraw(img)
  if not self:spawned() then return end
end

