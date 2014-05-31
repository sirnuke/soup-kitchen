-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

require 'utilities/30logglobal'

require 'utilities/core'
require 'utilities/logging'

local tag = 'Main'

local function version_check()
  if not love.getVersion then
    Error(tag, 'love runtime is out of date! (requires 0.9.1+)')
  else
    local major, minor, revision = love.getVersion()
    Log(tag, 'love runtime is (%i.%i.%i)', major, minor, revision)
  end
end


function love.load()
  version_check()
end

