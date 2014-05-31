-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

C = require 'constants/constants'
Class = require 'utilities/30log'

require 'core'

require 'utilities/configuration'
require 'utilities/logging'

local tag = 'Main', core

local function version_check()
  if not love.getVersion then
    Error(tag, 'love runtime is out of date! (requires 0.9.1+)')
  else
    local major, minor, revision = love.getVersion()
    Log(tag, 'love runtime is (%i.%i.%i)', major, minor, revision)
  end
end

function love.load()
  if C.debug then Log(tag, 'debug mode is enabled') end
  version_check()
  core = Core(false)
end

