-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

State = Class()
State.__name = 'State'

function State:__init(core)
  assert(core)
  self.core = core
  self.coordinator = Coordinator:new(core.map)
  self.controllables = { self.coordinator }
  self.pawns = { self.coordinator }
  self.time = Time:new()
end

function State:newDay()
  Log(self, "It's a new day!")
  self.coordinator:jump(Quadrant:new(5,5))
  self.time:newDay()
end

function State:update(dt)
end

