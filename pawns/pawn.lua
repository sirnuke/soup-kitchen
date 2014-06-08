-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Pawn = Class()
Pawn.__name = 'Pawn'

function Pawn:__init(core, filename)
  assert(core and type(filename) == 'string')
  self.filename = filename
  self.core = core
  self.quadrant = nil
  self.coordinate = nil
  self.spawned = false
end

function Pawn:jump(quadrant)
  assert(quadrant)
  self.quadrant = quadrant
  self.coordinate = quadrant:coordinate(C.map.pawn.width / 2, C.map.pawn.height / 2)
  Log(self, 'pawn coordinate is %s, compare to %s', self.coordinate, quadrant:coordinate())
  if not self.spawned then
    self.spawned = true
    self.interactable = Interactable:new(self.coordinate:screen(), C.map.pawn.width,
      C.map.pawn.height)
    self.drawable = Drawable:new(self.core, self.filename, self.interactable.point)
  end
  self.core.map:jump(self, quadrant)
end

function Pawn:move(quadrant)
end

function Pawn:draw()
  if not self.spawned then return end
  self.drawable:draw()
end

