-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Drawable = Class()
Drawable.__name = "Drawable"

-- Note that point is not duplicated.  The idea that the caller has setup
-- a dedicated point already when creating the Drawable.
function Drawable:__init(core, image, point)
  assert(core and image and point)
  if type(image) == 'string' then
    self.image = Image:new(image)
  elseif type(image) == 'table' and image:is(Image) then
    self.image = image
  else
    assert(false, string.format("Unknown Drawable image parameter %s", image))
  end
  self.core = core
  self.point = point
end

function Drawable:draw()
  self.core.screen:draw(self.image.data, self.point)
end

