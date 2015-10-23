--Explanation of these values:
--The game seems to treat every BPM below about 100 and above about 270 exactly the same.
--115 is about the lowest BPM where there will always be showing bar pieces.
--This is not necessarily true at 100 BPM, so a negative value is generated.
--155 is simply 270-115, the spread between 0 and 1. - tertu
local function CalculateBaseForBPM(bpm)
	return 1 - (clamp(bpm, 100, 300) - 115) / 155
end

local function UpdateBPMGauge(self)
	local maximumTwiddleDistance = 13/86
	--13/86 was chosen because it's roughly the height of two bar pieces -tertu
	local gauge = self:GetChild("bpm gauge bright")
	assert(gauge, "UpdateBPMGauge: Can't find the bright part of the BPM gauge.")
	if GAMESTATE then
		local song = GAMESTATE:GetCurrentSong()
		if song then
			--This function only handles the case where display BPM is constant.
			if song:IsDisplayBpmConstant() and not (song:IsDisplayBpmSecret() or song:IsDisplayBpmRandom()) then
				--This song has only one display BPM: show that value and randomly vibrate the tip around it
				--We have to finish tweening in case the last song was random
				gauge:finishtweening()
				local displayBpms = song:GetDisplayBpms()
				local displayBpm = displayBpms[1]
				local crop = CalculateBaseForBPM(displayBpm)
				crop = clamp(crop - (math.random() * maximumTwiddleDistance), 0, 1)
				gauge:croptop(crop)
			elseif not (song:IsDisplayBpmSecret() or song:IsDisplayBpmRandom()) then
				--This song has two display BPMs: read the current BPM off the BPMDisplay
				gauge:finishtweening()
				local bpmDisplay = SCREENMAN:GetTopScreen():GetChild("BPMDisplay")
				gauge:croptop(clamp(CalculateBaseForBPM(tonumber(bpmDisplay:GetText()) or 0), 0, 1))
			else
				if gauge:GetTweenTimeLeft()==0 then
					--This song has a random display BPM: shoot the indicator all the way up and down rapidly
					--I use a command because it's really difficult to do timed things in UpdateFunctions
					gauge:playcommand("Random")
				end
			end
			return
		end
	end
	--that is, the gauge should show zero which I think is correct behavior
	gauge:croptop(1)
end

local t = Def.ActorFrame{
	InitCommand=function(self) self:SetUpdateFunction(UpdateBPMGauge) end,
	Def.Sprite {
	Name="bpm gauge bright",
	Texture="bpm gauge",
		InitCommand=function(self)
			self:draworder(101):x(SCREEN_LEFT+76):y(SCREEN_CENTER_Y-5):visible(false)
		end,
		OnCommand=function(self)
			self:sleep(0.264):visible(true)
		end,
		OffCommand=function(self)
			self:sleep(0.033):accelerate(0.33):addx(-400)
		end,
		RandomCommand=function(self)
			self:croptop(1):linear(0.25):croptop(0):linear(0.25):croptop(1)
		end
	};
	LoadActor("SNDifficultyList.lua");
	Def.Sprite {
	Texture="help 1x3.png",
		InitCommand=function(self)
			self:draworder(100):x(SCREEN_RIGHT-200):y(SCREEN_BOTTOM-15)
			self:SetAllStateDelays(4.224)
		end,
		OnCommand=function(self)
			self:shadowlength(0):addy(999):sleep(0.6):addy(-999):diffuseblink():effectperiod(1.056)
		end,
		OffCommand=function(self)
			self:addy(999)
		end
	};
};

return t;