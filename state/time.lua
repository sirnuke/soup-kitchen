-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

Time = Class()
Time.__name = 'Time'

function Time:__init()
  self.day = 0
  self:newDay()
end

function Time:newDay()
  self.day = self.day + 1
  self.clock = 0
end

