-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

local function _print(level, tag, msg, ...)
  io.write(string.format("[%s][%s]: %s\n", level, tostring(tag), string.format(msg, ...)))
end

function Error(tag, msg, ...)
  _print('E', tag, msg, ...)
end

function Warn(tag, msg, ...)
  _print('W', tag, msg, ...)
end

function Log(tag, msg, ...)
  _print('L', tag, msg, ...)
end

