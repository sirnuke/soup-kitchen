-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Map = Class()
Map.__name = 'Map'

function Map:__init()
  self.data = {}
  for y = 1,C.map.size.width do
    local row = {}
    for x = 1,C.map.size.height do
      table.insert(row, Square:new(C.map.layout[y][x], x, y))
    end
    table.insert(self.data, row)
  end
  self.pawns = {}
end

function Map:get(quadrant)
  return self.data[quadrant.y][quadrant.x]
end

function Map:empty(quadrant)
  return not (self:occupied(quadrant) or self:blocked(quadrant))
end

function Map:occupied(quadrant)
  return self:get(quadrant):occupied()
end

function Map:blocked(quadrant)
  return self:get(quadrant):blocked()
end

function Map:jump(pawn, quadrant)
  Log(self, 'Jumping %s to %s', pawn, quadrant)
  assert(pawn and quadrant)
  assert(self:empty(quadrant),
    string.format("Cannot jump to %s: it's occupied or blocked!", quadrant))
  if self.pawns[pawn] then
    self:get(self.pawns[pawn]).pawn = nil
  end
  self.pawns[pawn] = quadrant
  self:get(quadrant).pawn = pawn
end

