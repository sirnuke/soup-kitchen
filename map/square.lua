-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Square = Class()
Square.__name = 'Square'

function Square:__init(core, type, x, y)
  self.core = core
  self.quadrant = Quadrant:new(x, y)
  assert(self.quadrant:valid())
  if type == 'X' then
    self.type = 'blocked'
    self.image = Image:new('map/blocked.png')
  elseif type == ' ' then
    self.type = 'empty'
    self.image = Image:new('map/empty.png')
  else
    assert(false, string.format("Unknown map square type of '%s' at (%i,%i)", type, x, y))
  end
  self.screen = self.quadrant:screen()
end

function Square:draw()
  self.core.screen:draw(self.image.image, self.screen)
end

