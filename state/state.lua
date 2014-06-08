-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

State = Class()
State.__name = 'State'

function State:__init(core)
  assert(core)
  self.core = core
  self.player = Coordinator:new(core.map)
end

