
STHud_UIMode = 0;
INTRO_CAM_ROTATION_1 = true;
INTRO_CAM_ROTATION_2 = true;

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
	
	_startPosition set [2, 0.9];
	_endPosition set [2, 1.3];
	_camTarget = _endPosition;

	private _camera = "camera" camCreate _startPosition;
	_camera camSetTarget _camTarget;
	_camera cameraEffect ["internal","back"];
	_camera camSetFov 0.3;
	_camera camCommit 0;

	_camera camSetPos _camTarget;
	_camera camSetFov 0.15;
	_camera camCommit 45;

	//hint "1";

	sleep 10;
	[
		[
			["0 P E R A T I 0 N   G H O S T W R i T E R","<br/><br/><br/><t align = 'center' shadow = '0' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t><br/>",25],
			["TAKI + NOMI FÜR GRUPPE ADLER","<br/><t align = 'center' color='#99d6d6d6' shadow = '0' size = '0.5'>%1</t>",50]
		]
	] spawn BIS_fnc_typeText;

	sleep 2;
	[getPos pos_flash1] spawn GRAD_missionControl_fnc_createFlash;

	sleep 3;
	[getPos pos_flash2] spawn GRAD_missionControl_fnc_createFlash;

	sleep 23;
	cutText ["", "BLACK OUT", 1];
	sleep 1;
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;

	private _handle = [BattleCatVehicle, 0, 100, 360,3,180,0.5,true] spawn GRAD_missionControl_fnc_rotatingCam;

	sleep 10;

	INTRO_CAM_ROTATION_1 = false;
	//hint "2";
	sleep 10;	

	INTRO_CAM_ROTATION_2 = false;
	//hint "3";
	waitUntil {scriptDone _handle};

	private _lastPosition = (getPos camera_end3);
	private _lastPosition2 = (getPos camera_end4);
	private _lastTarget = (getPos camera_target_end); 
	_lastPosition set [2,2];
	_lastPosition2 set [2,2];
	_lastTarget set [2,2];

	private _camera = "camera" camCreate _lastPosition;
	_camera cameraEffect ["internal","back"];
	showCinemaBorder true;
	_camera camSetPos _lastPosition;
	_camera camSetTarget _lastTarget;
	_camera camCommit 0;

	_camera camPreparePos _lastPosition2;
	_camera camSetTarget _lastTarget;
	_camera camSetFov 0.075;
	_camera camCommitPrepared 10;
	sleep 9;
	//hint "4";
	cutText ["", "BLACK OUT", 1];
	sleep 1;
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera; 

	_filmgrain ppEffectEnable false;   
	ppEffectDestroy _filmgrain; 

	sleep 1;
	cutText ["", "BLACK IN", 1];

	/*
	_camera camSetPos _endPosition2;
	_camera camCommit 15;
	*/

	//sleep 12; // still moving forward while turning on player
	/*
	_camera camSetTarget player;
	_camera camCommit 3;
	sleep 3;
	_camera camSetPos [getPos player select 0, getPos player select 1, 1.7];
	_camera camCommit 5;
	sleep 4;
	cutText ["", "BLACK OUT", 1];
	sleep 1;
	
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
	sleep 1;
	cutText ["", "BLACK IN", 1];
	*/
	STHud_UIMode = 1;
};
cutText ["","BLACK FADED",999];
sleep 3;
cutText ["", "BLACK IN", 10];


playMusic "LeadTrack02_F_Jets";