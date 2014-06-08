-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Pawn = Class()
Pawn.__name = 'Pawn'

function Pawn:__init(map)
  assert(map)
  self.map = map
  self.quadrant = nil
  self.coordinate = nil
  self.spawned = false
end

function Pawn:jump(quadrant)
  assert(quadrant)
  assert(not self.map:occupied(quadrant),
    string.format("Cannot jump to %s: it's occupied!", quadrant))
  self.quadrant = quadrant
  self.coordinate = quadrant:coordinate()
  self.spawned = true
end

function Pawn:move(quadrant)
end

function Pawn:performDraw(img)
  if not self.spawned then return end
  assert(img)
end

