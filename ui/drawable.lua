-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Drawable = Class()
Drawable.__name = "Drawable"

-- Note that point is not duplicated.  The idea that the caller has setup
-- a dedicated point already when creating the Drawable.
function Drawable:__init(core, filename, point)
  assert(core and type(filename) == 'string' and point)
  self.image = Image:new(filename)
  self.core = core
  self.point = point
end

function Drawable:free()
  self.image:free()
  self.image = nil
end

function Drawable:draw()
  self.core.screen:draw(self.image.image, self.point)
end

