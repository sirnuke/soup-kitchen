-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Pawn = Class()
Pawn.__name = 'Pawn'

function Pawn:__init(map, id, controllable)
  assert(id and map and type(controllable) == 'boolean')
  self.id = id
  self.map = map
  self.quadrant = nil
  self.coordinate = nil
  self.destination = nil
  self.spawned = false
  self.controllable = controllable
end

function Pawn:jump(quadrant)
  assert(quadrant)
  self.quadrant = quadrant
  self.coordinate = quadrant:coordinate(C.map.pawn.width / 2, C.map.pawn.height / 2)
  Log(self, 'pawn coordinate is %s, compare to %s', self.coordinate, quadrant:coordinate())
  self.spawned = true
  self.map:move(self, quadrant)
end

function Pawn:move(quadrant)
  assert(quadrant)
  assert(self.quadrant and self.spawned, string.format("Cannot move %s, not spawned", self))
  self.destination = quadrant
  self.map:move(self, quadrant)
  local start = self.coordinate:quadrant()
  self:pathfind(quadrant)
end

function Pawn:initialQuadrants()
  -- TODO: Return self.coordinate:quadrant() + up to three quadrants that can be shortcutt'd to
end

function Pawn:pathfind(quadrant)
  local map = {}
  local queue = {self.quadrant:duplicate()}
  local head = nil
  local neighbors = nil
  while #queue > 0 do
    head = queue[1]
    if head == quadrant then break end
    table.remove(queue, 1)
    neighbors = self.map:neighbors(head)
    for i,neighbor in pairs(neighbors) do
      if not map[neighbor.y] then map[neighbor.y] = { } end
      if not map[neighbor.y][neighbor.x] then
        map[neighbor.y][neighbor.x] = head:duplicate()
        table.insert(queue, neighbor)
      end
    end
  end
  Log(self, "located %s @ %s from %s", quadrant, head, self.quadrant)
end

