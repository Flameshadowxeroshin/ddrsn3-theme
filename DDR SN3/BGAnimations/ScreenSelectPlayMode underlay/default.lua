
local t = Def.ActorFrame{
--top
	LoadActor("rail")..{
		InitCommand=cmd(x,SCREEN_RIGHT-200;CenterY;cropbottom,1);
		OnCommand=cmd(linear,1;cropbottom,0.5);
		OffCommand=cmd(linear,1;cropbottom,1);
	};
--bottom
	LoadActor("rail")..{
		InitCommand=cmd(x,SCREEN_RIGHT-200;CenterY;croptop,1);
		OnCommand=cmd(linear,1;croptop,0.5);
		OffCommand=cmd(linear,1;croptop,1);
	};
};

return t;
