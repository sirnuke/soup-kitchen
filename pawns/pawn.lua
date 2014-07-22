-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Pawn = Class()
Pawn.__name = 'Pawn'

function Pawn:__init(map, controllable)
  assert(map and type(controllable) == 'boolean')
  self.map = map
  self.quadrant = nil
  self.coordinate = nil
  self.spawned = false
  self.controllable = controllable
end

function Pawn:jump(quadrant)
  assert(quadrant)
  self.quadrant = quadrant
  self.coordinate = quadrant:coordinate(C.map.pawn.width / 2, C.map.pawn.height / 2)
  Log(self, 'pawn coordinate is %s, compare to %s', self.coordinate, quadrant:coordinate())
  self.spawned = true
  self.map:jump(self, quadrant)
end

function Pawn:move(quadrant)
end

