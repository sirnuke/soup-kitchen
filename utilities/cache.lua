-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

ReferenceCounting = Class()
ReferenceCounting.__name = "ReferenceCounting"

function ReferenceCounting:__init(data)
  self.data = data
  self.refences = 0
end

function ReferenceCounting:reference()
  self.refences = self.refences + 1
end

function ReferenceCounting:dereference()
  self.refences = self.refences - 1
  if self.refences < 0 then
    Warn(self, 'references went below 0 on object %s', tostring(self.data))
  end
end

