-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Coordinator = PlayerControlled:extends()
Coordinator.__name = 'Coordinator'

function Coordinator:__init(map)
  Coordinator.super.__init(self, map, 'coordinator')
end

