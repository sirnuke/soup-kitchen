-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Map = Class()
Map.__name = 'Map'

function Map:__init(core)
  self.core = core
  self.data = {}
  for y = 1,C.map.size.width do
    local row = {}
    for x = 1,C.map.size.height do
      table.insert(row, Square:new(core, C.map.layout[y][x], x, y))
    end
    table.insert(self.data, row)
  end
end

function Map:draw()
  for y = 1,C.map.size.width do
    for x = 1,C.map.size.height do
      self.data[y][x]:draw()
    end
  end
end

