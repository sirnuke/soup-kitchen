-- Soup Kitchen
-- Bryan DeGrendel (c) 2014
--
-- See LICENSE for licensing information

PlayerSidebar = Class()
PlayerSidebar.__name = "PlayerSidebar"

function PlayerSidebar:__init(core)
  self.core = core
  self.point = C.layout.ingame.playersidebar.point
  self.size = C.layout.ingame.playersidebar.size
  self.background = Drawable:new(core, 'ingame/player-sidebar', self.point)
end

function PlayerSidebar:draw()
  self.background:draw()
end

