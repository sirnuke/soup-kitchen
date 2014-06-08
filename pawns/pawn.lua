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
  self.coordinate = quadrant:coordinate()
  if not self.spawned then
    self.spawned = true
    self.drawable = Drawable:new(self.core, self.filename, self.coordinate:screen())
  end
  self.core.map:jump(self, quadrant)
end

function Pawn:move(quadrant)
end

function Pawn:draw()
  if not self.spawned then return end
  self.drawable:draw()
end

