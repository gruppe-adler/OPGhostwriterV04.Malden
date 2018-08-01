
STHud_UIMode = 0;

/*
startFog=0.041335065;
startFogDecay=0.1;
startFogBase=30.393677;

startFog=0.81;
startFogDecay=0;
startFogBase=2.6;

endFog=0.15;
endFogDecay=1;
endFogBase=0;
*/

// camera stuff is async
[] spawn {
	
	_filmgrain = ppEffectCreate ["FilmGrain",2000];  
	_filmgrain ppEffectEnable true;  
	_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];  
	_filmgrain ppEffectCommit 0;

	private _startPosition = getPos camera_start;
	private _endPosition = getPos camera_end;
	private _endPosition2 = getPos camera_end2;
	_endPosition2 set [2, 1.4];
	
	_startPosition set [2, 0.3];
	_endPosition set [2, 1.4];
	_camTarget = _endPosition;

	_camera = "camera" camCreate _startPosition;
	_camera camSetTarget _camTarget;
	_camera cameraEffect ["internal","back"];
	_camera camSetFov 0.3;
	_camera camCommit 0;

	_camera camSetPos _camTarget;
	_camera camSetFov 0.15;
	_camera camCommit 45;

	sleep 42;
	/*
	_camera camSetPos _endPosition2;
	_camera camCommit 15;
	*/

	//sleep 12; // still moving forward while turning on player
	_camera camSetTarget player;
	_camera camCommit 3;
	sleep 3;
	_camera camSetPos [getPos player select 0, getPos player select 1, 1.7];
	_camera camCommit 5;
	sleep 4;
	cutText ["", "BLACK OUT", 1];
	sleep 1;
	_filmgrain ppEffectEnable false;   
	ppEffectDestroy _filmgrain; 
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
	sleep 1;
	cutText ["", "BLACK IN", 1];
	STHud_UIMode = 1;
};
cutText ["","BLACK FADED",999];
sleep 3;
cutText ["", "BLACK IN", 10];


playMusic "LeadTrack02_F_Jets";

sleep 14;

[
	[
		["0 P E R A T I 0 N   G H O S T W R i T E R","<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t align = 'center' shadow = '0' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t><br/>",25],
		["Taki + Nomi für Gruppe Adler","<br/><br/><t align = 'center' color='33ffffff' shadow = '0' size = '0.5'>%1</t>",50]
	]
] spawn BIS_fnc_typeText;



sleep 11;


[ "Morgens", format ["29.07.1987"]] spawn BIS_fnc_infoText;

sleep 10;

INTRO_DONE = true;
publicVariable "INTRO_DONE";

7 fadeMusic 0.25;