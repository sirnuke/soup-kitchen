-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Square = Class()
Square.__name = 'Square'

function Square:__init(type, x, y)
  self.quadrant = Quadrant:new(x, y)
  assert(self.quadrant:valid())
  if type == 'X' then
    self.type = 'blocked'
  elseif type == ' ' then
    self.type = 'empty'
  else
    assert(false, string.format('Unknown map square type of \'%s\' at (%i,%i)', type, x, y))
  end
end

