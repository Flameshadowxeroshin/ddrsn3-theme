return Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(player,PLAYER_1;x,-240;y,77.5);
		LoadActor("1P_OK")..{
			OnCommand=cmd(zoomy,0);
			OffCommand=cmd(linear,0.1;zoomy,1;sleep,0.5;linear,0.1;zoomy,0);
		};
		LoadActor("left")..{
			OnCommand=cmd(diffusealpha,0;);
			OffCommand=cmd(diffusealpha,1;linear,0.1;addx,-10;linear,0.1;addx,10;sleep,0.2;zoomy,0);
		};
		LoadActor("right")..{
			OnCommand=cmd(diffusealpha,0;);
			OffCommand=cmd(diffusealpha,1;linear,0.1;addx,10;linear,0.1;addx,-10;sleep,0.2;zoomy,0);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(player,PLAYER_2;x,240;y,77.5);
		LoadActor("1P_OK")..{
			OnCommand=cmd(zoomy,0);
			OffCommand=cmd(linear,0.1;zoomy,1;sleep,0.5;linear,0.1;zoomy,0);
		};
		LoadActor("left")..{
			OnCommand=cmd(diffusealpha,0;);
			OffCommand=cmd(diffusealpha,1;linear,0.1;addx,-10;linear,0.1;addx,10;sleep,0.2;zoomy,0);
		};
		LoadActor("right")..{
			OnCommand=cmd(diffusealpha,0;);
			OffCommand=cmd(diffusealpha,1;linear,0.1;addx,10;linear,0.1;addx,-10;sleep,0.2;zoomy,0);
		};
	};
};