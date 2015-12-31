local t = Def.ActorFrame {
};
if GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then
t[#t+1] = Def.ActorFrame {
	LoadActor("toasty_maskP1 Single")..{
		InitCommand=cmd(diffusealpha,0;zwrite,1;clearzbuffer,true;blend,Blend.NoEffect;;halign,1;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y;);
		StartTransitioningCommand=cmd(diffusealpha,0;linear,0.166;diffusealpha,1;sleep,1;linear,0.166;diffusealpha,0);
	};
	LoadActor("toastyP1_bg.png")..{
		InitCommand=cmd(diffusealpha,0;blend,Blend.Add;;halign,1;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y;);
		StartTransitioningCommand=cmd(ztest,true;diffusealpha,0;linear,0.166;diffusealpha,1;sleep,1;linear,0.166;diffusealpha,0);
	};
	LoadActor("toastyP1_bg.png")..{
		InitCommand=cmd(diffusealpha,0;blend,Blend.Add;;halign,1;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y;);
		StartTransitioningCommand=cmd(diffusealpha,0;sleep,0.066;linear,0.1;diffusealpha,0.8;linear,0.668;addx,56;linear,0.1;diffusealpha,0;sleep,0.1;addx,-56);
	};
	LoadActor("toastyP1.png")..{
		InitCommand=cmd(diffusealpha,0;;halign,1;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y+44;);
		StartTransitioningCommand=cmd(diffusealpha,0;sleep,0.066;linear,0.1;addy,-4;diffusealpha,1;linear,1;addy,-10;linear,0.1;addy,-4;diffusealpha,0;sleep,0.1;addy,18);
	};
	LoadActor("toastyP1_gradient.png")..{
		InitCommand=cmd(diffusealpha,0;blend,Blend.Add;;halign,1;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y;);
		StartTransitioningCommand=cmd(diffusealpha,0;sleep,0.166;linear,0.5;diffusealpha,0.8;linear,0.5;diffusealpha,0);
	};
};
elseif GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') and GAMESTATE:IsHumanPlayer('PlayerNumber_P2') == true and GAMESTATE:GetCurrentStyle() == "single" then
t[#t+1] = Def.ActorFrame {
	LoadActor("toasty_maskP2 Single")..{
		InitCommand=cmd(diffusealpha,0;zwrite,1;clearzbuffer,true;blend,Blend.NoEffect;;halign,0;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y;);
		StartTransitioningCommand=cmd(diffusealpha,0;linear,0.166;diffusealpha,1;sleep,1;linear,0.166;diffusealpha,0);
	};
	LoadActor("toastyP2_bg.png")..{
		InitCommand=cmd(diffusealpha,0;blend,Blend.Add;;halign,0;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y;);
		StartTransitioningCommand=cmd(ztest,true;diffusealpha,0;linear,0.166;diffusealpha,1;sleep,1;linear,0.166;diffusealpha,0);
	};
	LoadActor("toastyP2_bg.png")..{
		InitCommand=cmd(diffusealpha,0;blend,Blend.Add;;halign,0;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y;);
		StartTransitioningCommand=cmd(diffusealpha,0;sleep,0.066;linear,0.1;diffusealpha,0.8;linear,0.668;addx,56;linear,0.1;diffusealpha,0;sleep,0.1;addx,-56);
	};
	LoadActor("toastyP2.png")..{
		InitCommand=cmd(diffusealpha,0;;halign,0;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y+44;);
		StartTransitioningCommand=cmd(diffusealpha,0;sleep,0.066;linear,0.1;addy,-4;diffusealpha,1;linear,1;addy,-10;linear,0.1;addy,-4;diffusealpha,0;sleep,0.1;addy,18);
	};
	LoadActor("toastyP2_gradient.png")..{
		InitCommand=cmd(diffusealpha,0;blend,Blend.Add;;halign,0;x,SCREEN_WIDTH-280;y,SCREEN_CENTER_Y;);
		StartTransitioningCommand=cmd(diffusealpha,0;sleep,0.166;linear,0.5;diffusealpha,0.8;linear,0.5;diffusealpha,0);
	};
}
end

return t