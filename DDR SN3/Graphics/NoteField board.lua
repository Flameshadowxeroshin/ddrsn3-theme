--Lifted from default, appears to have been written by Kyzentun
local filter_color= color("0,0,0,1")

local args= {
	Def.Quad{
		InitCommand= function(self)
			self:hibernate(math.huge):diffuse(filter_color)
		end,
		PlayerStateSetCommand= function(self, param)
			local pn= param.PlayerNumber
			local style= GAMESTATE:GetCurrentStyle(pn)
			local alf= getenv("ScreenFilter"..ToEnumShortString(pn)) or 0
			local width= style:GetWidth(pn) + 8
			self:setsize(width, _screen.h*4096):diffusealpha(alf):hibernate(0)
		end,
	}
}

return Def.ActorFrame(args)
